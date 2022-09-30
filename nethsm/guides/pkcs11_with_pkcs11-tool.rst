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

Encrypting & Decrypting
~~~~~~~~~~~~~~~~~~~~~~~

After creating a key (here: ID 42) with the according mechanism, you can use it for encryption and decryption,
but first you should create the key:

.. code-block:: bash

   $ KEYID=42

.. code-block:: bash

   $ HEXID=$(echo ${KEYID}'\c' | xxd -ps)

.. code-block:: bash

   $ curl -s -X GET https://nethsmdemo.nitrokey.com/api/v1/keys/$KEYID/public.pem -o public.pem

Now you can encrypt:

.. code-block:: bash

   $ echo 'NetHSM rulez!' | openssl pkeyutl -encrypt -pubin -inkey public.pem -pkeyopt rsa_padding_mode:oaep -pkeyopt rsa_oaep_md:sha512 -pkeyopt rsa_mgf1_md:sha512 -out encrypted.data


And decrypt:

.. code-block:: bash

   $ pkcs11-tool --module p11nethsm.so -v --decrypt --mechanism RSA-PKCS-OAEP --input-file encrypted.data --id $HEXID --hash-algorithm SHA512

Signing
~~~~~~~

First create the key again:

.. code-block:: bash

   $ KEYID=23

.. code-block:: bash

   $ HEXID=$(echo ${KEYID}'\c' | xxd -ps)

.. code-block:: bash

   $ curl -s -X GET https://nethsmdemo.nitrokey.com/api/v1/keys/$KEYID/public.pem -o public.pem

After creating a key (here: ID 23) with the according mechanism, you can use it for signing:

.. code-block:: bash

   $ echo 'NetHSM rulez!' | pkcs11-tool --module p11nethsm.so -v --sign --mechanism SHA512-RSA-PKCS-PSS --output-file sig.data --id $HEXID

.. code-block:: bash

   $ echo 'NetHSM rulez!' | openssl dgst -keyform PEM -verify public.pem -sha512 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature sig.data