PKCS#11 with pkcs11-tool
========================

This guide describes the use of the PKCS#11 driver for the NetHSM.
The guide uses tools from `OpenSC <https://github.com/OpenSC/OpenSC>`__.
Please refer to their documentation to learn how to use them on your operating system.

.. important::
   This driver is still an early Proof of Concept implementation that only implements the
   functions that are necessary for operating TLS servers.

Installation
------------

Install precompiled library
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Download an archive with the latest release from the `releases page <https://github.com/Nitrokey/nethsm-pkcs11/releases>`__ of the repository.
   Use the release archive which contains the name of your operating system in the title.

2. Extract the files from the downloaded archive with an archiving programm of your choice.

3. Copy the extracted library to the respective path in your operating system.
   The path depends on your installation and configuration of OpenSC.

Compile from source code
~~~~~~~~~~~~~~~~~~~~~~~~

.. important::
   This driver can only be compiled with the official Go compiler.
   Do not use the GNU Go compiler (GCC-Go).
   Please refer to their `website <https://go.dev/doc/install>`__ to learn how to install it.

1. Download an archive with the latest release from the `releases page <https://github.com/Nitrokey/nethsm-pkcs11/releases>`__ of the repository.
   Use the release archive which contains `Source code` in the title.
2. Extract the files from the downloaded archive with an archiving programm of your choice.
3. In the directory with the extracted source code execute the following command to compile the library.

   .. tabs::
      .. tab:: Linux
         .. code-block:: bash

            ./build.sh
      .. tab:: MacOS
         .. code-block:: bash

            ./build.sh

4. Copy the extracted library to the respective path in your operating system.
   The path depends on your installation and configuration of OpenSC.

Configuration
-------------

The configuration file `p11nethsm.conf` is required and used to configure the connection between the PKCS#11 driver and the NetHSM.

An example configuration file looks like follows.

.. tabs::
   .. tab:: Linux and MacOS
      .. code-block:: yaml

         YAML 1.1
         ---
         p11nethsm:
           logfile: /tmp/p11nethsm.log
           maxsessioncount: 5
           debug: true
           slots:
           - label: NetHSM1
             description: NetHSM Zone A
             url: "https://nethsmdemo.nitrokey.com/api/v1"
             # certSHA256:
             #   - "0C:66:DC:EB:4D:12:C3:24:FC:82:F4:1D:4C:16:44:12:1D:00:79:FF:36:96:65:E2:21:C4:36:94:F7:8E:22:89"
             user: "operator"
             password: "env:NETHSM_PASS"

      Modify the configuration file `p11nethsm.conf` according to your environment.

      The configuration file can include multiple slots, inside the `slots` array.
      The slots represent multiple NetHSM deployments.
      The `label` field of a slot needs to contain a unique name.
      The `url`, `user`, and `password` keys are mandatory.
      For security reasons it is recommended to pass the password in an environment variable.
      For this the `env:NETHSM_PASS` is passed in the `password` key, where `NETHSM_PASS` is the name of the environment variable containing the password.
      The `certSHA256` key needs to be set if the TLS certificate is not signed by a Certificate Authority (CA) contained in the certificate store of the operating system.

The configuration file needs to be saved either in the following paths or in the directory the application is executed.

.. tabs::
   .. tab:: Linux and MacOS
      - `$HOME/.nitrokey`
      - `/etc/nitrokey/`

Key Management
--------------

Info
~~~~

Show information about the cryptoki version, and the PKCS#11 driver.

.. code-block:: bash

   $ pkcs11-tool --module p11nethsm.so --show-info

.. code-block::

   Cryptoki version 2.40
   Manufacturer     Nitrokey GmbH
   Library          NetHSM PKCS#11 module (ver 0.1)
   Using slot 0 with a present token (0x0)

List Slots
~~~~~~~~~~

The information about the available slots.
The listed slots depend on the configuration of the slots array in the `p11nethsm.conf` configuration file.
To learn more about the configuration of slots, please refer to chapter `Configuration <pkcs11_with_pkcs11-tool.html#configuration>`_.

.. code-block:: bash

   $ pkcs11-tool --module p11nethsm.so --list-slots

.. code-block::

   Available slots:
   Slot 0 (0x0): NetHSM Zone A
     token label        : NetHSM1
     token manufacturer : Nitrokey GmbH
     token model        : NetHSM
     token flags        : rng, token initialized, PIN initialized, readonly
     hardware version   : 0.1
     firmware version   : 0.1
     serial num         : 0
     pin min/max        : 3/256

.. note::
   If your configuration supports more than one slot, you maybe have to add the `--slot <arg>` option in pkcs11-tool commands to use the right one.

Generate Key
~~~~~~~~~~~~

Generate a key-pair and store it on the NetHSM.

.. note::
   The PKCS#11 driver currently does not support this feature.
   A key-pair can be generated with *nitropy* or a REST API request.
   To learn more about how to generate a key, please refer to chapter `Generate Key <../operation.html#generate-key>`_.

List Keys
~~~~~~~~~

Show information about the keys and certificates in the *Key Store* on a NetHSM.

.. code-block:: bash

   $ pkcs11-tool --module p11nethsm.so --list-objects

.. code-block::

   Using slot 0 with a present token (0x0)
   Private Key Object; RSA 
     label:      myFirstKey
     ID:         6d7946697273744b6579
     Usage:      decrypt, sign
     Access:     sensitive, always sensitive, never extractable
   Public Key Object; RSA 0 bits
     label:      myFirstKey
     ID:         6d7946697273744b6579
     Usage:      none
     Access:     none

Read Keys
~~~~~~~~~

Read keys and certificates from the *Key Store* on a NetHSM.
It is not possible to read private keys from the NetHSM.

The public key of a key-pair can be read as follows.

.. code-block::

   $ pkcs11-tool --module p11nethsm.so --read-object --type pubkey --label myFirstKey -o public.key

The certificate of a key-pair can be read as follows.

.. code-block::

   $ pkcs11-tool --module p11nethsm.so --read-object --type cert --label myFirstKey -o public.key

The returned certificates or public keys are ASN.1 encoded.
The data can be decoded with the *dumpasn1* tool, as it contains data in DER format.
The DER format can be converted to PEM format with OpenSSL.

Write Keys
~~~~~~~~~~

Write keys and certificates to the *Key Store* on a NetHSM.

The private key of a key-pair can be wrote as follows.

.. code-block::

   $ pkcs11-tool --module p11nethsm.so --write-object secret.key --type privkey --label myFirstKey

The public key of a key-pair can be wrote as follows.

.. code-block::

   $ pkcs11-tool --module p11nethsm.so --write-object public.key --type pubkey --label myFirstKey

The certificate of a key-pair can be wrote as follows.

.. code-block::

   $ pkcs11-tool --module p11nethsm.so --write-object cert.pub --type cert --label myFirstKey

Key Operations
--------------

Encrypt
~~~~~~~

The NetHSM can not encrypt data with asymmetric keys, but it provides the public key which can be used for encryption.
Please refer to chapter `Show Key Details <operation.html#show-key-details>`__,
or retrieve the key as described in chapter `Read Keys <pkcs11_with_pkcs11.html#read-keys>`,
to learn more about how to retrieve the public key. The example assumes the public key in the `public.pem` file.

Data can be encrypted with OpenSSL as follows.

.. code-block:: bash

   $ echo 'NetHSM rulez!' | openssl pkeyutl -encrypt -pubin \
      -inkey public.pem \
      -pkeyopt rsa_padding_mode:oaep \
      -pkeyopt rsa_oaep_md:sha512 \
      -pkeyopt rsa_mgf1_md:sha512 \
      -out encrypted.data

Decrypt
~~~~~~~

The NetHSM can decrypt data for a private key stored in the *Key Store* on the NetHSM.
This example uses the encrypted message from the previous chapter `Encrypt <pkcs11_with_pkcs11-tool.html#encrypt>`__.

.. code-block:: bash

   $ pkcs11-tool --module p11nethsm.so --decrypt \
      --mechanism RSA-PKCS-OAEP \
      --input-file encrypted.data \
      --label myFirstKey \
      --hash-algorithm SHA512

.. code-block::

   NetHSM rulez!

Sign
~~~~

The NetHSM can sign data for a private key stored in the *Key Store* on the NetHSM.
For signatures with a RSA and ECDSA key, a digest must be calculate first.

To calculate a digest the data is required first. A message is created as follows.

.. code-block:: bash

   $ echo 'NetHSM rulez!' | pkcs11-tool --module p11nethsm.so \
      --sign \
      --mechanism SHA512-RSA-PKCS-PSS \
      --output-file sig.data \
      --label myFirstKey

The created signature can be verified with OpenSSL as follows.

.. code-block:: bash

   $ echo 'NetHSM rulez!' | openssl dgst -keyform PEM \
      -verify public.pem \
      -sha512 \
      -sigopt rsa_padding_mode:pss \
      -sigopt rsa_pss_saltlen:-1 \
      -signature sig.data