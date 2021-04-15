Accessing a NetHSM using the REST API
=====================================

.. contents:: :local:

This tutorial demonstrates how to access the NetHMS via REST API. The interface is `documented here <https://nethsmdemo.nitrokey.com/api_docs/index.html#docs/summary/summary>`__ and it's specification is available as
`RAML <https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.raml>`__ and as
`OpenAPI (Swagger)
<https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json>`__.

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

Initialization
--------------

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

Switch to *Unattended Boot* mode:

::

   $ curl -k -i -w '\n' -X PUT https://localhost:8443/api/v1/config/unattended-boot" \
       -d "{ status: \"on\"}"

Or switch back to *Attended Boot* mode:

::

   $ curl -k -i -w '\n' -X PUT https://localhost:8443/api/v1/config/unattended-boot" \
       -d "{ status: \"off\"}"

Roles
-----

Separation of duties can be implemented by using the available Roles.
Each user account configured on the NetHSM has one of the following
Roles assigned to it. Following is a high-level description of the
operations allowed by individual Roles, for endpoint-specific details
please refer to the REST API documentation.

-  *R-Administrator* A user account with this Role has access to all
   operations provided by the REST API, with the exception of key usage
   operations, i.e. message signing and decryption.
-  *R-Operator* A user account with this Role has access to all key
   usage op- erations, a read-only subset of key management operations
   and user management operations allowing changes to their own account
   only.
-  *R-Metrics* A user account with this Role has access to read-only
   metrics operations only.
-  *R-Backup* A user account with this Role has access to the operations
   required to initiate a system backup only.

Note: In a future release another Role will be implemented which is allowed to /keys/ POST, /keys/generate POST, /keys/{KeyID} PUT & DELETE, /keys/{KeyID}/cert PUT & DELETE in addition to what R-Operator is allowed to do.

Create a User
-------------

::

   $ curl -i -w '\n' -u admin:adminPassphrase \
       "https://localhost:8443/api/v1/users/operator" -X PUT \
       -H "content-type: application/json" -d "{\"realName\": \"Jane User\", \
       \"role\": \"Operator\", \"passphrase\": \"opPassphrase\"}"

Generate Keys
-------------

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

List Keys
---------

::

   $ curl -k -i -w '\n' -u admin:adminPassphrase https://localhost:8443/api/v1/keys

   HTTP/1.1 200 OK
   content-length: 39
   content-type: application/json
   date: Tue, 26 Jan 2021 05:56:24 GMT
   etag: "34353234366432333063663739313939346635316666343937333564653434333937613237626139"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   [{"key":"myFirstKey"}]

Show Key Details
----------------

::

   $ curl -s -k -w '\n' -u admin:adminPassphrase https://localhost:8443/api/v1/keys/myFirstKey

   {"mechanisms":["RSA_Signature_PSS_SHA256"],"algorithm":"RSA","modulus":"td583uBYRfO7qtvPoQF7liUh8gq3zckCk9LpCfblx2S0HdOvButfD4TyH4EMiZj3NhEoq18BZhqhxTL22UyNJwYJd2tCF4EbgTaj/Z3LeCPoGN5LjadFCsYriPeHsdnuLmTK6KsmTAP/CWJ+u3LesU5bCGWbDnPjv2WaLTeiMuNw1347gj1drft8jFA9SmOFjZxM9pq2Hk1nQSYpeAPCnigC7hLwAWgzKqVQv/J7VVWat3ke/jOrxFiRDFIeC3qxtBs6T7GYwqmsxkxgqKDljTAH4qMrC9vgVbbFPffe8UgmtDfvQ0ghP57b3HYZDON90MJ2qrU944E74g+ua6unTw==","publicExponent":"AQAB","operations":0}


Decryption
----------

TODO
