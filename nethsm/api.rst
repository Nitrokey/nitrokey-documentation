.. highlight:: none

Accessing a NetHSM using the REST API
=====================================

.. contents:: :local:

This tutorial demonstrates how to access the NetHMS via REST API. The interface is `documented here <https://nethsmdemo.nitrokey.com/api_docs/index.html#docs/summary/summary>`_ and it's specification is available as
`RAML <https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.raml>`_ and as
`OpenAPI (Swagger)
<https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json>`_.

.. include:: _tutorial.rst
   :start-after: .. start:: setup
   :end-before: .. end

.. note::

   If you use a NetHSM demo instance with a self-signed certificate, for
   example using the Docker image, you will have to use the
   ``--insecure``/``-k`` option for ``curl`` to skip the certificate check.

.. include:: _tutorial.rst
   :start-after: .. start:: info
   :end-before: .. end

::

   $ curl -i -w '\n' https://$NETHSM_HOST/api/v1/info

::

   HTTP/1.1 200 OK
   content-length: 45
   content-type: application/json
   date: Mon, 25 Jan 2021 21:00:27 GMT
   etag: "7bab62510e05c332735624bc7a585a30"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {"vendor":"Nitrokey GmbH","product":"NetHSM"}

.. note::

   The ``-i``/``--include`` option causes ``curl`` to print the HTTP status
   code and the response headers.  The ``-w '\n'``/``--write-out '\n'`` option
   adds a newline after the response body.

.. include:: _tutorial.rst
   :start-after: .. start:: state
   :end-before: .. end

::

   $ curl -i -w '\n' https://$NETHSM_HOST/api/v1/health/state

::

   HTTP/1.1 200 OK
   cache-control: no-cache
   content-length: 25
   content-type: application/json
   date: Mon, 25 Jan 2021 20:57:32 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {"state":"Unprovisioned"}

.. include:: _tutorial.rst
   :start-after: .. start:: provision
   :end-before: .. end

::

   $ curl -i -w '\n' -X POST https://$NETHSM_HOST/api/v1/provision \
       -H "content-type: application/json" \
       -d "{ adminPassphrase: \"adminPassphrase\", unlockPassphrase: \"unlockPassphrase\", \
       systemTime: \"$(date --utc -Iseconds)\"}"

::

   HTTP/1.1 204 No Content
   cache-control: no-cache
   content-type: application/json
   date: Wed, 11 Nov 2020 16:35:44 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: boot-mode
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase \
       https://$NETHSM_HOST/api/v1/config/unattended-boot

::

   HTTP/1.1 200 OK
   content-length: 16
   content-type: application/json
   date: Wed, 21 Apr 2021 10:20:55 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {"status":"off"}

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-on
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X PUT -H "content-type: application/json" \
       https://$NETHSM_HOST/api/v1/config/unattended-boot -d "{ status: \"on\"}"

::

   HTTP/1.1 204 No Content
   content-type: application/json
   date: Wed, 21 Apr 2021 10:24:25 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-off
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X PUT -H "content-type: application/json" \
       https://$NETHSM_HOST/api/v1/config/unattended-boot -d "{ status: \"off\"}"

::

   HTTP/1.1 204 No Content
   content-type: application/json
   date: Wed, 21 Apr 2021 10:24:53 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: user-management
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: roles
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: add-user
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase \
       "https://$NETHSM_HOST/api/v1/users/operator" -X PUT \
       -H "content-type: application/json" -d "{\"realName\": \"Jane User\", \
       \"role\": \"Operator\", \"passphrase\": \"opPassphrase\"}"

::

   HTTP/1.1 201 Created
   content-length: 0
   content-type: application/json
   date: Wed, 21 Apr 2021 10:25:27 GMT
   location: /api/v1/users/operator
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: key-management
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: generate-key
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X POST \
       https://$NETHSM_HOST/api/v1/keys/generate -H "content-type: application/json" \
       -d "{ \"mechanisms\": [ \"RSA_Signature_PSS_SHA256\", \"RSA_Decryption_PKCS1\" ], \
       \"algorithm\": \"RSA\",  \"length\": 2048,  \"id\": \"myFirstKey\"}"

::

   HTTP/1.1 201 Created
   cache-control: no-cache
   content-length: 0
   content-type: application/json
   date: Tue, 26 Jan 2021 05:54:09 GMT
   location: /api/v1/keys/0ead0d9dd849cecf845c
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: import-key
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X PUT \
       https://$NETHSM_HOST/api/v1/keys/mySecondKey -H "content-type: application/json" \
       -d "{ \"mechanisms\": [ \"RSA_Signature_PSS_SHA256\", \"RSA_Decryption_PKCS1\" ], \
       \"algorithm\": \"RSA\",  \"key\": {\"primeP\": \"AOnWFZ+JrI/xOXJU04uYCZOiPVUWd6CSbVseEYrYQYxc7dVroePshz29tc+VEOUP5T0O8lXMEkjFAwjW6C9QTAsPyl6jwyOQluMRIkdN4/7BAg3HAMuGd7VmkGyYrnZWW54sLWp1JD6XJG33kF+9OSar9ETPoVyBgK5punfiUFEL\", \"primeQ\": \"ANT1kWDdP9hZoFKT49dwdM/S+3ZDnxQa7kZk9p+JKU5RaU9e8pS2GOJljHwkES1FH6CUGeIaUi81tRKe2XZhe/163sEyMcxkaaRbBbTc1v6ZDKILFKKt4eX7LAQfhL/iFlgi6pcyUM8QDrm1QeFgGz11ChM0JuQw1WwkX06lg8iv\", \"publicExponent\": \"AQAB\"}}"

::

   HTTP/1.1 204 No Content
   content-type: application/json
   date: Wed, 21 Apr 2021 10:37:23 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: list-keys
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase https://$NETHSM_HOST/api/v1/keys

::

   HTTP/1.1 200 OK
   content-length: 39
   content-type: application/json
   date: Tue, 26 Jan 2021 05:56:24 GMT
   etag: "34353234366432333063663739313939346635316666343937333564653434333937613237626139"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   [{"key":"myFirstKey"},{"key":"mySecondKey"}]

.. include:: _tutorial.rst
   :start-after: .. start:: get-key
   :end-before: .. end

::

   $ curl -s -w '\n' -u admin:adminPassphrase https://$NETHSM_HOST/api/v1/keys/myFirstKey

::

   {"mechanisms":["RSA_Decryption_PKCS1","RSA_Signature_PSS_SHA256"],"algorithm":"RSA","modulus":"td583uBYRfO7qtvPoQF7liUh8gq3zckCk9LpCfblx2S0HdOvButfD4TyH4EMiZj3NhEoq18BZhqhxTL22UyNJwYJd2tCF4EbgTaj/Z3LeCPoGN5LjadFCsYriPeHsdnuLmTK6KsmTAP/CWJ+u3LesU5bCGWbDnPjv2WaLTeiMuNw1347gj1drft8jFA9SmOFjZxM9pq2Hk1nQSYpeAPCnigC7hLwAWgzKqVQv/J7VVWat3ke/jOrxFiRDFIeC3qxtBs6T7GYwqmsxkxgqKDljTAH4qMrC9vgVbbFPffe8UgmtDfvQ0ghP57b3HYZDON90MJ2qrU944E74g+ua6unTw==","publicExponent":"AQAB","operations":0}

.. include:: _tutorial.rst
   :start-after: .. start:: get-key-file
   :end-before: .. end

::

    $ curl -u operator:opPassphrase -X GET \
        https://$NETHSM_HOST/api/v1/keys/myFirstKey/public.pem -o public.pem

.. include:: _tutorial.rst
   :start-after: .. start:: inspect-key
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: key-certificates
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X PUT \
       https://$NETHSM_HOST/api/v1/keys/myFirstKey/cert -H "content-type: application/x-pem-file" \
       --data-binary @/tmp/cert.pem

::   
   
   HTTP/1.1 201 Created
   content-length: 0
   content-type: text/html
   date: Thu, 20 May 2021 19:15:39 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

::

   $ curl -s -w '\n' -u operator:opPassphrase -X GET \
       https://$NETHSM_HOST/api/v1/keys/myFirstKey/cert > /tmp/cert.pem

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X DELETE \
       https://$NETHSM_HOST/api/v1/keys/myFirstKey/cert

::
   
   HTTP/1.1 204 No Content
   content-type: text/html
   date: Thu, 20 May 2021 19:14:45 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: key-csr
   :end-before: .. end

::

   $ curl -s -w '\n' -u operator:opPassphrase -X POST \
       https://$NETHSM_HOST/api/v1/keys/myFirstKey/csr.pem -H "content-type: application/json" \
       -d "{ \"countryName\": \"DE\", \"stateOrProvinceName\": \"BE\", \
       \"localityName\": \"Berlin\", \"organizationName\": \"ACME\", \
       \"organizationalUnitName\": \"IT\", \"commonName\": \"example.com\", \
       \"emailAddress\": \"it@example.com\" }" > /tmp/cert.pem

.. include:: _tutorial.rst
   :start-after: .. start:: key-operations
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: decrypt
   :end-before: .. end

::

    $ curl -s -u operator:opPassphrase -X POST \
        https://$NETHSM_HOST/api/v1/keys/myFirstKey/decrypt -H "content-type: application/json" \
        -d "{ \"mode\": \"PKCS1\", \"encrypted\": \"$(cat data.crypt)\"}" | \
        jq -r .decrypted | base64 -d
        
::        
        
    NetHSM rulez!

.. include:: _tutorial.rst
   :start-after: .. start:: sign
   :end-before: .. end

::

    $ curl -s -u operator:opPassphrase -X POST \
        https://$NETHSM_HOST/api/v1/keys/myFirstKey/sign -H "content-type: application/json" \
        -d "{ \"mode\": \"PSS_SHA256\", \"message\": \"$(cat data.digest)\"}" | \
        jq -r .signature | base64 -d > data.sig

.. include:: _tutorial.rst
   :start-after: .. start:: sign-verify
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: backup-passphrase
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X PUT \
       https://$NETHSM_HOST/api/v1/config/backup-passphrase -H "content-type: application/json" \
       -d "{\"passphrase\": \"backupencryptionkey\"}"
       
::       
       
   HTTP/2 204 
   server: nginx/1.14.2
   date: Sat, 08 May 2021 10:26:36 GMT
   cache-control: no-cache
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language
   strict-transport-security: max-age=63072000; includeSubDomains; preload
   x-frame-options: DENY
   x-content-type-options: nosniff
   x-xss-protection: 1; mode=block
   x-permitted-cross-domain-policies: none

.. include:: _tutorial.rst
   :start-after: .. start:: backup-user
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X PUT \
       https://$NETHSM_HOST/api/v1/users/backup -H "content-type: application/json" \
       -d "{\"realName\": \"Backup User\", \"role\": \"Backup\", \
       \"passphrase\": \"backupPassphrase\"}"
       
::

   HTTP/2 201 
   server: nginx/1.14.2
   date: Sat, 08 May 2021 10:30:45 GMT
   content-type: application/json
   content-length: 0
   location: /api/v1/users/backup
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language
   strict-transport-security: max-age=63072000; includeSubDomains; preload
   x-frame-options: DENY
   x-content-type-options: nosniff
   x-xss-protection: 1; mode=block
   x-permitted-cross-domain-policies: none

.. include:: _tutorial.rst
   :start-after: .. start:: backup_
   :end-before: .. end

::

   $ curl -s -u backup:backupPassphrase -X POST \
       https://$NETHSM_HOST/api/v1/system/backup > /tmp/nethsm-backup

.. include:: _tutorial.rst
   :start-after: .. start:: restore
   :end-before: .. end

::

   $ curl -i -X POST \
      "https://$NETHSM_HOST/api/v1/system/restore?backupPassphrase=backupencryptionkey&systemTime=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")" \
      --data-binary @/tmp/nethsm-backup
      
::     
      
   HTTP/1.1 204 No Content
   cache-control: no-cache
   content-type: application/json
   date: Sat, 08 May 2021 10:59:19 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: update
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X POST  \
       https://$NETHSM_HOST/api/v1/system/update --data-binary "@/tmp/nethsm-update.img.cpio"

.. include:: _tutorial.rst
   :start-after: .. start:: commit-update
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X POST  \
       https://$NETHSM_HOST/api/v1/system/commit-update

.. include:: _tutorial.rst
   :start-after: .. start:: cancel-update
   :end-before: .. end

::

   $ curl -i -w '\n' -u admin:adminPassphrase -X POST  \
       https://$NETHSM_HOST/api/v1/system/cancel-update
