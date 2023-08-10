OpenSSL
=======

NetHSM can be used as a backend for OpenSSL using the ``engine`` interface.

.. warning:: 
  When using an engine (libp11) version of 0.4.12 or older, having an EdDSA key on the NetHSM will cause OpenSSL to not find any key.

.. warning:: 
  Trying to retrieve the private key will crash, this is normal. You may want to retrieve the public key instead (see example below).

Setup
-----

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

Then you need to configure OpenSSL to use the engine. This is done by adding the following line to your ``openssl.cnf`` file:

.. code-block:: ini

  openssl_conf = openssl_init

  [openssl_init]
  engines=engine_section

  [engine_section]
  pkcs11 = pkcs11_section

  [pkcs11_section]
  engine_id = pkcs11
  dynamic_path = /usr/lib/x86_64-linux-gnu/engines-3/libpkcs11.so
  MODULE_PATH = /usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so
  init = 0

.. note:: 
  You can specify to OpenSSL the path of the OpenSSL configuration file using the ``OPENSSL_CONF`` environment variable.

Replace ``/usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so`` with the path to the PKCS#11 module you installed earlier.

Replace ``/usr/lib/x86_64-linux-gnu/engines-3/libpkcs11.so`` with the path to the OpenSSL engine you installed. The path varies depending on your distribution. The number in ``engines-3`` corresponds to your OpenSSL version. On Debian the path for the OpenSSL 3 engine is ``/usr/lib/x86_64-linux-gnu/engines-3/libpkcs11.so``; for Fedora it's ``/usr/lib64/engines-3/libpkcs11.so``.

Now you can use keys on the NetHSM by using `PKCS#11 URIs <https://www.rfc-editor.org/rfc/rfc7512>`__, example:

.. code-block:: 

  engine:pkcs11:pkcs11:object=webserver;type=private

This will use the key ``webserver``.


Example Commands
----------------

Retrieve the public key of an asymmetric key pair on the NetHSM :

.. code-block:: bash

  openssl pkey -engine pkcs11 -inform ENGINE -in "pkcs11:object=webserver;type=public" -pubout
