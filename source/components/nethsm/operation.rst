Operation
=========

This chapter describes operational tasks for users with the *Administrator* and *Operator* role.
Please refer to chapter `Roles <administration.html#roles>`__ to learn more about the role.

.. important::
   Please make sure you read the information in the beginning of `this document <index.html>`__ before starting to work.

Key Management
--------------

Generate Key
~~~~~~~~~~~~

The NetHSM can generate key pairs. It is recommended to specify the key ID option to give it an expressive name.

The supported key types and their corresponding mechanisms are the following.

+----------------+--------------------------------+
| Key Type       | Mechanisms                     |
+================+================================+
| ``RSA``        | ``RSA_Decryption_RAW``         |
|                | ``RSA_Decryption_PKCS1``       |
|                | ``RSA_Decryption_OAEP_MD5``    |
|                | ``RSA_Decryption_OAEP_SHA1``   |
|                | ``RSA_Decryption_OAEP_SHA224`` |
|                | ``RSA_Decryption_OAEP_SHA256`` |
|                | ``RSA_Decryption_OAEP_SHA384`` |
|                | ``RSA_Decryption_OAEP_SHA512`` |
|                | ``RSA_Signature_PKCS1``        |
|                | ``RSA_Signature_PSS_MD5``      |
|                | ``RSA_Signature_PSS_SHA1``     |
|                | ``RSA_Signature_PSS_SHA224``   |
|                | ``RSA_Signature_PSS_SHA256``   |
|                | ``RSA_Signature_PSS_SHA384``   |
|                | ``RSA_Signature_PSS_SHA512``   |
+----------------+--------------------------------+
| ``Curve25519`` | ``EdDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P224``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P256``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P384``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P521``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``Generic``    | ``AES_Encryption_CBC``         |
|                | ``AES_Decryption_CBC``         |
+----------------+--------------------------------+

Keys are assigned to the `Namespace <administration.html#namespaces>`__ of the user that generates the key.

The key can be generated as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Required Options**

      +---------------------------------------+----------------------------------------------------+
      | Option                                | Description                                        |
      +=======================================+====================================================+
      | ``-t``, ``--type`` ``KEYTYPE``        | The type for the generated key.                    |
      |                                       | Possible values for the ``KEYTYPE`` argument can   |
      |                                       | be found in the table above.                       |
      +---------------------------------------+----------------------------------------------------+
      | ``-m``, ``--mechanism`` ``MECHANISM`` | The mechanisms for the generated key.              |
      |                                       | Possible values for the ``MECHANISM`` argument can |
      |                                       | be found in the table above.                       |
      +---------------------------------------+----------------------------------------------------+
      | ``-l``, ``--length`` ``INTEGER``      | The length of the generated key                    |
      +---------------------------------------+----------------------------------------------------+

      **Optional Options**

      +-------------------------------+-----------------------------+
      | Option                        | Description                 |
      +===============================+=============================+
      | ``-k``, ``--key-id`` ``TEXT`` | The ID of the generated key |
      +-------------------------------+-----------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST generate-key --type RSA --mechanism RSA_Signature_PSS_SHA256 --mechanism RSA_Decryption_PKCS1 --length 2048 --key-id myFirstKey

      .. code-block::

         Key myFirstKey generated on NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys/generate` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys_generate>`__.

Import Key
~~~~~~~~~~

The NetHSM can import existing private keys to the *Key Store*.

The supported key types and their corresponding mechanisms are the following.

+----------------+--------------------------------+
| Key Type       | Mechanisms                     |
+================+================================+
| ``RSA``        | ``RSA_Decryption_RAW``         |
|                | ``RSA_Decryption_PKCS1``       |
|                | ``RSA_Decryption_OAEP_MD5``    |
|                | ``RSA_Decryption_OAEP_SHA1``   |
|                | ``RSA_Decryption_OAEP_SHA224`` |
|                | ``RSA_Decryption_OAEP_SHA256`` |
|                | ``RSA_Decryption_OAEP_SHA384`` |
|                | ``RSA_Decryption_OAEP_SHA512`` |
|                | ``RSA_Signature_PKCS1``        |
|                | ``RSA_Signature_PSS_MD5``      |
|                | ``RSA_Signature_PSS_SHA1``     |
|                | ``RSA_Signature_PSS_SHA224``   |
|                | ``RSA_Signature_PSS_SHA256``   |
|                | ``RSA_Signature_PSS_SHA384``   |
|                | ``RSA_Signature_PSS_SHA512``   |
+----------------+--------------------------------+
| ``Curve25519`` | ``EdDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P224``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P256``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P384``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``EC_P521``    | ``ECDSA_Signature``            |
+----------------+--------------------------------+
| ``Generic``    | ``AES_Encryption_CBC``         |
|                | ``AES_Decryption_CBC``         |
+----------------+--------------------------------+

Keys are assigned to the `Namespace <administration.html#namespaces>`__ of the user that imports the key.

Import a private key from a PEM file into NetHSM as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Arguments**

      +--------------+--------------------------------+
      | Argument     | Description                    |
      +==============+================================+
      | ``FILENAME`` | Private key file in PEM format |
      +--------------+--------------------------------+
      
      **Optional Options**

      +----------------------------------------+----------------------------------------------------+
      | Option                                 | Description                                        |
      +========================================+====================================================+
      | ``-m``, ``--mechanism`` ``MECHANISM``  | The mechanisms for the generated key.              |
      |                                        | Possible values for the ``MECHANISM`` argument can |
      |                                        | be found in the table above.                       |
      +----------------------------------------+----------------------------------------------------+
      | ``-k``, ``--key-id`` ``TEXT``          | The ID of the new key                              |
      +----------------------------------------+----------------------------------------------------+
      | ``--tags`` ``TEXT``                    | The Tag for the new key                            |
      +----------------------------------------+----------------------------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST import-key \
            --mechanism RSA_Signature_PSS_SHA256 \
            --mechanism RSA_Decryption_PKCS1 \
            --key-id myFirstKey \
            mykey.pem

      .. code-block::

         Key myFirstKey added to NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys>`__.

Private keys in raw format can be imported as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Required Options**

      +----------------------------------------+----------------------------------------------------+
      | Option                                 | Description                                        |
      +========================================+====================================================+
      | ``-t``, ``--type`` ``KEYTYPE``         | The type for the generated key.                    |
      |                                        | Possible values for the ``KEYTYPE`` argument can   |
      |                                        | be found in the table above.                       |
      +----------------------------------------+----------------------------------------------------+
      | ``-m``, ``--mechanism`` ``MECHANISM``  | The mechanisms for the generated key.              |
      |                                        | Possible values for the ``MECHANISM`` argument can |
      |                                        | be found in the table above.                       |
      +----------------------------------------+----------------------------------------------------+
      | ``-p``, ``--prime-p`` ``TEXT``         | The prime p for RSA keys, base64-encoded           |
      +----------------------------------------+----------------------------------------------------+
      | ``-q``, ``--prime-q`` ``TEXT``         | The prime q for RSA keys, base64-encoded           |
      +----------------------------------------+----------------------------------------------------+
      | ``-e``, ``--public-exponent`` ``TEXT`` | The public exponent for RSA keys,                  |
      |                                        | base64 encoded                                     |
      +----------------------------------------+----------------------------------------------------+
      | ``-d``, ``--data`` ``TEXT``            | The key data for ED25519 or ECDSA_* keys,          |
      |                                        | base64-encoded                                     |
      +----------------------------------------+----------------------------------------------------+

      **Optional Options**

      +-------------------------------+-------------------------+
      | Option                        | Description             |
      +===============================+=========================+
      | ``-k``, ``--key-id`` ``TEXT`` | The ID of the new key   |
      +-------------------------------+-------------------------+
      | ``--tags`` ``TEXT``           | The Tag for the new key |
      +-------------------------------+-------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST add-key \
            --type RSA \
            --mechanism RSA_Signature_PSS_SHA256 \
            --mechanism RSA_Decryption_PKCS1 \
            --key-id myFirstKey \
            --public-exponent AQAB \
            --prime-p "AOnWFZ+JrI/xOXJU04uYCZOiPVUWd6CSbVseEYrYQYxc7dVroePshz29tc+VEOUP5T0O8lXMEkjFAwjW6C9QTAsPyl6jwyOQluMRIkdN4/7BAg3HAMuGd7VmkGyYrnZWW54sLWp1JD6XJG33kF+9OSar9ETPoVyBgK5punfiUFEL" \
            --prime-q "ANT1kWDdP9hZoFKT49dwdM/S+3ZDnxQa7kZk9p+JKU5RaU9e8pS2GOJljHwkES1FH6CUGeIaUi81tRKe2XZhe/163sEyMcxkaaRbBbTc1v6ZDKILFKKt4eX7LAQfhL/iFlgi6pcyUM8QDrm1QeFgGz11ChM0JuQw1WwkX06lg8iv"

      .. code-block::

         Key myFirstKey added to NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys>`__.

Delete Key
~~~~~~~~~~

The NetHSM can delete keys from the *Key Store*.
Users can only delete keys in their `Namespace <administration.html#namespaces>`__.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Arguments**

      +------------+---------------------------------+
      | Argument   | Description                     |
      +============+=================================+
      | ``KEY_ID`` | The key ID of the key to delete |
      +------------+---------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST delete-key myFirstKey
      
      .. code-block::

         Key myFirstKey deleted on NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys/{KeyID}` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/delete_keys__KeyID_>`__.

List Keys
~~~~~~~~~

The NetHSM can list all keys in the *Key Store* that are in the `Namespace <administration.html#namespaces>`__ of the current user.

The list can be retrieved as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* or *Operator* role.

      **Optional Options**

      +-------------------------------+-----------------------+
      | Option                        | Description           |
      +===============================+=======================+
      | ``-f``, ``--filter`` ``TEXT`` | The Tag to search for |
      +-------------------------------+-----------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST list-keys

      .. code-block::

         Keys on NetHSM localhost:8443:

         Key ID          Type       Mechanisms                                      Operations	Tags
         -----------     ----       ----------------------------------------------  ----------	----
         myFirstKey      RSA        RSA_Decryption_PKCS1, RSA_Signature_PSS_SHA256  0
   .. tab:: REST API
      Information about the `/keys` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/get_keys>`__.

Show Key Details
~~~~~~~~~~~~~~~~

The NetHSM can output more detailed information about a stored key.
Users can only access keys in their `Namespace <administration.html#namespaces>`__.

The detailed information can be retrieved as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* or *Operator* role.

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST get-key myFirstKey

      .. code-block::

         Key myFirstKey on NetHSM localhost:8443:
         Type:            RSA
         Mechanisms:      RSA_Decryption_RAW
         Operations:      0
         Modulus:         r62XHPWMDdEf2I1WEpSxGowY/fQF8lMPtv3EUQJE/PLWBvehF8G0QY3AVVZ3etlQWiKreOuGDx4Nr2PFNYAu5f+JP2Jc1lsFNOYF8D82RF41MBySbQR+k+44N/04B0ahTBCxX+ovFH7Sd6SzvxMPa7EKvhaOsLbgyrPlFZxQnhIEqJRCSo5DRRD+CRCPpGXsVXgFbJrNilh21i8OZCct4nC2OS191MeDKmCH4tjrfLMwOKJE8zKlwhdtA1uMY49+JuaC48GUFsLYwbLp1723Uv1PjZjC5jbUhScD0u9I+iNrqznAeka4dWsJ9jgA+h6hblSgCs0I3MWOsMXx/Y5PGQ==
         Public exponent: AQAB
   .. tab:: REST API
      Information about the `/keys/{KeyID}` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/get_keys__KeyID_>`__.

The public key of a key can be retrieved as follows. It's in PKCS#8 format.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* or *Operator* role.

      **Example**

      .. code-block::

         $ nitropy nethsm --host $NETHSM_HOST get-key myFirstKey --public-key

      .. code-block::

         -----BEGIN PUBLIC KEY-----
         MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr62XHPWMDdEf2I1WEpSx
         GowY/fQF8lMPtv3EUQJE/PLWBvehF8G0QY3AVVZ3etlQWiKreOuGDx4Nr2PFNYAu
         5f+JP2Jc1lsFNOYF8D82RF41MBySbQR+k+44N/04B0ahTBCxX+ovFH7Sd6SzvxMP
         a7EKvhaOsLbgyrPlFZxQnhIEqJRCSo5DRRD+CRCPpGXsVXgFbJrNilh21i8OZCct
         4nC2OS191MeDKmCH4tjrfLMwOKJE8zKlwhdtA1uMY49+JuaC48GUFsLYwbLp1723
         Uv1PjZjC5jbUhScD0u9I+iNrqznAeka4dWsJ9jgA+h6hblSgCs0I3MWOsMXx/Y5P
         GQIDAQAB
         -----END PUBLIC KEY-----
   .. tab:: REST API
      Information about the `/keys/{KeyID}/public.pem` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/get_keys__KeyID__public_pem>`__.

The public key can be inspected for example with OpenSSL as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* or *Operator* role.

      **Example**

      .. code-block::

         nitropy nethsm --host= $NETHSM_HOST get-key myFirstKey --public-key | openssl rsa -pubin -text

      .. code-block::

         Public-Key: (2048 bit)
         Modulus:
            00:af:ad:97:1c:f5:8c:0d:d1:1f:d8:8d:56:12:94:
            b1:1a:8c:18:fd:f4:05:f2:53:0f:b6:fd:c4:51:02:
            44:fc:f2:d6:06:f7:a1:17:c1:b4:41:8d:c0:55:56:
            77:7a:d9:50:5a:22:ab:78:eb:86:0f:1e:0d:af:63:
            c5:35:80:2e:e5:ff:89:3f:62:5c:d6:5b:05:34:e6:
            05:f0:3f:36:44:5e:35:30:1c:92:6d:04:7e:93:ee:
            38:37:fd:38:07:46:a1:4c:10:b1:5f:ea:2f:14:7e:
            d2:77:a4:b3:bf:13:0f:6b:b1:0a:be:16:8e:b0:b6:
            e0:ca:b3:e5:15:9c:50:9e:12:04:a8:94:42:4a:8e:
            43:45:10:fe:09:10:8f:a4:65:ec:55:78:05:6c:9a:
            cd:8a:58:76:d6:2f:0e:64:27:2d:e2:70:b6:39:2d:
            7d:d4:c7:83:2a:60:87:e2:d8:eb:7c:b3:30:38:a2:
            44:f3:32:a5:c2:17:6d:03:5b:8c:63:8f:7e:26:e6:
            82:e3:c1:94:16:c2:d8:c1:b2:e9:d7:bd:b7:52:fd:
            4f:8d:98:c2:e6:36:d4:85:27:03:d2:ef:48:fa:23:
            6b:ab:39:c0:7a:46:b8:75:6b:09:f6:38:00:fa:1e:
            a1:6e:54:a0:0a:cd:08:dc:c5:8e:b0:c5:f1:fd:8e:
            4f:19
         Exponent: 65537 (0x10001)
         writing RSA key
         -----BEGIN PUBLIC KEY-----
         MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr62XHPWMDdEf2I1WEpSx
         GowY/fQF8lMPtv3EUQJE/PLWBvehF8G0QY3AVVZ3etlQWiKreOuGDx4Nr2PFNYAu
         5f+JP2Jc1lsFNOYF8D82RF41MBySbQR+k+44N/04B0ahTBCxX+ovFH7Sd6SzvxMP
         a7EKvhaOsLbgyrPlFZxQnhIEqJRCSo5DRRD+CRCPpGXsVXgFbJrNilh21i8OZCct
         4nC2OS191MeDKmCH4tjrfLMwOKJE8zKlwhdtA1uMY49+JuaC48GUFsLYwbLp1723
         Uv1PjZjC5jbUhScD0u9I+iNrqznAeka4dWsJ9jgA+h6hblSgCs0I3MWOsMXx/Y5P
         GQIDAQAB
         -----END PUBLIC KEY-----
   .. tab:: REST API
      Information about the `/keys/{KeyID}/public.pem` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/get_keys__KeyID__public_pem>`__.

Tags for Keys
~~~~~~~~~~~~~

*Tags* can be used to set fine-grained access restrictions on keys, and are an optional feature. One or more *Tags* can be assigned to a key. The *Operator* users can see all keys, but only use those with at least one corresponding *Tag*. If a key has no *Tag* it can be used by all *Operator* users. A *Tag* can not be modified by an *Operator* user.

To learn about how to use *Tags* on *Operator* accounts, please refer to chapter `Tags for Users <administration.html#tags-for-users>`__.

.. note::
   *Tags* are managed without restrictions by users with the *Administrator* role.


The *Tag* can be added as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Arguments**

      +------------+------------------------------+
      | Argument   | Description                  |
      +============+==============================+
      | ``KEY_ID`` | The key ID to set the tag on |
      +------------+------------------------------+
      | ``TAG``    | The tag to set on the key    |
      +------------+------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST add-key-tag myFirstKey berlin

      .. code-block::

         Added tag berlin for key myFirstKey on the NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys/{KeyID}/restrictions/tags/{Tag}` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/put_keys__KeyID__restrictions_tags__Tag_>`__.

The *Tag* can be deleted as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Arguments**

      +------------+-------------------------------+
      | Argument   | Description                   |
      +============+===============================+
      | ``KEY_ID`` | The key ID to set the tag on. |
      +------------+-------------------------------+
      | ``TAG``    | The tag to set on the key.    |
      +------------+-------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST delete-key-tag myFirstKey berlin

      .. code-block::

         Deleted tag berlin for key myFirstKey on the NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys/{KeyID}/restrictions/tags/{Tag}` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/delete_keys__KeyID__restrictions_tags__Tag_>`__.

Key Certificates
----------------

It is possible to set and query certificates for the keys stored on a NetHSM.

The supported MIME types are as follows.

- ``application/x-pem-file``
- ``application/x-x509-ca-cert``
- ``application/pgp-keys``

The certificate can be set as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* role.

      **Required Options**

      +-------------------------------+----------------------------------------------+
      | Option                        | Description                                  |
      +===============================+==============================================+
      | ``-k``, ``--key-id`` ``TEXT`` | The ID of the key to set the certificate for |
      +-------------------------------+----------------------------------------------+

      **Optional Options**

      +---------------------------------------+--------------------------------------------+
      | Option                                | Description                                |
      +=======================================+============================================+
      | ``-m``, ``--mime-type`` ``MIME_TYPE`` | The MIME type of the certificate.          |
      |                                       | The available MIME types are listed above. |
      +---------------------------------------+--------------------------------------------+

      **Arguments**

      +--------------+------------------+
      | Argument     | Description      |
      +==============+==================+
      | ``FILENAME`` | Certificate file |
      +--------------+------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST set-certificate --key-id myFirstKey --mime-type application/x-pem-file /tmp/cert.pem

      .. code-block::

         Updated the certificate for key myFirstKey on NetHSM localhost:8443
   .. tab:: REST API
      Information about the `/keys/{KeyID}/cert` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/put_keys__KeyID__cert>`__.

The certificate can be retrieved as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* or *Operator* role.

      **Required Options**

      +-------------------------------+----------------------------------------------+
      | Option                        | Description                                  |
      +===============================+==============================================+
      | ``-k``, ``--key-id`` ``TEXT`` | The ID of the key to get the certificate for |
      +-------------------------------+----------------------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST get-certificate --key-id myFirstKey

      .. code-block::

         -----BEGIN CERTIFICATE-----
         MIICeTCCAWECFCbuzdkAvc3Zx3W53IoSnmhUen42MA0GCSqGSIb3DQEBCwUAMHsx
         CzAJBgNVBAYTAkRFMQ8wDQYDVQQIDAZCZXJsaW4xDzANBgNVBAcMBkJlcmxpbjER
         MA8GA1UECgwITml0cm9rZXkxFTATBgNVBAMMDG5pdHJva2V5LmNvbTEgMB4GCSqG
         SIb3DQEJARYRaW5mb0BuaXRyb2tleS5jb20wHhcNMjIwODMwMjAxMzA2WhcNMjMw
         ODMwMjAxMzA2WjBxMW8wCQYDVQQGEwJERTANBgNVBAcMBkJlcmxpbjANBgNVBAgM
         BkJlcmxpbjAPBgNVBAoMCE5pdHJva2V5MBMGA1UEAwwMbml0cm9rZXkuY29tMB4G
         CSqGSIb3DQEJARYRaW5mb0BuaXRyb2tleS5jb20wKjAFBgMrZXADIQDc58LGDY9B
         wbJFdXTiDalNXrDC60Sxu3eHcpnh1MSoCjANBgkqhkiG9w0BAQsFAAOCAQEAGip8
         aU5nJnzm3eic3t1ihUA3VJ0mAPyfrb1Rn8tEKOZo3vg0jpRd9CSESlBsKqhvxsdQ
         A3eomM+W7R37TL5+ISm5QrbijLHz3OHoPM68c1Krz3bXTkJetf4YAxpLOPYfXXHv
         weRzwVJb4y3E0lJGhZxI3sUE8Yn/T1UvTbu/o/O5P/XTA8vfFrSNQkQxWBgYh4gC
         KjFFALqUPFrctSFIi34aqpdihNJWnjSS2Y7INm3oxwkR3NMKP8x4wBGfZK22nHnu
         PPzXuMGJTmQM8GHTzltNvLx5Iv2sXoSHClXSpdIT5IBIcR1GmZ78fmcr75OAU0+z
         3XbJq/1ij3tKsjV6WA==
         -----END CERTIFICATE-----
   .. tab:: REST API
      Information about the `/keys/{KeyID}/cert` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/get_keys__KeyID__cert>`__.

Key Certificate Signing Requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The NetHSM supports generating CSR (Certificate Signing Requests) for the stored keys.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Administrator* or *Operator* role.

      **Required Options**

      +------------------------------------+-------------------------------------------+
      | Option                             | Description                               |
      +====================================+===========================================+
      | ``-k``, ``--key-id`` ``TEXT``      | The ID of the key to generate the CSR for |
      +------------------------------------+-------------------------------------------+
      | ``--country`` ``TEXT``             | The country name                          |
      +------------------------------------+-------------------------------------------+
      | ``--state-or-province`` ``TEXT``   | The state or province name                |
      +------------------------------------+-------------------------------------------+
      | ``--locality`` ``TEXT``            | The locality name                         |
      +------------------------------------+-------------------------------------------+
      | ``--organization`` ``TEXT``        | The organization name                     |
      +------------------------------------+-------------------------------------------+
      | ``--organizational-unit`` ``TEXT`` | The organization unit name                |
      +------------------------------------+-------------------------------------------+
      | ``--common-name`` ``TEXT``         | The common name                           |
      +------------------------------------+-------------------------------------------+
      | ``--email-address`` ``TEXT``       | The email address                         |
      +------------------------------------+-------------------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST csr --key-id myFirstKey --country="DE" --state-or-province="Berlin" --locality="Berlin" --organization="Nitrokey" --organizational-unit="" --common-name=nitrokey.com --email-address="info@nitrokey.com"

      .. code-block::

         -----BEGIN CERTIFICATE REQUEST-----
         MIHxMIGkAgEAMHExbzAJBgNVBAYTAkRFMA0GA1UEBwwGQmVybGluMA0GA1UECAwG
         QmVybGluMA8GA1UECgwITml0cm9rZXkwEwYDVQQDDAxuaXRyb2tleS5jb20wHgYJ
         KoZIhvcNAQkBFhFpbmZvQG5pdHJva2V5LmNvbTAqMAUGAytlcAMhADJMNAifke6s
         u7CYqHGDy3xGtXVOUNbTJG6Gn4oki+j3oAAwBQYDK2VwA0EAQilRK2Mf6kfJ4ByI
         WCn9A+8IHsnE7iFcuFZpmaKfcJwZiaQppHvPg/Z0zqldzviPQ1cjKR7hSZG+8GHH
         gWjEDg==
         -----END CERTIFICATE REQUEST-----
   .. tab:: REST API
      Information about the `/keys/{KeyID}/csr.pem` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys__KeyID__csr_pem>`__.

Key Operations
--------------

All operations described in this chapter can only be executed for keys that are in the `Namespace <administration.html#namespaces>`__ of the current user.

Encrypt
~~~~~~~

The NetHSM can encrypt data for symmetric keys, stored in the *Key Store*.
In contrast encrypting data with asymmetric keys can not be done on the NetHSM,
because of the concept in public-key cryptography to make the public key available to everybody.
For asymmetric keys the NetHSM provides the public key, which can be used for encryption with an external tool.
Please refer to the `Show Key Details <operation.html#show-key-details>`__ to learn more about how to retrieve the public key of a key in the *Key Store*.

Data can be encrypted for a symmetric key as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Operator* role.

      **Required Options**

      +-----------------------------------------------+----------------------------------------------+
      | Option                                        | Description                                  |
      +===============================================+==============================================+
      | ``-k``, ``--key-id`` ``TEXT``                 | The ID of the key to encrypt the data with   |
      +-----------------------------------------------+----------------------------------------------+
      | ``-d``, ``--data`` ``TEXT``                   | The data in Base64 encoding                  |
      +-----------------------------------------------+----------------------------------------------+
      | ``-m``, ``--mode`` ``[AES_CBC]``              | The encrypt mode                             |
      +-----------------------------------------------+----------------------------------------------+
      | ``-iv``, ``--initialization-vector`` ``TEXT`` | The initialization vector in Base64 encoding |
      +-----------------------------------------------+----------------------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST encrypt -k myFirstKey -d "TmV0SFNNIHJ1bGV6enp6enp6enp6enp6enp6enp6IQo=" -m AES_CBC -iv "aYlwUI4A9zL9tts4dMAq+A=="
      
      .. code-block::

         Encrypted: Uk+9pgucdxTnbyIb/6+BDJef+HfRWhw+Eg3RcCvyHaU=
         Initialization vector: aYlwUI4A9zL9tts4dMAq+A==

   .. tab:: REST API
      Information about the `/keys/{KeyID}/encrypt` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys__KeyID__encrypt>`__.

This prints the encrypted and base64 encoded message ``NetHSM rulezzzzzzzzzzzzzzzzzzz!``, and the initialization vector.

Data can be encrypted for asymmetric keys with OpenSSL as follows.

.. code-block:: bash

   $ echo 'NetHSM rulez!' | openssl pkeyutl -encrypt -pubin -inkey public.pem | base64 > data.crypt

This writes the encrypted and base64 encoded message ``NetHSM rulez!`` into the file ``data.crypt``, using the public key from ``public.pem``.

Decrypt
~~~~~~~

The NetHSM can decrypt data for an private key stored in the *Key Store* on the NetHSM.
This example uses the encrypted message from the previous chapter `Encrypt <operation.html#encrypt>`__.

The supported decrypt modes are as follows.

- ``RAW``
- ``PKCS1``
- ``OAEP_MD5``
- ``OAEP_SHA1``
- ``OAEP_SHA224``
- ``OAEP_SHA256``
- ``OAEP_SHA384``
- ``OAEP_SHA512``
- ``AES_CBC``

The data can be decrypted as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Operator* role.

      **Required Options**

      +-------------------------------+-----------------------------------------------------+
      | Option                        | Description                                         |
      +===============================+=====================================================+
      | ``-k``, ``--key-id`` ``TEXT`` | The ID of the key to decrypt the data width         |
      +-------------------------------+-----------------------------------------------------+
      | ``-d``, ``--data`` ``TEXT``   | The encrypted data in Base64 encoding               |
      +-------------------------------+-----------------------------------------------------+
      | ``-m``, ``--mode`` ``MODE``   | The decrypt mode. Available modes are listed above. |
      +-------------------------------+-----------------------------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm -h $NETHSM_HOST decrypt -k myFirstKey -d "$(cat data.crypt)" -m PKCS1 | base64 -d

      .. code-block::

         NetHSM rulez!
   .. tab:: REST API
      Information about the `/keys/{KeyID}/decrypt` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys__KeyID__decrypt>`__.

Sign
~~~~

The NetHSM can sign data for a private key stored in the *Key Store* on the NetHSM.
For signatures with a RSA and ECDSA key, a digest must be calculate first.

To calculate a digest the data is required first. A message is created as follows.

.. code-block:: bash

   $ echo 'NetHSM rulez!' > data

The digest is calculated with OpenSSL as follows.

.. code-block:: bash

   $ openssl dgst -sha256 -binary data | base64 > data.digest

The supported signing modes are as follows.

- ``PKCS1``
- ``PSS_MD5``
- ``PSS_SHA1``
- ``PSS_SHA224``
- ``PSS_SHA256``
- ``PSS_SHA384``
- ``PSS_SHA512``
- ``EdDSA``
- ``ECDSA``

From the digest a signature can be created as follows.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Operator* role.

      **Required Options**

      +-------------------------------+------------------------------------------+
      | Option                        | Description                              |
      +===============================+==========================================+
      | ``-k``, ``--key-id`` ``TEXT`` | The ID of the key to sign the data width |
      +-------------------------------+------------------------------------------+
      | ``-d``, ``--data`` ``TEXT``   | The data to sign encoded using Base64    |
      +-------------------------------+------------------------------------------+
      | ``-m``, ``--mode`` ``MODE``   | The sign mode                            |
      +-------------------------------+------------------------------------------+

      **Example**

      .. code-block:: bash

         $ nitropy nethsm -h $NETHSM_HOST sign -k myFirstKey -m PKCS1 -d "$(cat data.digest)" | base64 -d > data.sig
   .. tab:: REST API
      Information about the `/keys/{KeyID}/sign` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_keys__KeyID__sign>`__.

The created signature can be verified with OpenSSL as follows.

.. code-block:: bash

   $ openssl dgst -sha256 -verify public.pem -signature data.sig -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 data

.. code-block::

   Verified OK

Random
------

The NetHSM can provide random bytes as a Base64 string.

.. tabs::
   .. tab:: nitropy
      **Required Role**

      This operation requires an authentication with the *Operator* role.

      **Arguments**

      +------------+-------------------+
      | Argument   | Description       |
      +============+===================+
      | ``LENGTH`` | Bytes to retrieve |
      +------------+-------------------+

      **Example**

      .. code-block:: bash

         nitropy nethsm --host $NETHSM_HOST random 4

      .. code-block::

         94A2rg==
   .. tab:: REST API
      Information about the `/random` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/post_random>`__.
