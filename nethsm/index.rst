NetHSM
======

This guide explains three different methods of accessing a NetHSM instance:
accessing the REST API directly, using the `nitropy
<https://github.com/Nitrokey/pynitrokey>`__ application and using the `PKCS#11
<https://github.com/Nitrokey/nethsm-pkcs11>`__ driver.

Demo Instances
--------------

A public NetHSM demo instance is available at `nethsmdemo.nitrokey.com
<https://nethsmdemo.nitrokey.com>`__.  You can also run a demo instance using
the `nitrokey/nethsm Docker image
<https://hub.docker.com/r/nitrokey/nethsm>`__.

The NetHSM container requires nested virtualization for strong separation with
other containers. Thus, to start a NetHSM container you need a Linux host with
/dev/kvm available. Execute this command:

::

   $ sudo docker run --rm -ti \
       --device=/dev/kvm:/dev/kvm --device=/dev/net/tun:/dev/net/tun \
       --cap-add=NET_ADMIN -p8443:8443 nitrokey/nethsm:testing

You can generate client libraries for the API in many programming
languages using the `OpenAPI Generator
<https://github.com/OpenAPITools/openapi-generator>`__, for example in Python:

::

   $ docker run --rm -ti -v "${PWD}/out:/out" openapitools/openapi-generator-cli generate \
       -i=https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json \
       -g=python -o=/out/python

API Tutorial
------------

The interface specification is available as
`RAML <https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.raml>`__ and as
`OpenAPI (Swagger)
<https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json>`__.

You can either access the API directly, or you can use the `nitropy
<https://github.com/nitrokey/pynitrokey>`__ CLI application.  This tutorial
demonstrates both approaches.

First, let’s see what we have here:

::

   $ curl -k -i -w '\n' https://localhost:8443/api/v1/info

   HTTP/1.1 200 OK
   content-length: 45
   content-type: application/json
   date: Mon, 25 Jan 2021 21:00:27 GMT
   etag: "7bab62510e05c332735624bc7a585a30"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {"vendor":"Nitrokey GmbH","product":"NetHSM"}

::

    $ nitropy nethsm --host localhost:8443 info
    Host:    localhost:8443
    Vendor:  Nitrokey GmbH
    Product: NetHSM

.. tip::

   If you use a self-signed certificate for the NetHSM demo instance,
   you have to set the ``--no-verify-ssl`` option for `nitropy`, for example::

       $ nitropy nethsm --host localhost:8443 --no-verify-ssl info

See what the device’s status is:

::

   $ curl -k -i -w '\n' https://localhost:8443/api/v1/health/state

   HTTP/1.1 200 OK
   cache-control: no-cache
   content-length: 25
   content-type: application/json
   date: Mon, 25 Jan 2021 20:57:32 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {"state":"Unprovisioned"}

::

    $ nitropy nethsm --host localhost:8443 state
    NetHSM localhost:8443 is Unprovisioned

Initialization
~~~~~~~~~~~~~~

A new NetHSM needs to be provisioned first with passphrases and the
current time. The *Admin Passphrase* is the *Administrator*’s
passphrase, which is the super user of the NetHSM. The *Unlock
Passphrase* is used to encrypt NetHSM’s confidential data store.

::

   $ curl -k -i -w '\n' -X POST https://localhost:8443/api/v1/provision \
       -H "content-type: application/json" \
       -d "{ adminPassphrase: \"adminPassphrase\", unlockPassphrase: \"unlockPassphrase\", \
       systemTime: \"$(date --utc -Iseconds)\"}"

   HTTP/1.1 204 No Content
   cache-control: no-cache
   content-type: application/json
   date: Wed, 11 Nov 2020 16:35:44 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

::

   $ nitropy nethsm --host localhost:8443 provision \
       --admin-passphrase adminPassphrase --unlock-passphrase unlockPassphrase
   NetHSM localhost:8443 provisioned

NetHSM can be used in *Attended Boot* mode and *Unattended Boot* mode.

-  In *Attended Boot* mode the *Unlock Passphrase* needs to be entered
   during each start which is used to encrypt the data store. For
   security reasons this mode is recommended.
-  In *Unattended Boot* mode no Unlock Passphrase is required, therefore
   the NetHSM can start unattended and the data store is stored
   unencrypted. Use this mode if your availability requirements can’t be
   fulfilled with *Attended Boot* mode.

Retrieve the current mode:

::

   $ curl -k -i -w '\n' https://localhost:8443/api/v1/config/unattended-boot"

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       get-config --unattended-boot
    Configuration for NetHSM localhost:8443:
        Unattended boot: off

Switch to *Unattended Boot* mode:

::

   $ curl -k -i -w '\n' -X PUT https://localhost:8443/api/v1/config/unattended-boot" \
       -d "{ status: \"on\"}"

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       set-unattended-boot on
   Updated the unattended boot configuration for NetHSM localhost:8443

Switch to *Attended Boot* mode:

::

   $ curl -k -i -w '\n' -X PUT https://localhost:8443/api/v1/config/unattended-boot" \
       -d "{ status: \"off\"}"

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       set-unattended-boot on
   Updated the unattended boot configuration for NetHSM localhost:8443

Roles
~~~~~

Separation of duties can be implemented by using the available Roles.
Each user account configured on the NetHSM has one of the following
Roles assigned to it. Following is a high-level description of the
operations allowed by individual Roles, for endpoint-specific details
please refer to the REST API documentation.

-  *R-Administrator* A user account with this Role has access to all
   operations provided by the REST API, with the exception of key usage
   operations, i.e. message signing and decryption.
-  *R-Operator* A user account with this Role has access to all key
   usage op- erations, a read-only subset of key management operations
   and user management operations allowing changes to their own account
   only.
-  *R-Metrics* A user account with this Role has access to read-only
   metrics operations only.
-  *R-Backup* A user account with this Role has access to the operations
   required to initiate a system backup only.
-  Note: Another Role will be implemented which is allowed to /keys/
   POST, /keys/generate POST, /keys/{KeyID} PUT & DELETE,
   /keys/{KeyID}/cert PUT & DELETE in addition to what R-Operator is
   allowed to do.

Create a User
~~~~~~~~~~~~~

::

   $ curl -i -w '\n' -u admin:adminPassphrase \
       "https://localhost:8443/api/v1/users/operator" -X PUT \
       -H "content-type: application/json" -d "{\"realName\": \"Jane User\", \
       \"role\": \"Operator\", \"passphrase\": \"opPassphrase\"}"

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       add-user --user-id operator --real-name "Jane User" --role operator \
       --passphrase opPassphrase
   User operator added to NetHSM nethsmdemo.nitrokey.com

Create Keys
~~~~~~~~~~~

::

   $ curl -k -i -w '\n' -u admin:adminPassphrase -X POST \
       https://localhost:8443/api/v1/keys/generate -H "content-type: application/json" \
       -d "{ \"mechanisms\": [  \"RSA_Signature_PSS_SHA256\"  ],  \"algorithm\": \"RSA\",  \
       \"length\": 2048,  \"id\": \"myFirstKey\"}"

   HTTP/1.1 201 Created
   cache-control: no-cache
   content-length: 0
   content-type: application/json
   date: Tue, 26 Jan 2021 05:54:09 GMT
   location: /api/v1/keys/0ead0d9dd849cecf845c
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       generate-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 \
       --length 2048 --key-id myFirstKey
   Key myFirstKey generated on NetHSM localhost:8443

List Keys
~~~~~~~~~

::

   $ curl -k -i -w '\n' -u admin:adminPassphrase https://localhost:8443/api/v1/keys

   HTTP/1.1 200 OK
   content-length: 39
   content-type: application/json
   date: Tue, 26 Jan 2021 05:56:24 GMT
   etag: "34353234366432333063663739313939346635316666343937333564653434333937613237626139"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   [{"key":"myFirstKey"}]

::

   $ nitropy nethsm --host localhost:8443 --username operator --password opPassphrase \
       list-keys
   Keys on NetHSM localhost:8443:

   Key ID          Algorithm       Mechanisms                      Operations
   ----------      ---------       ------------------------        ----------
   myFirstKey      RSA             RSA_Signature_PSS_SHA256        0         

Show Key Details
~~~~~~~~~~~~~~~~

::

   $ curl -s -k -w '\n' -u admin:adminPassphrase https://localhost:8443/api/v1/keys/myFirstKey

   {"mechanisms":["RSA_Signature_PSS_SHA256"],"algorithm":"RSA","modulus":"td583uBYRfO7qtvPoQF7liUh8gq3zckCk9LpCfblx2S0HdOvButfD4TyH4EMiZj3NhEoq18BZhqhxTL22UyNJwYJd2tCF4EbgTaj/Z3LeCPoGN5LjadFCsYriPeHsdnuLmTK6KsmTAP/CWJ+u3LesU5bCGWbDnPjv2WaLTeiMuNw1347gj1drft8jFA9SmOFjZxM9pq2Hk1nQSYpeAPCnigC7hLwAWgzKqVQv/J7VVWat3ke/jOrxFiRDFIeC3qxtBs6T7GYwqmsxkxgqKDljTAH4qMrC9vgVbbFPffe8UgmtDfvQ0ghP57b3HYZDON90MJ2qrU944E74g+ua6unTw==","publicExponent":"AQAB","operations":0}

::

   $ nitropy nethsm --host localhost:8443 --username operator --password opPassphrase \
       get-key myFirstKey
   Key myFirstKey on NetHSM localhost:8443:
   Algorithm:       RSA
   Mechanisms:      RSA_Signature_PSS_SHA256
   Operations:      0
   Modulus:         xYDMGEK3CO5vK0ge0pJQEJHBPA/5M42F/kyN7BV+03HEH23NLXWyszYn7MWvxG4uebZfz+6n7auOYePb0FADVvxQvdX4VPcNzBOEgMqfpplEzf5RzmMmFDBgAcGMS5XkbyVS3XR+7bqej5L6qZtGmFn4hG22Ziu5ZdQxyyqos8Go1ogFBz+vQ4WzmDOGEU82quQSxiPT3K71KKVSS4zTL6oz9izuHzOqnLhuGnbtAe5AFBXE2fJIuXMzw36d0OyJ+rdmkh65EXXLo7Qt3VyP7JPIW+JIM2iU26v6suwUCbjFfrDURS8xEftKAe1hkBWJpNHLZhUse7dpvmtlmRyhxw==
   Public exponent: AQAB

Decryption
~~~~~~~~~~

::

    $ nitropy nethsm --host localhost:8443 --username admin --password adminadmin \
        generate-key -a RSA -m RSA_Decryption_PKCS1 -l 2048 -k testkey
    $ curl --insecure -u operator:operatoroperator -X GET \
        https://localhost:8443/api/v1/keys/testkey3/public.pem -o _public.pem
    $ echo 'NetHSM rulez!' | openssl rsautl -encrypt -inkey _public.pem -pubin \
        -out _data.crypt
    $ base64 _data.crypt > _data.crypt.base64
    $ nitropy nethsm -h localhost:8443 -u operator -p operatoroperator \
        decrypt -k testkey3 -d "$(cat _data.crypt.base64)" -m PKCS1 > _data.decrypt.base64
    $ base64 -d _data.decrypt.base64
    NetHSM rulez!


API Documentation
-----------------

The entire API is described
`here <https://www.nitrokey.com/files/nethsmapi/>`__.

PKCS#11
-------

1. Download the PKCS#11 driver for NetHSM.
2. Modify the configuration file ``p11nethsm-config.yaml`` according to
   your setup and store it in ``$HOME/.nitrokey``, ``/etc/nitrokey/``,
   or in the folder where your application is executed.

Decrypting
~~~~~~~~~~

Before, create the key with the according mechanism before, and
configure NetHSM’s address and operator username in the p11nethsm config
file.

::

   $ KEYID=42
   $ HEXID=$(echo ${KEYID}'\c' | xxd -ps)
   $ curl -s -u operator:opPassphrase -X GET \
     https://nethsmdemo.nitrokey.com/api/v1/keys/$KEYID/public.pem -o _public.pem
   $ echo 'NetHSM rulez!' | openssl pkeyutl -encrypt -pubin -inkey _public.pem \
     -pkeyopt rsa_padding_mode:oaep -pkeyopt rsa_oaep_md:sha512 \
     -pkeyopt rsa_mgf1_md:sha512 -out _data.crypt
   $ pkcs11-tool --module p11nethsm.so -v -p opPassphrase --decrypt \
     --mechanism RSA-PKCS-OAEP --input-file _data.crypt --id $HEXID \
     --hash-algorithm SHA512

Signing
~~~~~~~

Before, create the key with the according mechanism before, and
configure NetHSM’s address and operator username in the p11nethsm config
file.

::

   $ KEYID=23
   $ HEXID=$(echo ${KEYID}'\c' | xxd -ps)
   $ curl -s -u operator:opPassphrase -X GET \
     https://nethsmdemo.nitrokey.com/api/v1/keys/$KEYID/public.pem -o _public.pem
   $ echo 'NetHSM rulez!' | pkcs11-tool --module p11nethsm.so -v -p opPassphrase \
     --sign --mechanism SHA512-RSA-PKCS-PSS --output-file _data.sig --id $HEXID
   $ echo 'NetHSM rulez!' | openssl dgst -keyform PEM -verify _public.pem -sha512 \
     -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature _data.sig

Integrating into own custom application
---------------------------------------

To integrate the NetHSM into own custom applications we recommend using
NetHSM’s REST API. To generate a client library for many different
languages, including JavaScript, C++ and Python, you can use the
`openapi-generator <https://github.com/OpenAPITools/openapi-generator>`__.
You can install it locally, or use a Docker container, which is very
easy. To list all the available languages, you enter

::

   $ docker run --pull --rm -ti openapitools/openapi-generator-cli list -i stable

Then you can generate the NetHSM client like this:

::

   $ docker run --pull --rm -ti -v "${PWD}:/local" openapitools/openapi-generator-cli generate -i "https://app.swaggerhub.com/apiproxy/schema/file/apis/nitrokey/nethsm/v1?format=json" -o /local/out -g javascript

The generated client code, in this case JavaScript, will be created in
the ``./out/`` directory. There is documentation inside as well, how to
use it.

Old description, needs to be converted to current API
=====================================================

Does it has some keys on it?

::

   $ curl -k -i -w "\n" -X GET https://localhost:8443/api/v1/keys
   HTTP/1.1 412 Precondition Failed
   content-length: 35
   content-type: application/json
   date: Mon, 25 Jan 2021 21:11:30 GMT

   {"message":"Service not available"}

Ohh, NetHSM seems to have access control. In fact is has an Admin
password and a User password. The Admin password is used to authenticate
any kind of changes of the system, settings and keys. The User password
is required to authenticate the usage of keyfender without any
modification.

Before you can do anything with the system, the Admin password needs to
be defined first. It doesn’t has a default value.

::

   $ curl -k -i -w "\n" -X PUT localhost:8443/api/v0/system/passwords/admin -H "content-type: application/json" -d '{ newPassword: "secret" }'

   HTTP/1.1 200 OK
   { "status": "success" }

If you want to change the Admin password again, you need to
authenticate:

::

   $ curl -i -w "\n" -X PUT http://admin:secret@localhost:8443/api/v0/system/passwords/admin -H "content-type: application/json" -d '{ newPassword: "supersecret" }'

   HTTP/1.1 200 OK
   { "status": "success" }

Define a User password:

::

   $ curl -i -w "\n" -X PUT http://admin:supersecret@localhost:8443/api/v0/system/passwords/user -H "content-type: application/json" -d '{ newPassword: "usersecret" }'

   HTTP/1.1 200 OK
   { "status": "success" }

You can generate RSA keys:

::

   $ curl -i -w "\n" -X POST http://admin:supersecret@localhost:8443/api/v0/keys -H "content-type: application/json" -d '{"purpose":"signing", "algorithm":"RSA", "length":4096}'

   HTTP/1.1 200 OK
   {
     "status": "success",
     "data": {
       "location": "/api/v0/keys/Im4bPvqXM8w4SZxEvxvi"
     }
   }

Here you got the location of the newly generated key. The last part of
the URL is the key ID: Im4bPvqXM8w4SZxEvxvi

Instead of dealing with generated key IDs, you can specify the key ID
yourself:

::

   $ curl -i -w "\n" -X POST http://admin:supersecret@localhost:8443/api/v0/keys -H "content-type: application/json" -d '{"purpose":"authentication", "algorithm":"RSA", "length":2048, "id":"myKey"}'

   HTTP/1.1 200 OK
   {
     "status": "success",
     "data": {
       "location": "/api/v0/keys/myKey"
     }
   }

You can also import existing keys:

::

   $ curl -i -w "\n" -X POST http://admin:supersecret@localhost:8443/api/v0/keys -d '{"purpose":"encryption", "algorithm":"RSA", "privateKey":{"publicExponent":"AQAB","primeP":"4P7TWJety3bZ47tp_WnB8BEbBX9kd_ONa6bOnPd2nxfXmLl1W61yQbZAw8bTReBfYsre8wYe8jVSs-nNGgR19-FPnXMg8xAgFrdcVvfj8OverK-q3MJhZTT2X-ZAhN5H-wWf_xXPJPMtPsPXXs914fU7WchZoBIVcarQq0eGHMM=","primeQ":"x8QUQ4aPrh33oBip_PBpzRHMRtg4isr8CwXQq8ijSd8dvYjaC8mTYPB0Nytsi047XjXBLq0HyvpjxpcVWYBzqrPKFFcafTdk80SQNtD5EUyGy_rFRbowDaG5UoMVSL1VrJLx6xI8OToUP2J1ZiuZG0I-Ms2YQcanZzYRANppLYM="}}'

   HTTP/1.1 200 OK
   {
     "status": "success",
     "data": {
       "location": "/api/v0/keys/kfG8H2z2cddUMXeiK5Ky"
     }
   }

You can overwrite an existing key with PUT or delete with DELETE.

Now we are going to perform key operations. For this we don’t need the
Admin password anymore but can use the User password instead. What we
have got?

::

   $ curl -i -w "\n" -X GET http://user:usersecret@localhost:8443/api/v0/keys

   HTTP/1.1 200 OK
   content-length: 199
   content-type: application/json
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {
     "status": "success",
     "data": [
       { "location": "/api/v0/keys/cphQSDP1n2q4BxnPVI4y" },
       { "location": "/api/v0/keys/kfG8H2z2cddUMXeiK5Ky" },
       { "location": "/api/v0/keys/myKey" }
     ]
   }

Here is how you get a public key:

::

   $ curl -i -w "\n" -X GET http://user:usersecret@localhost:8443/api/v0/keys/kfG8H2z2cddUMXeiK5Ky
   HTTP/1.1 200 OK
   content-length: 558
   content-type: application/json
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {
     "status": "success",
     "data": {
       "id": "kfG8H2z2cddUMXeiK5Ky",
       "purpose": "encryption",
       "algorithm": "RSA",
       "publicKey": {
         "modulus":
           "r5JrMu80IEJoyM-9utzBs64Her9-VkjYhTU9a5ZrQ0zbECFYpdcTScRrWkZHy0Of6OLXumHHK_Krikmq1m53iw88iTVB_Up8oREkZt2szWifJlAVse9vfzERC_VmIFVqqZgmY1JopygVJ5_MMniOe8fN3iZAf-33ZB1aL14f0Y4m6xGXSN8er_q1yxevWy5oUVyF8Zl7r3ATERAX_9lsuLTZN9tAEBFqq4naH9mSsEsyRljybSuhX411CWUE4cj8JXf9qKumoN7duYNTjipSZqLauJ56txn5zTKDMGKvpcxB5jlQ_0ltVcGEayIjkXhJFR_dM2uwG4cQSmC4Bqn-yQ==",
         "publicExponent": "AQAB"
       }
     }
   }

You can get it also in PEM format:

::

   $ curl -i -w "\n" -X GET http://user:usersecret@localhost:8443/api/v0/keys/kfG8H2z2cddUMXeiK5Ky/public.pem

   HTTP/1.1 200 OK
   content-length: 451
   content-type: application/x-pem-file
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   -----BEGIN PUBLIC KEY-----
   MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr5JrMu80IEJoyM+9utzB
   s64Her9+VkjYhTU9a5ZrQ0zbECFYpdcTScRrWkZHy0Of6OLXumHHK/Krikmq1m53
   iw88iTVB/Up8oREkZt2szWifJlAVse9vfzERC/VmIFVqqZgmY1JopygVJ5/MMniO
   e8fN3iZAf+33ZB1aL14f0Y4m6xGXSN8er/q1yxevWy5oUVyF8Zl7r3ATERAX/9ls
   uLTZN9tAEBFqq4naH9mSsEsyRljybSuhX411CWUE4cj8JXf9qKumoN7duYNTjipS
   ZqLauJ56txn5zTKDMGKvpcxB5jlQ/0ltVcGEayIjkXhJFR/dM2uwG4cQSmC4Bqn+
   yQIDAQAB
   -----END PUBLIC KEY-----

With each key you can execute decrypt and signing operations (Technical
restriction to the designated key purpose is not enforced yet.) Signing
can invoke hashing, or you send a hash instead.

::

   $ curl -i -w "\n" -X POST -d '{"message":"DOTvDL7e547MJ5tTWqjU5W3-wDFFh0f-g4GHbdgl7iPh6wQe53JV25nxDWgEi3HJcw5YkoBGIbj1XfRbTZbsI77lfIK_lhpf5XVqeKrU0YCRPYDZ2qDFdJyMajyjDieUwTmyxLdrJ_UrwdyFtNPQ27XvjUUF71DLTNMrbKnRNeqVoAWy3PK3Asqo62DRAwLvwRuuz6UhmoDNdJdVzHCi8KJdNQHI5Q8Nhn2SAwVO85IRceOrzIoU00l2QmR0WGNtTwli1lWqfvtE21wExA9ys7mqvJpUCUzPamlsESBveh7c3FboTkekUzZlB6YOUhoWmaV8gxaMBzRFKqKBulbJ8Q=="}' http://user:usersecret@localhost:8443/api/v0/keys/myKey/actions/pkcs1/sign

Decrypting data is similarly easy:

::

   $ curl -i -w "\n" -X POST -d '{"encrypted":"DOTvDL7e547MJ5tTWqjU5W3-wDFFh0f-g4GHbdgl7iPh6wQe53JV25nxDWgEi3HJcw5YkoBGIbj1XfRbTZbsI77lfIK_lhpf5XVqeKrU0YCRPYDZ2qDFdJyMajyjDieUwTmyxLdrJ_UrwdyFtNPQ27XvjUUF71DLTNMrbKnRNeqVoAWy3PK3Asqo62DRAwLvwRuuz6UhmoDNdJdVzHCi8KJdNQHI5Q8Nhn2SAwVO85IRceOrzIoU00l2QmR0WGNtTwli1lWqfvtE21wExA9ys7mqvJpUCUzPamlsESBveh7c3FboTkekUzZlB6YOUhoWmaV8gxaMBzRFKqKBulbJ8Q=="}' http://user:usersecret@localhost:8443/api/v0/keys/myKey/actions/decrypt

Available key actions:

-  decrypt
-  pkcs1/decrypt
-  oaep/md5/decrypt
-  oaep/sha1/decrypt
-  oaep/sha224/decrypt
-  oaep/sha256/decrypt
-  oaep/sha384/decrypt
-  oaep/sha512/decrypt
-  pkcs1/sign
-  pss/sha1/sign
-  pss/sha224/sign
-  pss/sha256/sign
-  pss/sha384/sign
-  pss/sha512/sign
