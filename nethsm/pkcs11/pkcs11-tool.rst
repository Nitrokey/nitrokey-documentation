pkcs11-tool
===========

`pkcs11-tool <https://github.com/OpenSC/OpenSC/wiki/Using-pkcs11-tool-and-OpenSSL>`__ is a tool part of the `OpenSC <https://github.com/OpenSC/OpenSC>`__ project that can be used to manage keys on a PKCS#11 device.

You need to pass the location of the PKCS#11 module to use with the ``--module`` option: 

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so

Replace ``/usr/lib/nitrokey/libnethsm_pkcs11.so`` with the path where the NetHSM PKCS#11 module is located.

You can test if the module is working with the next command:

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --show-info

You should see something like this:

.. code-block:: 

  Cryptoki version 2.40
  Manufacturer     Nitrokey
  Library          Nitrokey PKCS#11 library (ver 0.1)


List Slots
----------

The information about the available slots.
The listed slots depend on the configuration of the slots array in the `p11nethsm.conf` configuration file.
To learn more about the configuration of slots, please refer to chapter `Configuration <setup.html#Configuration>`_.

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --list-slots

.. code-block::

  Slot 0 (0x0): NetHSM
    token label        : LocalHSM
    token manufacturer : Nitrokey GmbH
    token model        : NetHSM
    token flags        : rng, token initialized, PIN initialized
    hardware version   : 0.1
    firmware version   : 0.1
    serial num         : unknown
    pin min/max        : 0/0

.. note::
   If your configuration supports more than one slot, you may have to add the ``--slot <arg>`` option in pkcs11-tool commands to use the right one.

Key IDs
-------

pkcs11-tool uses an hexadecimal key ID to identify keys. NetHSM uses alphanumerical strings as key ID. NetHSM's PKCS#11 module uses the raw byte values of the string to form the PKCS#11 ID.
You can get the hexadecimal version of a NetHSM key with ``xxd``:

.. code-block:: bash
  
  echo -n "MyKey" | xxd -p

.. code-block::

  4d794b6579

You can then pass this hex value to pkcs11-tool with the ``--id`` option.

Generate a Key
--------------

Generate a key-pair and store it on the NetHSM.

.. note:: 
  The slot you want to use needs to have an andministrator user in the configuration file. Otherwise you will get a `CKR_USER_NOT_LOGGED_IN` error.

RSA
~~~

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --keypairgen --key-type rsa:2048 --label "MyKey"

ECDSA
~~~~~

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --keypairgen --key-type EC:prime256v1 --label "MyECKey"


AES/Generic
~~~~~~~~~~~

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --keygen --key-type GENERIC:256 --label "MyAESKey"

List Keys
---------

List the keys stored on the NetHSM.

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --list-objects

.. code-block::

  Using slot 0 with a present token (0x0)
  Public Key Object; RSA 2048 bits
    label:      rsakey
    ID:         7273616b6579
    Usage:      none
    Access:     none
  Private Key Object; RSA 
    label:      rsakey
    ID:         7273616b6579
    Usage:      decrypt, sign
    Access:     sensitive, always sensitive, never extractable

Read Keys
---------

Read the public key of a key-pair stored on the NetHSM.
It is not possible to read private keys from the NetHSM.

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --read-object --type pubkey --id 7273616b6579 --output-file rsakey.pub

The certificate of the key-pair can be read with the same command by changing the ``--type`` option to ``cert``.


.. note:: 
  The output is in DER format.

Write Keys
----------

Write a private key on the NetHSM. The public key is automatically derived from the private key.

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --write-object rsakey.key --type privkey --id 7273616b6579

The certificate of the key-pair can be written with the same command by changing the ``--type`` option to ``cert``.

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --write-object rsakey.crt --type cert --id 7273616b6579


Encrypt
-------

Encryption of data is only supported for AES keys.

.. code-block:: bash

    echo "NetHSM rulez!  " | pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --encrypt --id 4d794b6579 --mechanism AES_CBC --output-file encrypted.txt

.. note::
  You have to manually pad the input data to the block size of the AES key. 

Decrypt
-------

AES
~~~

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --decrypt --id 4d794b6579 --mechanism AES_CBC --input-file encrypted.txt

RSA
~~~

You can encrypt data with the public key and decrypt it with the private key.

.. code-block:: bash

  # get the public key first
  curl -s -u operator:opPassphrase -k -X GET https://localhost:8443/api/v1/keys/$KEYID/public.pem -o public.pem

  # encrypt some data with OpenSSL
  echo 'NetHSM rulez!NetHSM rulez!' | openssl pkeyutl -encrypt -pubin -inkey public.pem -pkeyopt rsa_padding_mode:oaep -pkeyopt rsa_oaep_md:sha256 -pkeyopt rsa_mgf1_md:sha256 -out data.crypt

.. code-block:: bash

    pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --decrypt --id 7273616b6579 --mechanism RSA_PKCS --input-file data.crypt

Sign
----

.. code-block:: bash

    echo "NetHSM rulez!" | openssl dgst -sha256 -binary |  pkcs11-tool --module /usr/lib/nitrokey/libnethsm_pkcs11.so --sign --id 7273616b6579 --mechanism RSA_PKCS-PSS --hash-algorithm SHA256 --output-file data.sig

To verify the signature with OpenSSL:

.. code-block:: bash

  # get the public key
  curl -s -u operator:opPassphrase -k -X GET https://localhost:8443/api/v1/keys/$KEYID/public.pem -o public.pem

  echo 'NetHSM rulez!' | openssl dgst -keyform PEM -verify public.pem -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature data.sig