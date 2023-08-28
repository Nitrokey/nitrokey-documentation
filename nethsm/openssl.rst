OpenSSL
=======


.. warning:: 
  Trying to retrieve the private key will crash OpenSSL. This is normal because private keys cannot be extracted from a NetHSM. You may want to retrieve the public key instead (see example below).

Engine
------

.. warning:: 
  When using an engine (libp11) version of 0.4.12 or older, having an EdDSA key on the NetHSM will cause OpenSSL to not find any key.

The OpenSSL engine interface is the old way to implement custom backends for OpenSSL and it is deprecated in OpenSSL 3. This is still the most stable way to use the NetHSM with OpenSSL.

You will need to setup the PKCS#11 module, following `these instructions <pkcs11-setup.html>`__.

Install the engine:

.. tabs:: 
  .. tab:: Debian/Ubuntu

    .. code-block:: bash

        apt install libengine-pkcs11-openssl
  
  .. tab:: Fedora

    .. code-block:: bash

        dnf install openssl-pkcs11
  
  .. tab:: Arch Linux

    .. code-block:: bash

        pacman -S libp11

Next you need to configure OpenSSL to use the engine. This is done by adding the following lines to your ``openssl.cnf`` file:

.. code-block:: ini

  openssl_conf = openssl_init

  [openssl_init]
  engines = engine_section

  [engine_section]
  pkcs11 = pkcs11_section

  [pkcs11_section]
  engine_id = pkcs11
  dynamic_path = /usr/lib/x86_64-linux-gnu/engines-3/libpkcs11.so
  MODULE_PATH = /usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so
  init = 0

.. note:: 
  You can specify to OpenSSL the path of the OpenSSL configuration file using the ``OPENSSL_CONF`` environment variable.

.. warning:: 
  If the main OpenSSL configuration file is modified to contain only these lines, it could break other programs using OpenSSL. Thus, you may want to create a separate configuration file for the engine.

Replace ``/usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so`` with the path to the PKCS#11 module you installed earlier.

Replace ``/usr/lib/x86_64-linux-gnu/engines-3/libpkcs11.so`` with the path to the OpenSSL engine you installed. The path varies depending on your distribution. The number in ``engines-3`` corresponds to your OpenSSL version. On Debian the path for the OpenSSL 3 engine is ``/usr/lib/x86_64-linux-gnu/engines-3/libpkcs11.so``; for Fedora it's ``/usr/lib64/engines-3/libpkcs11.so``.

Now you can use keys on the NetHSM by using `PKCS#11 URIs <https://www.rfc-editor.org/rfc/rfc7512>`__, example:

.. code-block:: 

  engine:pkcs11:pkcs11:object=webserver;type=private

This will use the key ``webserver``.

.. note:: 
  You can use the ``p11tool`` command from `GnuTLS <https://gnutls.org/>` get the full URI of the keys: 

  .. code-block:: bash

    p11tool --provider /usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so --list-all

Example Command
~~~~~~~~~~~~~~~

Retrieve the public key of an asymmetric key pair on the NetHSM :

.. code-block:: bash

  openssl pkey -engine pkcs11 -inform ENGINE -in "pkcs11:object=webserver;type=public" -pubout


Provider
--------

The OpenSSL provider interface is the new way to implement custom backends for OpenSSL. The `pkcs11-provider backend <https://github.com/latchset/pkcs11-provider>`__ is still in an early stage of development.

You will need to setup the PKCS#11 module, following `these instructions <pkcs11-setup.html>`__.

Install the provider. For Fedora a package named ``pkcs11-provider`` exists. For other Linux distributions you will need to `build it from source <https://github.com/latchset/pkcs11-provider/blob/main/BUILD.md>`__.

Then you need to configure OpenSSL to use the provider. This is done by adding the following lines to your ``openssl.cnf`` file:

.. code-block:: ini

  openssl_conf = openssl_init

  [openssl_init]
  providers = provider_sect

  [provider_sect]
  pkcs11 = pkcs11_sect

  [pkcs11_sect]
  module = /home/sautax/git/pkcs11-provider/src/.libs/pkcs11.so
  pkcs11-module-path = /usr/lib/libnethsm_pkcs11.so
  activate = 1

Set ``module`` to the path of the provider you installed and ``pkcs11-module-path`` to the path of the PKCS#11 module you installed.

If you want to set NetHSM as the default provider, you can add ``default = pkcs11`` to the ``provider_sect`` section.

.. note:: 
  You can specify to OpenSSL the path of the OpenSSL configuration file using the ``OPENSSL_CONF`` environment variable.


.. warning:: 
  If the main OpenSSL configuration file is modified to contain only these lines, it could break other programs using OpenSSL. Thus, you may want to create a separate configuration file for the provider.

Then you can use keys on the NetHSM by using `PKCS#11 URIs <https://www.rfc-editor.org/rfc/rfc7512>`__, example:

.. code-block:: bash

  openssl pkey -provider pkcs11 -in "pkcs11:object=rsakey" -pubout

If you set NetHSM as the default provider, you can omit the ``-provider pkcs11`` argument.

.. note:: 
  Currently when manually setting a key type in the URI the provider will not be able to find the key. You can omit the ``;type=private`` or ``;type=public`` part of the URI to make it work.
