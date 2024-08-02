.. contents:: :local:

`Strong Swan <https://www.strongswan.org/>`__ works using the `PKCS#11 driver <https://www.nitrokey.com/documentation/applications#pkcs11>`__. Basically follow these steps:

1. Generate a key on Nitrokey via pkcs11-tool. In this example it's a 4096 bit RSA key.

.. code-block:: bash

 $ pkcs11-tool --module /usr/lib/x86_64-linux-gnu/pkcs11/opensc-pkcs11.so -l -k --key-type rsa:4096 --id 10 --label 'Staging Access'

2. Generate a certificate signing request via openssl + pkcs11 module

.. code-block:: bash

 $ openssl
 OpenSSL> engine dynamic -pre SO_PATH:/usr/lib/x86_64-linux-gnu/engines-1.1/pkcs11.so -pre ID:pkcs11 -pre LIST_ADD:1 -pre LOAD -pre MODULE_PATH:/usr/lib/x86_64-linux-gnu/pkcs11/opensc-pkcs11.so
 OpenSSL> req -engine pkcs11 -sha256 -new -key id_10 -keyform engine -out user@email.com-staging-cert.csr -subj '/C=GB/L=Cambridge/O=Organization/OU=Staging Access/CN=user@email.com/emailAddress=user@email.com'

3. Sign the certificate with your certificate authority

4. Convert the certificate to DER

.. code-block:: bash

 $ openssl x509 -in user@email.com-staging-cert.csr -out user@email.com-staging-cert.der -outform DER

5. Import  the certificate into the Nitrokey via pkcs11-tool

.. code-block:: bash

  $ pkcs11-tool --module /usr/lib/x86_64-linux-gnu/pkcs11/opensc-pkcs11.so -l -y cert -w user@email.com-staging-cert.der --id 10 --label 'Staging Access'

6. Configure Strongswan to load opensc-pkcs11 module then to load the certificate on Nitrokey. Edit /etc/strongswan.d/charon/pkcs11.conf and add the following module:

.. code-block:: bash

 modules {
    Nitrokey {
        path = /usr/lib/x86_64-linux-gnu/pkcs11/opensc-pkcs11.so
    }
 }


7. Initiate the VPN connection via IPSec/Strongswan, then prompt for Nitrokey PIN

8. VPN is now connected