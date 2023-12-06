Apache
======

You can configure `Apache httpd <https://httpd.apache.org/>`__ to use NetHSM via the OpenSSL engine which then uses NetHSM's PKCS#11 module.

The certificate file has to be on the disk but the private key can be used from the NetHSM.

A full example is available `below <#example>`__.

OpenSSL Configuration
---------------------

Set up the OpenSSL engine by following the `OpenSSL Engine  setup guide <openssl.html#engine>`__. (OpenSSL Providers aren't supported yet by Apache httpd.)

Httpd Configuration
-------------------

Add the following lines to your ``httpd.conf`` :

.. code-block:: 
  
  Listen 443
  #...
  LoadModule socache_shmcb_module modules/mod_socache_shmcb.so
  LoadModule ssl_module modules/mod_ssl.so
  #...

  <VirtualHost *:443>
      DocumentRoot /usr/local/apache2/htdocs
      SSLEngine on
      SSLCertificateFile /certs/certificate.pem
      SSLCertificateKeyFile "pkcs11:object=webserver"   
      ErrorLog /tmp/a-error.log
      CustomLog /tmp/a-access.log combined
  </VirtualHost>

The ``SSLCertificateFile`` must point to a certificate file on the disk.

The ``SSLCertificateKeyFile`` should be a PKCS#11 `URI <https://www.rfc-editor.org/rfc/rfc7512>`__ pointing to the private key in the NetHSM.

.. note:: 
  You must generate the certificate separately and then upload it to the NetHSM. If the certificate on disk and the key in the NetHSM don't match httpd won't start.

libnethsm_pkcs11 Configuration
------------------------------

.. code-block:: yaml

  slots:
    - label: LocalHSM
      description: Local HSM (docker)
      url: "https://192.168.3.161:8443/api/v1"
      operator:
        username: "operator"
        password: "opPassphrase"

To secure the password you can provide it via an environment variable (see `Setup <setup>`__) or provide it in the httpd configuration:

.. code-block::

    SSLCertificateKeyFile "pkcs11:object=webserver;type=private;pin=opPassphrase";


Example
-------

If you want to experiment with the `given example <https://github.com/Nitrokey/nethsm-pkcs11/tree/main/container/apache>`__ use git to clone the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11>`__ and run the following commands:

.. warning:: 

  Running the generate script deletes the ``webserver`` key and replaces it.

1. Configure a NetHSM, either a real one or a container. See the `getting-started guide <getting-started.html>`__ for more information. Besides an administrator, you are going to need an operator account.
2. Download and install the latest version of the nethsm-pkcs11 driver `available from here <https://github.com/Nitrokey/nethsm-pkcs11/releases>`__.
3. Install the OpenSSL PKCS11 engine as described in the `OpenSSL Manual <openssl.html>`__. You do not need to create a configuration file.
4. Adjust the variables ``HOST``, ``ADMIN_ACCOUNT`` and ``ADMIN_ACCOUNT_PWD`` in ``container/apache/generate.sh`` such that ``HOST`` contains your NetHSMs URL and port, ``ADMIN_ACCOUNT`` contains an administrator accounts username and ``ADMIN_ACCOUNT_PWD`` the corresponding password. Further configure the absolute path of the OpenSSL PKCS11 engine in ``OPENSSL_PKCS11_ENGINE_PATH`` and the absolute path of the NetHSM PKCS11 library in ``NETHSM_PKCS11_LIBRARY_PATH``.
5. Create a NetHSM PKCS11 configuration file in one of the `known locations <pkcs11-setup.html#configuration>`__, e.g., ``/etc/nitrokey/p11nethsm.conf``. It must have configured an operator account and use the same NetHSM instance specified in the generate script before.
6. Update the PKCS11 configuration in ``container/apache/p11nethsm.conf`` with your NetHSMs URL and valid operator credentials. 
7. Generate the certificate and key.
  
  .. code-block:: bash
   
    ./container/apache/generate.sh

8. Build the container.
  
  .. code-block:: bash
    
    docker build -f container/apache/Dockerfile . -t pkcs-httpd

9. Run the container.
  
  .. code-block:: bash
    
    docker run -p 9443:443 -p 9080:80 pkcs-httpd
  
The Apache test page will be available at `https://localhost:9443/ <https://localhost:9443/>`__. Note that your browser, hopefully, will warn you that the websites certificate is self-signed.
