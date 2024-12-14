Creating a Certificate Authority
================================

.. product-table:: nk3 pro storage hsm

.. contents:: :local:

This article shows you how to setup your own private certificate authority backed by a Nitrokey HSM. This certificate authority has no automation and does not really scale. Other open source projects can be referenced for automation and scalability.

Choose Cryptographic Algorithms
-------------------------------

I’m going to assume that you’re as paranoid as I am, so I will be using the following command for generating private keys:

.. code-block:: bash

   pkcs11-tool -l --keypairgen --key-type EC:secp384r1 --label root

But, if you’re less paranoid that I am, you can safely choose the following options:

.. code-block:: bash

   pkcs11-tool -l --keypairgen --key-type EC:secp256r1 --label root
   pkcs11-tool -l --keypairgen --key-type rsa:4096 --label root

Likewise, I will be using the sha512 algorithm throughout this article, but sha256 can safely be used.

Preparing to Start
------------------

To start with, you need to pick a directory to store your CA.

.. code-block:: bash

   pki_dir=/opt/certificate-authority
   mkdir $pki_dir
   cd $pki_dir
   mkdir certs config crl newcerts intermediate intermediate/certs intermediate/crl intermediate/csr intermediate/newcerts
   touch index.txt intermediate/index.txt
   cd config

Install the necessary tools:

.. code-block:: bash

   # Arch Linux
   pacman -S community/opensc community/libp11

   # Ubuntu
   sudo apt-get install opensc gnutls-bin

For Windows download the official `OpenSC releases <https://github.com/OpenSC/OpenSC/releases>`__  
and make sure you install `p11tool as described <https://github.com/thales-e-security/p11tool>`__.
Using the PowerShell most commands should be identical as long as both tools and their binaries
are within your ``PATH``.

Creating The Root Certificate Authority
---------------------------------------

We start by generating the private key for the certificate authority directly on the Nitrokey HSM. This allows us to use the private key in the future, but not access it.

::

   # Generate private key on HSM
   $ pkcs11-tool -l --keypairgen --key-type EC:secp384r1 --label root
   Using slot 0 with a present token (0x0)
   Logging in to "SmartCard-HSM (UserPIN)".
   Please enter User PIN:
   Key pair generated:
   Private Key Object; EC
     label:      root
     ID:         e0161cc8b6f5d66ac6835ecdecb623fc0506a675
     Usage:      sign, derive
     Access:     none
   Public Key Object; EC  EC_POINT 384 bits
     EC_POINT:   046104c1e7b40e1ef9e5d47399aeeda695026c9eb626462059eb696e8f2b647b42d64ac3b7fc7a5b31aa3edf9bce46b2cdcf8e5d190b13601d3d14ffb119c8cf60033c6b78ba579b85113ca536eef1cf85ba418ff0110a56ec881b329e0562e090a3e7
     EC_PARAMS:  06052b81040022
     label:      root
     ID:         e0161cc8b6f5d66ac6835ecdecb623fc0506a675
     Usage:      verify, derive
     Access:     none

Note the ID number (e0161cc8b6f5d66ac6835ecdecb623fc0506a675), we’ll need it later.

If you need the ID in the future, you can list the keys on the Nitrokey HSM:

.. code-block:: bash

   pkcs11-tool -O

We need to create a config file to generate a self-signed public certificate.

.. code-block:: bash

   vim create_root_cert.ini

Fill out the request information in <angle brackets> with information for your CA.

.. code-block:: ini

   [ ca ]
   # `man ca`
   default_ca = CA_default

   [ CA_default ]
   # Directory and file locations.
   dir               = /opt/certificate-authority
   certs             = $dir/certs
   crl_dir           = $dir/crl
   new_certs_dir     = $dir/newcerts
   database          = $dir/index.txt
   serial            = $dir/serial

   # SHA-1 is deprecated, so use SHA-2 instead.
   default_md        = sha512

   name_opt          = ca_default
   cert_opt          = ca_default
   default_days      = 375
   preserve          = no
   policy            = policy_strict

   [ policy_strict ]
   # The root CA should only sign intermediate certificates that match.
   # See the POLICY FORMAT section of `man ca`.
   countryName             = match
   stateOrProvinceName     = match
   organizationName        = match
   organizationalUnitName  = optional
   commonName              = supplied
   emailAddress            = optional

   [ req ]
   # Options for the `req` tool (`man req`).
   default_bits        = 4096
   distinguished_name  = req_distinguished_name
   string_mask         = utf8only
   prompt              = no

   # SHA-1 is deprecated, so use SHA-2 instead.
   default_md          = sha512

   [ req_distinguished_name ]
   C                   = <two lettter country>
   ST                  = <full state name>
   O                   = <your company>
   OU                  = <your company> Certificate Authority
   CN                  = <your company> Root CA

   [ v3_ca ]
   # Extensions for a typical CA (`man x509v3_config`).
   subjectKeyIdentifier = hash
   authorityKeyIdentifier = keyid:always,issuer
   basicConstraints = critical, CA:true
   keyUsage = critical, digitalSignature, cRLSign, keyCertSign

Generate the self-signed public certificate from the private key. Use the private key id value from earlier.

::

   $ openssl req -config create_root_cert.ini -engine pkcs11 -keyform engine -key e0161cc8b6f5d66ac6835ecdecb623fc0506a675 -new -x509 -days 3650 -sha512 -extensions v3_ca -out ../certs/root.crt
   engine "pkcs11" set.
   Enter PKCS#11 token PIN for SmartCard-HSM (UserPIN):

Verify that the root certificate was generated correctly. Verify that Signature-Algorithm matches above and below. Verify that Issuer and Subject match, all root certificates are self signed. Verify that Key Usage matches what was in the v3_ca information in our config file.

::

   $ openssl x509 -noout -text -in ../certs/root.crt
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number:
               25:ac:e1:36:75:67:26:1d:bb:96:4b:84:c2:2d:83:25:7b:cc:e0:e5
           Signature Algorithm: ecdsa-with-SHA512
           Issuer: C = US, ST = My State, O = My Company, OU = My Company Certificate Authority, CN = My Company Root CA
           Validity
               Not Before: Aug 18 20:13:20 2020 GMT
               Not After : Aug 16 20:13:20 2030 GMT
           Subject: C = US, ST = My State, O = My Company, OU = My Company Certificate Authority, CN = My Company Root CA
           Subject Public Key Info:
               Public Key Algorithm: id-ecPublicKey
                   Public-Key: (384 bit)
                   pub:
                       04:c1:e7:b4:0e:1e:f9:e5:d4:73:99:ae:ed:a6:95:
                       02:6c:9e:b6:26:46:20:59:eb:69:6e:8f:2b:64:7b:
                       42:d6:4a:c3:b7:fc:7a:5b:31:aa:3e:df:9b:ce:46:
                       b2:cd:cf:8e:5d:19:0b:13:60:1d:3d:14:ff:b1:19:
                       c8:cf:60:03:3c:6b:78:ba:57:9b:85:11:3c:a5:36:
                       ee:f1:cf:85:ba:41:8f:f0:11:0a:56:ec:88:1b:32:
                       9e:05:62:e0:90:a3:e7
                   ASN1 OID: secp384r1
                   NIST CURVE: P-384
           X509v3 extensions:
               X509v3 Subject Key Identifier:
                   F1:FA:61:75:0B:AC:3C:95:97:EF:73:3C:3F:38:22:B1:DB:D9:BF:41
               X509v3 Authority Key Identifier:
                   keyid:F1:FA:61:75:0B:AC:3C:95:97:EF:73:3C:3F:38:22:B1:DB:D9:BF:41

               X509v3 Basic Constraints: critical
                   CA:TRUE
               X509v3 Key Usage: critical
                   Digital Signature, Certificate Sign, CRL Sign
       Signature Algorithm: ecdsa-with-SHA512
            30:64:02:30:53:b8:b6:5a:41:4b:4f:6a:d1:a6:76:88:df:13:
            d6:da:c7:48:aa:8b:aa:ff:13:6c:d1:00:53:90:92:b5:71:57:
            eb:d0:bf:3e:5d:2e:62:c0:3e:40:0f:64:25:a5:92:0f:02:30:
            15:0a:19:d5:a2:09:86:d8:9d:07:67:71:c3:84:f2:6b:90:20:
            2d:29:10:9e:4c:73:7a:55:56:4b:dc:fe:8d:3f:f0:9c:20:e1:
            5a:74:fb:41:86:ad:a4:66:61:74:d7:fd

Creating The Intermediate Certificate Authority
-----------------------------------------------

We continue by generating the private key for the intermediate certificate authority directly on the Nitrokey HSM. This allows us to use the private key in the future, but not access it.

::

   # Generate private key on HSM
   $ pkcs11-tool -l --keypairgen --key-type EC:secp384r1 --label intermediate
   Using slot 0 with a present token (0x0)
   Logging in to "SmartCard-HSM (UserPIN)".
   Please enter User PIN:
   Key pair generated:
   Private Key Object; EC
     label:      intermediate
     ID:         bcb48fe9b566ae61891aabbfde6a23d4ff3ab639
     Usage:      sign, derive
     Access:     none
   Public Key Object; EC  EC_POINT 384 bits
     EC_POINT:   046104d0fb5c0cd10c0b6e4d0f6986755824b624ec9fcd8ff9ae5f0109fe6ff3ad887ca760717da894f3ff84dc8c24fe8c93b0cd840a6aa941bb2866c061cef60e47b893d71852b50d6762af10c951426e55ec8925a6cd83aeae1730311108afdbcdee
     EC_PARAMS:  06052b81040022
     label:      intermediate
     ID:         bcb48fe9b566ae61891aabbfde6a23d4ff3ab639
     Usage:      verify, derive
     Access:     none

Note the ID number (bcb48fe9b566ae61891aabbfde6a23d4ff3ab639), we’ll need it later.

If you need the ID in the future, you can list the keys on the Nitrokey HSM:

.. code-block:: bash

   pkcs11-tool -O

We need to create a config file to generate a self-signed public certificate.

.. code-block:: bash

   vim create_intermediate_csr.ini

Fill out the request information in <angle brackets> with information for your CA.

.. code-block:: ini

   [ req ]
   # Options for the `req` tool (`man req`).
   default_bits        = 4096
   distinguished_name  = req_distinguished_name
   string_mask         = utf8only
   prompt              = no

   # SHA-1 is deprecated, so use SHA-2 instead.
   [ v3_ca ]
   # Extensions for a typical CA (`man x509v3_config`).
   subjectKeyIdentifier = hash
   authorityKeyIdentifier = keyid:always,issuer
   basicConstraints = critical, CA:true
   keyUsage = critical, digitalSignature, cRLSign, keyCertSign
   default_md          = sha512

   [ req_distinguished_name ]
   C                   = <two lettter country>
   ST                  = <full state name>
   O                   = <your company>
   OU                  = <your company> Certificate Authority
   CN                  = <your company> Intermediate CA

Generate the certificate signing request for the intermediate CA from the intermediate CA’s private key. Use the private key ID value from earlier.

::

   $ openssl req -config create_intermediate_csr.ini -engine pkcs11 -keyform engine -key bcb48fe9b566ae61891aabbfde6a23d4ff3ab639 -new -sha512 -out ../intermediate/csr/intermediate.csr
   engine "pkcs11" set.
   Enter PKCS#11 token PIN for SmartCard-HSM (UserPIN):

Verify that the CSR was created correctly. Verify that your Subject is correct. Verify that your Public Key and Signature Algorithm are correct.

::

   $ openssl req -text -noout -verify -in ../intermediate/csr/intermediate.csr
   verify OK
   Certificate Request:
       Data:
           Version: 1 (0x0)
           Subject: C = US, ST = My State, O = My Company, OU = My Company Certificate Authority, CN = My Company Intermediate CA
           Subject Public Key Info:
               Public Key Algorithm: id-ecPublicKey
                   Public-Key: (384 bit)
                   pub:
                       04:d0:fb:5c:0c:d1:0c:0b:6e:4d:0f:69:86:75:58:
                       24:b6:24:ec:9f:cd:8f:f9:ae:5f:01:09:fe:6f:f3:
                       ad:88:7c:a7:60:71:7d:a8:94:f3:ff:84:dc:8c:24:
                       fe:8c:93:b0:cd:84:0a:6a:a9:41:bb:28:66:c0:61:
                       ce:f6:0e:47:b8:93:d7:18:52:b5:0d:67:62:af:10:
                       c9:51:42:6e:55:ec:89:25:a6:cd:83:ae:ae:17:30:
                       31:11:08:af:db:cd:ee
                   ASN1 OID: secp384r1
                   NIST CURVE: P-384
           Attributes:
               a0:00
       Signature Algorithm: ecdsa-with-SHA512
            30:64:02:30:6a:1d:75:8b:59:99:2c:a8:5d:a0:7f:02:7d:9a:
            aa:40:74:7a:65:20:03:6b:bc:65:fb:7d:d1:7f:5b:24:ae:6f:
            40:16:ac:82:0b:80:9b:81:f9:d9:64:ea:0f:41:4c:d7:02:30:
            4d:28:7f:e3:76:52:c7:10:e1:bd:b7:2e:ea:65:78:41:0c:96:
            50:5f:e9:1f:be:18:ac:14:ba:65:3f:b0:2a:f4:0f:d0:56:ab:
            d0:8c:bf:d0:92:9e:f6:e5:f6:8a:af:a5

We need to find out the fully qualified PKCS#11 URI for your private key:

::

   $ p11tool --list-all
   warning: no token URL was provided for this operation; the available tokens are:

   pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00

   $ p11tool --login --list-all pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00
   Token 'SmartCard-HSM (UserPIN)' with URL 'pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00' requires user PIN
   Enter PIN:
   Object 0:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=private
           Type: Private key (EC/ECDSA-SECP384R1)
           Label: root
           Flags: CKA_PRIVATE; CKA_NEVER_EXTRACTABLE; CKA_SENSITIVE;
           ID: e0:16:1c:c8:b6:f5:d6:6a:c6:83:5e:cd:ec:b6:23:fc:05:06:a6:75

   Object 1:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=public
           Type: Public key (EC/ECDSA-SECP384R1)
           Label: root
           ID: e0:16:1c:c8:b6:f5:d6:6a:c6:83:5e:cd:ec:b6:23:fc:05:06:a6:75

   Object 2:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%BC%B4%8F%E9%B5%66%AE%61%89%1A%AB%BF%DE%6A%23%D4%FF%3A%B6%39;object=intermediate;type=private
           Type: Private key (EC/ECDSA-SECP384R1)
           Label: intermediate
           Flags: CKA_PRIVATE; CKA_NEVER_EXTRACTABLE; CKA_SENSITIVE;
           ID: bc:b4:8f:e9:b5:66:ae:61:89:1a:ab:bf:de:6a:23:d4:ff:3a:b6:39

   Object 3:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%BC%B4%8F%E9%B5%66%AE%61%89%1A%AB%BF%DE%6A%23%D4%FF%3A%B6%39;object=intermediate;type=public
           Type: Public key (EC/ECDSA-SECP384R1)
           Label: intermediate
           ID: bc:b4:8f:e9:b5:66:ae:61:89:1a:ab:bf:de:6a:23:d4:ff:3a:b6:39

In this instance, the fully qualified PKCS#11 URI is:

.. code-block:: bash

   pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=private

Now, we need to create a config file to use the private key of the root certificate to sign the csr of the intermediate certificate.

.. code-block:: bash

   vim sign_intermediate_csr.ini

.. code-block:: ini

   [ ca ]
   # `man ca`
   default_ca = CA_default

   [ CA_default ]
   # Directory and file locations.
   dir               = /opt/certificate-authority
   certs             = $dir/certs
   crl_dir           = $dir/crl
   new_certs_dir     = $dir/newcerts
   database          = $dir/index.txt
   serial            = $dir/serial

   # The root key and root certificate.
   private_key       = pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=private
   certificate       = ../certs/root.crt

   # SHA-1 is deprecated, so use SHA-2 instead.
   default_md        = sha512

   name_opt          = ca_default
   cert_opt          = ca_default
   default_days      = 375
   preserve          = no
   policy            = policy_loose

   [ policy_loose ]
   # Allow the intermediate CA to sign a more diverse range of certificates.
   # See the POLICY FORMAT section of the `ca` man page.
   countryName             = optional
   stateOrProvinceName     = optional
   localityName            = optional
   organizationName        = optional
   organizationalUnitName  = optional
   commonName              = supplied
   emailAddress            = optional

   [ v3_intermediate_ca ]
   # Extensions for a typical intermediate CA (`man x509v3_config`).
   subjectKeyIdentifier = hash
   authorityKeyIdentifier = keyid:always,issuer
   basicConstraints = critical, CA:true, pathlen:0
   keyUsage = critical, digitalSignature, cRLSign, keyCertSign

Then sign the intermediate certificate with the root certificate.

::

   $ openssl ca -config sign_intermediate_csr.ini -engine pkcs11 -keyform engine -extensions v3_intermediate_ca -days 1825 -notext -md sha512 -create_serial -in ../intermediate/csr/intermediate.csr -out ../intermediate/certs/intermediate.crt
   engine "pkcs11" set.
   Using configuration from sign_intermediate_csr.ini
   Enter PKCS#11 token PIN for SmartCard-HSM (UserPIN):
   Check that the request matches the signature
   Signature ok
   Certificate Details:
           Serial Number:
               35:47:4d:05:12:cc:e1:a8:b6:bf:dd:3e:c8:29:7b:18:c0:a1:5c:68
           Validity
               Not Before: Aug 18 20:44:17 2020 GMT
               Not After : Aug 17 20:44:17 2025 GMT
           Subject:
               countryName               = US
               stateOrProvinceName       = My State
               organizationName          = My Company
               organizationalUnitName    = My Company Certificate Authority
               commonName                = My Company Intermediate CA
           X509v3 extensions:
               X509v3 Subject Key Identifier:
                   1D:4F:E5:ED:11:42:9A:AC:25:E4:51:A3:42:67:97:39:A0:10:AE:82
               X509v3 Authority Key Identifier:
                   keyid:F1:FA:61:75:0B:AC:3C:95:97:EF:73:3C:3F:38:22:B1:DB:D9:BF:41

               X509v3 Basic Constraints: critical
                   CA:TRUE, pathlen:0
               X509v3 Key Usage: critical
                   Digital Signature, Certificate Sign, CRL Sign
   Certificate is to be certified until Aug 17 20:44:17 2025 GMT (1825 days)
   Sign the certificate? [y/n]:y


   1 out of 1 certificate requests certified, commit? [y/n]y
   Write out database with 1 new entries
   Data Base Updated

Verify that the root certificate was generated correctly. Verify that the Issuer and Subject are different, and correct. Verify that the Key Usage matches the config file. Verify that the signature algorithm are correct above and below.

::

   $ openssl x509 -noout -text -in ../intermediate/certs/intermediate.crt
   Certificate:
       Data:
           Version: 3 (0x2)
           Serial Number:
               35:47:4d:05:12:cc:e1:a8:b6:bf:dd:3e:c8:29:7b:18:c0:a1:5c:68
           Signature Algorithm: ecdsa-with-SHA512
           Issuer: C = US, ST = My State, O = My Company, OU = My Company Certificate Authority, CN = My Company Root CA
           Validity
               Not Before: Aug 18 20:44:17 2020 GMT
               Not After : Aug 17 20:44:17 2025 GMT
           Subject: C = US, ST = My State, O = My Company, OU = My Company Certificate Authority, CN = My Company Intermediate CA
           Subject Public Key Info:
               Public Key Algorithm: id-ecPublicKey
                   Public-Key: (384 bit)
                   pub:
                       04:d0:fb:5c:0c:d1:0c:0b:6e:4d:0f:69:86:75:58:
                       24:b6:24:ec:9f:cd:8f:f9:ae:5f:01:09:fe:6f:f3:
                       ad:88:7c:a7:60:71:7d:a8:94:f3:ff:84:dc:8c:24:
                       fe:8c:93:b0:cd:84:0a:6a:a9:41:bb:28:66:c0:61:
                       ce:f6:0e:47:b8:93:d7:18:52:b5:0d:67:62:af:10:
                       c9:51:42:6e:55:ec:89:25:a6:cd:83:ae:ae:17:30:
                       31:11:08:af:db:cd:ee
                   ASN1 OID: secp384r1
                   NIST CURVE: P-384
           X509v3 extensions:
               X509v3 Subject Key Identifier:
                   1D:4F:E5:ED:11:42:9A:AC:25:E4:51:A3:42:67:97:39:A0:10:AE:82
               X509v3 Authority Key Identifier:
                   keyid:F1:FA:61:75:0B:AC:3C:95:97:EF:73:3C:3F:38:22:B1:DB:D9:BF:41

               X509v3 Basic Constraints: critical
                   CA:TRUE, pathlen:0
               X509v3 Key Usage: critical
                   Digital Signature, Certificate Sign, CRL Sign
       Signature Algorithm: ecdsa-with-SHA512
            30:66:02:31:00:9a:6e:08:d2:d6:3a:29:f6:ba:0c:4c:3a:f4:
            af:40:5e:e0:71:f2:bc:e4:47:f5:b4:ee:10:d7:27:b1:25:0b:
            4b:09:78:a1:b8:f2:b8:71:c5:4e:41:33:8e:64:db:ec:eb:02:
            31:00:fc:39:26:c2:ad:7b:3c:ab:75:06:34:02:47:79:40:31:
            1d:eb:17:ad:32:10:67:97:37:6f:7f:3c:ce:3e:12:3c:e9:7c:
            fa:43:3e:34:5d:5e:f4:f3:2f:fd:6a:2f:14:da

Verify that the intermediate certificate verifies against the root certificate.

.. code-block:: bash

   $ openssl verify -CAfile ../certs/root.crt ../intermediate/certs/intermediate.crt
   ../intermediate/certs/intermediate.crt: OK

Create a certificate chain file:

.. code-block:: bash

   cat ../intermediate/certs/intermediate.crt ../certs/root.crt > ../intermediate/certs/chain.crt

You now have a certificate authority backed by an HSM.

Sign a Server Certificate
-------------------------

Now that you have a certificate authority, you’d probably like to know how to use it.

Create a CSR in the normal method for your application. Proper creation of your certificate, including SAN, for your particular application is outside the scope of this document.

We need to find out the fully qualified PKCS#11 URI for your private key:

::

   $ p11tool --list-all
   warning: no token URL was provided for this operation; the available tokens are:

   *pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00*

   $ p11tool --login --list-all pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00
   Token 'SmartCard-HSM (UserPIN)' with URL 'pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00' requires user PIN
   Enter PIN:
   Object 0:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=private
           Type: Private key (EC/ECDSA-SECP384R1)
           Label: root
           Flags: CKA_PRIVATE; CKA_NEVER_EXTRACTABLE; CKA_SENSITIVE;
           ID: e0:16:1c:c8:b6:f5:d6:6a:c6:83:5e:cd:ec:b6:23:fc:05:06:a6:75

   Object 1:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=public
           Type: Public key (EC/ECDSA-SECP384R1)
           Label: root
           ID: e0:16:1c:c8:b6:f5:d6:6a:c6:83:5e:cd:ec:b6:23:fc:05:06:a6:75

   Object 2:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%BC%B4%8F%E9%B5%66%AE%61%89%1A%AB%BF%DE%6A%23%D4%FF%3A%B6%39;object=intermediate;type=private
           Type: Private key (EC/ECDSA-SECP384R1)
           Label: intermediate
           Flags: CKA_PRIVATE; CKA_NEVER_EXTRACTABLE; CKA_SENSITIVE;
           ID: bc:b4:8f:e9:b5:66:ae:61:89:1a:ab:bf:de:6a:23:d4:ff:3a:b6:39

   Object 3:
           URL: pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%BC%B4%8F%E9%B5%66%AE%61%89%1A%AB%BF%DE%6A%23%D4%FF%3A%B6%39;object=intermediate;type=public
           Type: Public key (EC/ECDSA-SECP384R1)
           Label: intermediate
           ID: bc:b4:8f:e9:b5:66:ae:61:89:1a:ab:bf:de:6a:23:d4:ff:3a:b6:39

In this instance, the fully qualified PKCS#11 URI is:

.. code-block:: bash

   pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%BC%B4%8F%E9%B5%66%AE%61%89%1A%AB%BF%DE%6A%23%D4%FF%3A%B6%39;object=intermediate;type=private

Create a config file to use the private key of the intermediate certificate to sign the CSRs of your servers.

.. code-block:: bash

   vim sign_server_csrs.ini

.. code-block:: ini

   [ ca ]
   # `man ca`
   default_ca = CA_default

   [ CA_default ]
   # Directory and file locations.
   dir               = /opt/certificate-authority/intermediate
   certs             = $dir/certs
   crl_dir           = $dir/crl
   new_certs_dir     = $dir/newcerts
   database          = $dir/index.txt
   serial            = $dir/serial

   # The root key and root certificate.
   private_key       = pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%BC%B4%8F%E9%B5%66%AE%61%89%1A%AB%BF%DE%6A%23%D4%FF%3A%B6%39;object=intermediate;type=private
   certificate       = $dir/certs/intermediate.crt

   # SHA-1 is deprecated, so use SHA-2 instead.
   default_md        = sha512

   name_opt          = ca_default
   cert_opt          = ca_default
   default_days      = 375
   preserve          = no
   policy            = policy_loose

   [ policy_loose ]
   # Allow the intermediate CA to sign a more diverse range of certificates.
   # See the POLICY FORMAT section of the `ca` man page.
   countryName             = optional
   stateOrProvinceName     = optional
   localityName            = optional
   organizationName        = optional
   organizationalUnitName  = optional
   commonName              = supplied
   emailAddress            = optional

   [ server_cert ]
   # Extensions for server certificates (`man x509v3_config`).
   basicConstraints = CA:FALSE
   nsCertType = server
   nsComment = "OpenSSL Generated Server Certificate"
   subjectKeyIdentifier = hash
   authorityKeyIdentifier = keyid,issuer:always
   keyUsage = critical, digitalSignature, keyEncipherment
   extendedKeyUsage = serverAuth

Then run openssl to sign the server’s CSR.

::

   $ openssl ca -config sign_server_csrs.ini -engine pkcs11 -keyform engine -extensions server_cert -days 375 -notext -md sha512 -create_serial -in server_cert.csr -out server_cert.crt
   engine "pkcs11" set.
   Using configuration from sign_server_csrs.ini
   Enter PKCS#11 token PIN for SmartCard-HSM (UserPIN):
   Check that the request matches the signature
   Signature ok
   Certificate Details:
           Serial Number:
               40:7f:dc:90:b0:3a:1b:fb:d3:e2:74:8d:40:28:a8:12:f7:7e:c3:74
           Validity
               Not Before: Aug 18 21:32:42 2020 GMT
               Not After : Aug 28 21:32:42 2021 GMT
           Subject:
               countryName               = US
               stateOrProvinceName       = My State
               organizationName          = My Company
               organizationalUnitName    = media
               commonName                = media
           X509v3 extensions:
               X509v3 Basic Constraints:
                   CA:FALSE
               Netscape Cert Type:
                   SSL Server
               Netscape Comment:
                   OpenSSL Generated Server Certificate
               X509v3 Subject Key Identifier:
                   26:89:19:95:6C:93:8C:DD:6E:AA:61:D5:C0:E6:78:CC:F1:47:64:FC
               X509v3 Authority Key Identifier:
                   keyid:1D:4F:E5:ED:11:42:9A:AC:25:E4:51:A3:42:67:97:39:A0:10:AE:82
                   DirName:/C=US/ST=My State/O=My Company/OU=My Company Certificate Authority/CN=My Company Root CA
                   serial:35:47:4D:05:12:CC:E1:A8:B6:BF:DD:3E:C8:29:7B:18:C0:A1:5C:68

               X509v3 Key Usage: critical
                   Digital Signature, Key Encipherment
               X509v3 Extended Key Usage:
                   TLS Web Server Authentication
   Certificate is to be certified until Aug 28 21:32:42 2021 GMT (375 days)
   Sign the certificate? [y/n]:y


   1 out of 1 certificate requests certified, commit? [y/n]y
   Write out database with 1 new entries
   Data Base Updated

References
----------

I used the following resources to help in compiling this document.

-  `How to initialize your Nitrokey HSM <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#initialize-the-device>`__
-  `How to create a root and intermediate CA <https://jamielinux.com/docs/openssl-certificate-authority/create-the-root-pair.html>`__
-  `How to ensure the serial numbers of your intermediate CA and server certs are up to spec <https://www.phildev.net/ssl/creating_ca.html>`__
-  `How to generate ECC private keys <https://dev.to/benjaminblack/obtaining-an-elliptic-curve-dsa-certificate-with-lets-encrypt-51bc>`__
-  `How to find the PCKS11 URI from your HSM <https://www.infradead.org/openconnect/pkcs11.html>`__
-  `Troubleshooting (forum) <https://support.nitrokey.com/t/pki-ca-nitrokey-hsm-does-not-support-signing/2598/14>`__


This document was originally `written by lyntux <https://gist.github.com/lyntux/f02c6c3414ce48bc8ea8ab6dcdba1623>`__
