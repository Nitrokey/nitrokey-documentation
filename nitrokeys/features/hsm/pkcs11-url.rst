PKCS#11 URL Generation
======================

.. contents:: :local:


Various applications use openssl to handle e.g., TLS certificates. 
This concept mostly allows simply replacing a file-path (for the secret)
with a so-called **PKCS#11 URL** to use a secret from a e.g., Nitrokey.

Preparation
-----------

* ensure ``openssl`` is installed

* ensure ``openssl`` can use the PKCS#11 engine by installing ``libengine-pkcs11-openssl``

.. code-block:
   openssl engine pkcs11 -t
   # expected good output:
   #
   # (pkcs11) pkcs11 engine
   #     [ available ]

* install ``opensc`` and ``gnutls-bin`` for necessary tools

* verify that your needed keys and/or certificates are available on your Nitrokey using ``pkcs15-tool -D``

* if you want to use ECC keys/mechanisms through ``libengine-pkcs11-openssl``, you'll have to ensure 
  its version is at least 0.4.10

List and Generate PKCS#11 URLs
------------------------------

Use the following command to get a list of available tokens (Nitrokeys):

.. code-block:: bash

   p11tool --list-tokens


Choose the token (Nitrokey) URL you want to generate URL tokens for and use it like this:

::

   p11tool --list-all <token-url>

   # example:
   # p11tool --list-all "pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0123123;token=UserPIN%20%28SmartCard-HSM%29"

If you inspect the tail of the URL you'll recognize: ``label``, ``id`` and
more, these can be partly removed as long as the necessary objects can be uniquely 
identified using the resulting URL, see :doc:`TLS Apache2 Configuration<apache2-tls>` 
for an example using ``id`` only.


