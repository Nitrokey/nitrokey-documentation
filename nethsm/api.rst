Accessing a NetHSM using the REST API
=====================================

.. contents:: :local:

This tutorial demonstrates how to access the NetHMS via REST API. The interface is `documented here <https://nethsmdemo.nitrokey.com/api_docs/index.html#docs/summary/summary>`__ and it's specification is available as
`RAML <https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.raml>`__ and as
`OpenAPI (Swagger)
<https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json>`__.

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

   $ curl -k -i -w '\n' https://$NETHSM_HOST/api/v1/info

   HTTP/1.1 200 OK
   content-length: 45
   content-type: application/json
   date: Mon, 25 Jan 2021 21:00:27 GMT
   etag: "7bab62510e05c332735624bc7a585a30"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   {"vendor":"Nitrokey GmbH","product":"NetHSM"}

.. include:: _tutorial.rst
   :start-after: .. start:: state
   :end-before: .. end

::

   $ curl -k -i -w '\n' https://$NETHSM_HOST/api/v1/health/state

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

   $ curl -k -i -w '\n' -X POST https://$NETHSM_HOST/api/v1/provision \
       -H "content-type: application/json" \
       -d "{ adminPassphrase: \"adminPassphrase\", unlockPassphrase: \"unlockPassphrase\", \
       systemTime: \"$(date --utc -Iseconds)\"}"

   HTTP/1.1 204 No Content
   cache-control: no-cache
   content-type: application/json
   date: Wed, 11 Nov 2020 16:35:44 GMT
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: boot-mode
   :end-before: .. end

::

   $ curl -k -i -w '\n' https://$NETHSM_HOST/api/v1/config/unattended-boot"

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-on
   :end-before: .. end

::

   $ curl -k -i -w '\n' -X PUT https://$NETHSM_HOST/api/v1/config/unattended-boot" \
       -d "{ status: \"on\"}"

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-off
   :end-before: .. end

::

   $ curl -k -i -w '\n' -X PUT https://$NETHSM_HOST/api/v1/config/unattended-boot" \
       -d "{ status: \"off\"}"

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

.. include:: _tutorial.rst
   :start-after: .. start:: generate-key
   :end-before: .. end

::

   $ curl -k -i -w '\n' -u admin:adminPassphrase -X POST \
       https://$NETHSM_HOST/api/v1/keys/generate -H "content-type: application/json" \
       -d "{ \"mechanisms\": [ \"RSA_Signature_PSS_SHA256\", \"RSA_Decryption_PKCS1\" ], \
       \"algorithm\": \"RSA\",  \"length\": 2048,  \"id\": \"myFirstKey\"}"

   HTTP/1.1 201 Created
   cache-control: no-cache
   content-length: 0
   content-type: application/json
   date: Tue, 26 Jan 2021 05:54:09 GMT
   location: /api/v1/keys/0ead0d9dd849cecf845c
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

.. include:: _tutorial.rst
   :start-after: .. start:: list-keys
   :end-before: .. end

::

   $ curl -k -i -w '\n' -u admin:adminPassphrase https://$NETHSM_HOST/api/v1/keys

   HTTP/1.1 200 OK
   content-length: 39
   content-type: application/json
   date: Tue, 26 Jan 2021 05:56:24 GMT
   etag: "34353234366432333063663739313939346635316666343937333564653434333937613237626139"
   vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

   [{"key":"myFirstKey"}]

.. include:: _tutorial.rst
   :start-after: .. start:: get-key
   :end-before: .. end

::

   $ curl -s -k -w '\n' -u admin:adminPassphrase https://$NETHSM_HOST/api/v1/keys/myFirstKey

   {"mechanisms":["RSA_Decryption_PKCS1","RSA_Signature_PSS_SHA256"],"algorithm":"RSA","modulus":"td583uBYRfO7qtvPoQF7liUh8gq3zckCk9LpCfblx2S0HdOvButfD4TyH4EMiZj3NhEoq18BZhqhxTL22UyNJwYJd2tCF4EbgTaj/Z3LeCPoGN5LjadFCsYriPeHsdnuLmTK6KsmTAP/CWJ+u3LesU5bCGWbDnPjv2WaLTeiMuNw1347gj1drft8jFA9SmOFjZxM9pq2Hk1nQSYpeAPCnigC7hLwAWgzKqVQv/J7VVWat3ke/jOrxFiRDFIeC3qxtBs6T7GYwqmsxkxgqKDljTAH4qMrC9vgVbbFPffe8UgmtDfvQ0ghP57b3HYZDON90MJ2qrU944E74g+ua6unTw==","publicExponent":"AQAB","operations":0}

.. include:: _tutorial.rst
   :start-after: .. start:: decrypt
   :end-before: .. end

::

    $ curl --insecure -u operator:opPassphrase -X GET \
        https://$NETHSM_HOST/api/v1/keys/myFirstKey/public.pem -o _public.pem
    $ echo 'NetHSM rulez!' | openssl rsautl -encrypt -inkey _public.pem -pubin \
        -out _data.crypt
    $ base64 _data.crypt > _data.crypt.base64
    $ curl -k -i -w '\n' -u operator:opPassphrase -X POST \
        https://$NETHSM_HOST/api/v1/keys/myFirstKey/decrypt -H "content-type: application/json" \
        -d "{ \"mode\": \"PKCS1\", \"encrypted\": \"$(cat _data.crypt.base64)\"}"
    HTTP/1.1 200 OK
    cache-control: no-cache
    content-length: 36
    content-type: application/json
    date: Thu, 15 Apr 2021 10:44:39 GMT
    vary: Accept, Accept-Encoding, Accept-Charset, Accept-Language

    {"decrypted":"TmV0SFNNIHJ1bGV6IQo="}
    $ echo TmV0SFNNIHJ1bGV6IQo= | base64 -d
    NetHSM rulez!
