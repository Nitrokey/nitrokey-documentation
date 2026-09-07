Keycloak
========

In order to use `Keycloak <https://www.keycloak.org/>`__ with NetHSM to securely store private keys in NetHSM while enabling Keycloak to sign access tokens and decrypt JWE, you need to install and configure `this key provider <https://github.com/Nitrokey/nethsm-keycloak>`__ as follows:

Quality Warning
---------------

**This Keycloak provider has been developed and reviewed entirely by an AI. It has been tested successfully by unit tests and integration tests. The code has not been reviewed by a human yet and therefore use it at your own risk.**

Prepare the NetHSM
------------------

Prepare the NetHSM as follows. Refer to section `administration <../administration.html>`__ for detailed instructions.

- If NetHSM uses a self-signed certificate, record its fingerprint:

  .. code-block:: bash

     echo | openssl s_client -connect $NETHSM_HOST 2>/dev/null \
       | openssl x509 -fingerprint -sha256 -noout

- `Create an Operator user <../administration.html#user-management>`__ dedicated for Keycloak.
- The Keycloak extension *discovers* keys but doesn't create them. `Create the desired keys <../operation.html#key-management>`__ manually:

  - **The key ID** must begin with the prefix the realm will claim. Choose an appropriate
    naming scheme such as ``kc-<realm>-<purpose>-<year>`` (for example
    ``kc-staff-sig-rs256-2026``, ``kc-partners-sig-es256-2026``,
    ``kc-customers-enc-oaep-2026``). The ID becomes the ``kid`` that Keycloak publishes.
    Future key rotation is performed by adding new IDs which is why we suggest to use the
    year as part of the key ID.

  - **The mechanisms** determine which JOSE algorithms the key can serve:

    .. list-table::
       :header-rows: 1
       :widths: 45 55

       * - NetHSM key type and mechanism
         - JOSE algorithms served
       * - ``RSA`` + ``RSA_Signature_PKCS1``
         - RS256, RS384, RS512 — hash-agnostic, so one key covers all three
       * - ``RSA`` + ``RSA_Signature_PSS_SHA256`` / ``_SHA384`` / ``_SHA512``
         - PS256 / PS384 / PS512 — only the algorithm the mechanism names
       * - ``EC_P256`` / ``EC_P384`` / ``EC_P521`` + ``ECDSA_Signature``
         - ES256 / ES384 / ES512 — the curve determines the algorithm
       * - ``Curve25519`` + ``EdDSA_Signature``
         - EdDSA
       * - ``RSA`` + ``RSA_Decryption_OAEP_SHA1`` / ``_SHA256``
         - RSA-OAEP / RSA-OAEP-256, for decrypting inbound JWE


Installation
------------

Download the Keycloak NetHSM provider `JAR file <https://github.com/Nitrokey/nethsm-keycloak/releases>`__, save it in Keycloak's provider folder e.g. ``/opt/keycloak/providers/``

Rebuild the provider registry: ``/opt/keycloak/bin/kc.sh build``


Configuration
-------------

Settings may be given either in ``conf/keycloak.conf`` or as environment variables. The
two forms are the same settings; environment variables take precedence, so non-secret
values can live in the file with only the passphrase injected at runtime.

Using ``conf/keycloak.conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: properties

   spi-keys--nethsm--url=https://nethsm.internal:8443/api/v1
   spi-keys--nethsm--username=keycloak
   spi-keys--nethsm--passphrase=<passphrase>
   spi-keys--nethsm--tls-fingerprints=aabbcc...

Using environment variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Preferred in container deployments, because the passphrase can be supplied from a
Docker or Kubernetes secret instead of being written to a file.

.. code-block:: bash

   KC_SPI_KEYS__NETHSM__URL=https://nethsm.internal:8443/api/v1
   KC_SPI_KEYS__NETHSM__USERNAME=keycloak
   KC_SPI_KEYS__NETHSM__PASSPHRASE="<passphrase>"
   KC_SPI_KEYS__NETHSM__TLS_FINGERPRINTS=aabbcc...

.. note::

   The environment variable name is derived mechanically from the configuration key:
   prefix it with ``KC_``, convert to upper case, and replace every ``-`` with ``_``.
   The doubled underscores follow from the key's structure,
   ``spi-<spi-name>--<provider-id>--<option>``, which for this extension is SPI
   ``keys``, provider ``nethsm``, and the option name.

See also `all available configuration options <https://github.com/Nitrokey/nethsm-keycloak>`__.


Restart Keycloak
----------------

The connection profile is read once, when the provider factory initialises. Restart
Keycloak.


Confirm the server configuration
--------------------------------

Check the startup log before configuring any realm. This separates a connection or
credential problem from a realm configuration problem.

On success:

.. code-block:: text

   NetHSM key provider ready: 1 instance(s), user 'keycloak',
   discovery cache PT5M, on-unavailable fail

Otherwise:

.. list-table::
   :header-rows: 1
   :widths: 50 50

   * - Log message
     - Cause
   * - No message, or a debug line stating the provider is inactive
     - ``url`` is not set
   * - ``NetHSM is not reachable or not Operational at startup``
     - Wrong address, blocked by a firewall, certificate pin mismatch, or the NetHSM is
       Locked or unprovisioned
   * - ``NetHSM rejected the configured credential with HTTP 401``
     - Wrong username or passphrase


Add the provider to a realm
---------------------------

In the admin console, go to *Realm Settings → Keys → Providers*, choose **Add provider**,
and select ``nethsm``.

.. list-table::
   :header-rows: 1
   :widths: 26 74

   * - Field
     - Meaning
   * - Key use
     - ``sig`` to sign tokens, ``enc`` to decrypt inbound JWE
   * - Key ID prefix
     - Every NetHSM key whose ID begins with this string is published by this realm
   * - Algorithm
     - The algorithm these keys are published under
   * - Priority
     - See `Set the priority above 100`_
   * - Enabled / Active
     - Both must be on for a key that should sign

One component publishes one algorithm, mirroring Keycloak's built-in key providers. A
realm that needs both RS256 and ES256 therefore has two components. Keys under the
prefix that cannot serve the chosen algorithm are skipped, so a prefix may safely match
a mixed set of keys.

.. caution::

   Do not point two components at the same key with different algorithms. Both would
   publish a JWKS entry under the same ``kid``.


Set the priority above 100
--------------------------

.. important::

   A newly created realm contains four generated key providers — ``rsa-generated``,
   ``rsa-enc-generated``, ``hmac-generated`` and ``aes-generated`` — all with priority
   **100**. The NetHSM component must have a higher priority, otherwise Keycloak
   continues signing with a generated software key and the configuration appears to work.

A value of ``200`` for NetHSM is a reasonable default.


Select the algorithm for the realm
----------------------------------

Set *Realm Settings → Tokens → Default Signature Algorithm* to the algorithm configured
on the component. If the realm requests an algorithm the component does not publish,
Keycloak falls back to a generated key without reporting an error.


Verify
------

List the published keys:

.. code-block:: bash

   curl -s https://<keycloak-host>/realms/<realm>/protocol/openid-connect/certs

The ``kid`` values should be the NetHSM key IDs.

The conclusive check is an issued token. Request one and decode its header:

.. code-block:: bash

   curl -s \
     -d "client_id=<client>" \
     -d "client_secret=<secret>" \
     -d "grant_type=client_credentials" \
     https://$NETHSM_HOST/realms/<realm>/protocol/openid-connect/token \
   | python3 -c 'import sys, json, base64
   header = json.load(sys.stdin)["access_token"].split(".")[0]
   print(json.loads(base64.urlsafe_b64decode(header + "==")))'

If ``kid`` is the NetHSM key ID, the signature was produced inside the HSM.
You could also watch NetHSM's log in parallel which should show an appropriate call.


Plan for NetHSM being unavailable
---------------------------------

If NetHSM cannot be reached and no key metadata is
cached, the realm has no usable keys and token issuance fails, rather than falling back
to a generated software key.

.. warning::

   If a realm's default signature algorithm is served by NetHSM keys and the NetHSM
   becomes unreachable, administrative tokens for that realm cannot be issued either.
   The admin API is then unavailable for fixing the problem.

   Recovery is through server configuration rather than the admin console: set
   ``spi-keys--nethsm--on-unavailable=degrade`` and restart, or disable the component.

For this reason, configure a test realm first and leave the ``master`` realm on
Keycloak's own generated keys, so that the admin console remains reachable.


Further Details
---------------

You find further details `here <https://github.com/Nitrokey/nethsm-keycloak>`__.
