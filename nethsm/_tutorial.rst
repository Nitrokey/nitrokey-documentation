.. start:: setup
Before we start, we store the host name of the NetHSM instance in the
``NETHSM_HOST`` environment variable.  You can use the public NetHSM demo
instance ``nethsmdemo.nitrokey.com`` or run a local demo instance using the
NetHSM docker image, see the `Development and Testing
</index.html#development-and-testing>`_ section of the NetHSM documentation.

::

    $ export NETHSM_HOST="localhost:8443"

.. end

info about self-signed certificates

.. start:: info
First, let’s see what we have here:
.. end

GET /info

.. start:: state
See what the device’s status is:
.. end

GET /state

.. start:: provision
Initialization
--------------

A new NetHSM needs to be provisioned first with passphrases and the
current time. The *Admin Passphrase* is the *Administrator*’s
passphrase, which is the super user of the NetHSM. The *Unlock
Passphrase* is used to encrypt NetHSM’s confidential data store.

.. note::

   The NetHSM demo instance at ``nethsmdemo.nitrokey.com`` is already
   provisioned.
.. end

GET /provision

.. start:: boot-mode
NetHSM can be used in *Attended Boot* mode and *Unattended Boot* mode.

-  In *Attended Boot* mode the *Unlock Passphrase* needs to be entered
   during each start which is used to encrypt the data store. For
   security reasons this mode is recommended.
-  In *Unattended Boot* mode no Unlock Passphrase is required, therefore
   the NetHSM can start unattended and the data store is stored
   unencrypted. Use this mode if your availability requirements can’t be
   fulfilled with *Attended Boot* mode.

Retrieve the current mode:
.. end

GET /config/unattended-boot

.. start:: unattended-boot-on
Switch to *Unattended Boot* mode:
.. end

POST /config/unattended-boot on

.. start:: unattended-boot-off
Or switch back to *Attended Boot* mode:
.. end

POST /config/unattended-boot off

.. start:: user-management
User Management
---------------
.. end

.. start:: roles
Roles
~~~~~

Separation of duties can be implemented by using the available Roles.
Each user account configured on the NetHSM has one of the following
Roles assigned to it. Following is a high-level description of the
operations allowed by individual Roles, for endpoint-specific details
please refer to the REST API documentation.

-  *R-Administrator*: A user account with this Role has access to all
   operations provided by the REST API, with the exception of key usage
   operations, i.e. message signing and decryption.
-  *R-Operator*: A user account with this Role has access to all key
   usage operations, a read-only subset of key management operations
   and user management operations allowing changes to their own account
   only.
-  *R-Metrics*: A user account with this Role has access to read-only
   metrics operations only.
-  *R-Backup*: A user account with this Role has access to the operations
   required to initiate a system backup only.

Note: In a future release another Role will be implemented which is allowed to /keys/ POST, /keys/generate POST, /keys/{KeyID} PUT & DELETE, /keys/{KeyID}/cert PUT & DELETE in addition to what R-Operator is allowed to do.
.. end

.. start:: add-user
Create a User
~~~~~~~~~~~~~

Now create a new user with the operator role that can be used to sign and
decrypt data.  Note that the NetHSM assigns a random user ID if we don’t
specify it.
.. end

PUT /users/operator

.. start:: key-management
Key Management
--------------

The NetHSM supports RSA, ED25519 and ECDSA keys.  When creating a key, you have
to select both the key algorithm and the key mechanisms to use.  RSA keys can
be used for decryption (with the modes raw, PKCS #1 and OAEP with MD5, SHA1,
SHA224, SHA256, SHA384 or SHA512) and for signatures (with the modes PKCS #1
and PSS with MD5, SHA1, SHA224, SHA256, SHA384 or SHA512).  The other
algorithms only support the signature mechanism.

For a complete list of available key algorithms and key mechanisms, see the API
documentation for the KeyAlgorithm_ and KeyMechanism_ types.

.. _KeyAlgorithm: https://nethsmdemo.nitrokey.com/api_docs/index.html#docs/type/#115
.. _KeyMechanism: https://nethsmdemo.nitrokey.com/api_docs/index.html#docs/type/#22

.. end

.. start:: generate-key
Generate Keys
~~~~~~~~~~~~~

In this guide, we want to use an RSA key to decrypt data using PKCS #1 and to
sign data with PSS using SHA256.  So let’s generate a new key on the NetHSM.
Make sure to use the ``RSA`` algorithm and to select the
``RSA_Signature_PSS_SHA256`` and ``RSA_Decryption_PKCS1`` key mechanisms.  If
you don’t specify a key ID, the NetHSM will generate a random ID for the new
key.
.. end

POST /keys/generate

.. start:: import-key
Import Keys
~~~~~~~~~~~

Instead of generating a key on the NetHSM, you can also import existing private
keys into the NetHSM:
.. end

PUT /keys/mySecondKey

.. start:: list-keys
List Keys
~~~~~~~~~

To make sure that the key has been created and has the correct algorithm and
mechanism settings, we can query all keys on the NetHSM:
.. end

GET /keys

.. start:: get-key
.. _Show Key Details:

Show Key Details
~~~~~~~~~~~~~~~~

We can also query the public key of the generated key pair:
.. end

GET /keys/myFirstKey

.. start:: get-key-file
To be able to use the key with ``openssl``, we export it as a PEM file and
store it as ``public.pem``:
.. end

GET /keys/myFirstKey/public.pem

.. start:: inspect-key
We can inspect the key with ``openssl`` and use it for encryption or signature
verification (as described in the next section):

::

    $ openssl rsa -in public.pem -pubin -text
    RSA Public-Key: (2048 bit)
    Modulus:
        00:c3:56:f5:09:cc:a9:3e:ca:16:2e:fb:d2:8b:9d:
        a9:33:5a:87:8f:3f:7a:bb:8a:3d:62:9b:5d:56:84:
        95:97:bb:97:f0:77:e2:c8:59:f2:b5:c6:b7:f5:b3:
        76:69:a3:e8:f6:b7:35:f4:3c:52:6d:3c:a0:b6:a1:
        e4:1a:32:05:1d:51:68:21:7d:fc:53:69:ec:bc:0b:
        a0:db:63:b2:0e:47:00:03:4d:98:1f:ab:c0:7b:2e:
        3c:8f:b6:36:ff:f0:db:80:26:f0:a6:af:30:2f:7b:
        16:fd:5c:db:0f:2c:54:8a:26:2b:db:3d:78:49:4b:
        7b:d1:60:ea:a7:f0:b4:5e:fc:33:ff:57:f8:83:fd:
        12:64:8f:29:d1:94:96:9a:15:18:5d:04:ca:1c:29:
        44:ad:42:31:c5:80:38:4c:eb:3b:b8:7e:17:27:5c:
        69:a8:88:44:ea:d1:82:64:fe:51:31:47:97:a7:a9:
        87:c3:13:c9:00:7a:b9:fb:6f:cc:66:4c:07:d7:68:
        fa:78:68:9a:e7:87:1e:94:c6:27:92:5f:f2:7d:11:
        44:11:b5:39:35:59:2c:cd:f9:4f:59:e3:56:93:1f:
        94:20:fd:6b:23:0d:15:e6:4e:bb:84:a8:a5:0d:9f:
        1c:90:ab:a8:10:04:50:12:c1:80:02:94:85:78:df:
        d6:b3
    Exponent: 65537 (0x10001)
    writing RSA key
    -----BEGIN PUBLIC KEY-----
    MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw1b1CcypPsoWLvvSi52p
    M1qHjz96u4o9YptdVoSVl7uX8HfiyFnytca39bN2aaPo9rc19DxSbTygtqHkGjIF
    HVFoIX38U2nsvAug22OyDkcAA02YH6vAey48j7Y2//DbgCbwpq8wL3sW/VzbDyxU
    iiYr2z14SUt70WDqp/C0Xvwz/1f4g/0SZI8p0ZSWmhUYXQTKHClErUIxxYA4TOs7
    uH4XJ1xpqIhE6tGCZP5RMUeXp6mHwxPJAHq5+2/MZkwH12j6eGia54celMYnkl/y
    fRFEEbU5NVkszflPWeNWkx+UIP1rIw0V5k67hKilDZ8ckKuoEARQEsGAApSFeN/W
    swIDAQAB
    -----END PUBLIC KEY-----

.. end

.. start:: key-certificates
Key Certificates
~~~~~~~~~~~~~~~~

It is possible to set and query certificates for the keys stored on a NetHSM
instance:
.. end

PUT /keys/myFirstKey/cert
GET /keys/myFirstKey/cert
DELETE /keys/myFirstKey/cert

.. start:: key-csr
Key Certificate Signing Requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The NetHSM supports generating Certificate Signing Requests (CSR) for the
stored keys:
.. end

POST /keys/myFirstKey/csr.pem

.. start:: key-operations
Key Operations
--------------
.. end

.. start:: decrypt
Decryption
~~~~~~~~~~

We can encrypt data for the key stored on the NetHSM using ``openssl``.
(``public.pem`` is the public key file that we created in the `Show Key
Details`_ section.)

::

    $ echo 'NetHSM rulez!' | \
        openssl rsautl -encrypt -inkey public.pem -pubin | \
        base64 > data.crypt

Now we can use the NetHSM to decrypt the data:
.. end

POST /keys/myFirstKey/decrypt

.. start:: sign
Signing
~~~~~~~

Similarily, we can sign data using the key on the NetHSM.  For RSA and ECDSA,
we have to calculate a digest first:

::

    $ echo 'NetHSM rulez!' > data
    $ openssl dgst -sha256 -binary data | base64 > data.digest

Then we can create a signature from this digest using the NetHSM:
.. end

POST /keys/myFirstKey/sign

.. start:: sign-verify
And then use ``openssl`` to verify the signature:

::

    $ openssl dgst -sha256 -verify public.pem -signature data.sig \
        -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 data
    Verified OK
.. end

.. start:: backup-passphrase
Backups
-------

It is possible to crate a backup of the NetHSM that captures both the
configuration and the stored keys.  In order to create a backup, you first have
to set a backup passphrase that is used to encrypt the backup file:
.. end

PUT /config/backup-passphrase

.. start:: backup-user
Now you have to create a user with the *R-Backup* role:
.. end

PUT /users/backup

.. start:: backup_
Then can you generate the backup and write it to a file:
.. end

POST /system/backup

.. start:: restore
This backup file can be restored on an unprovisioned NetHSM instance:
.. end

POST /system/restore

.. start:: update
Updates
-------

Updates for the NetHSM can be installed in a two-step process.  First you have
to upload the update image to the NetHSM.  The image is then checked and
validated.  If the validation is successful, the release notes for the update
are returned by the NetHSM:
.. end

POST /system/update

.. start:: commit-update
If you want to continue with the installation, you can now commit the update:
.. end

POST /system/commit-update

.. start:: cancel-update
Alternatively, you can cancel the update:
.. end

POST /system/cancel-update
