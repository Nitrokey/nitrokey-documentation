Nginx
=====

You can configure `nginx <https://nginx.org/>`__ to use NetHSM via the OpenSSL engine which then uses NetHSM's PKCS#11 module.

The certificate file has to be on the disk but the private key can be used from the NetHSM.

A full example is available `below <#example>`__.

OpenSSL Configuration
---------------------

Set up the OpenSSL engine by following the `OpenSSL Engine  setup guide <openssl.html#engine>`__.

Providers aren't supported yet by Nginx.

Nginx Configuration
-------------------

.. code-block:: 

  ssl_engine pkcs11;

  server {
      listen       443 ssl;
      server_name  localhost;

      ssl_certificate      /certs/certificate.pem;

      ssl_certificate_key "engine:pkcs11:pkcs11:object=webserver;type=private";

      ssl_session_cache    shared:SSL:1m;
      ssl_session_timeout  10s;
      ssl_session_tickets off;

      ssl_protocols TLSv1.3;
      ssl_prefer_server_ciphers  off;

      # HSTS (ngx_http_headers_module is required) (63072000 seconds)
      add_header Strict-Transport-Security "max-age=63072000" always;

      # OCSP stapling
      ssl_stapling on;
      ssl_stapling_verify on;

      location / {
          root   /usr/share/nginx/html;
          index  index.html index.htm;
      }
     
      error_page   500 502 503 504  /50x.html;
      location = /50x.html {
          root   /usr/share/nginx/html;
      }
  }

The ``ssl_certificate`` must point to a certificate file on the disk.

The ``ssl_certificate_key`` can be an OpenSSL configuration. Here we use the OpenSSL engine with the PKCS#11 module and select the private key with the label/ID ``webserver`` and the key type ``private``.

``ssl_certificate_key "engine:pkcs11:pkcs11:object=webserver;type=private";``

.. note:: 
  You must generate the certificate separately and then upload it to the NetHSM. If the certificate on disk and the key in the NetHSM don't match nginx won't start.

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

To secure the password you can provide it via an environment variable (see `Setup <setup>`__) or provide it in the nginx configuration:

.. code-block::

    ssl_certificate_key "engine:pkcs11:pkcs11:object=webserver;type=private;pin=opPassphrase";


Example
-------

If you want to experiment with the `given example <https://github.com/Nitrokey/nethsm-pkcs11/tree/main/container/nginx>`__ use git to clone the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11>`__ and run the following commands:

.. warning:: 

  Running the generate script deletes the ``webserver`` key and replaces it.

1. Configure a NetHSM, either a real one or a container. See the `getting-started guide <getting-started>`__ for more information.
2. If your NetHSM is not running on localhost, you will need to change the URL of the curl requests in ``container/nginx/generate.sh`` to point to your NetHSM.
3. Change the libnethsm_pkcs11 configuration to match your NetHSM in ``container/nginx/p11nethsm.conf``.
4. Generate the certificate and key.
  
  .. code-block:: bash
   
    ./container/nginx/generate.sh

5. Build the container.
  
  .. code-block:: bash
    
    docker build -f container/nginx/Dockerfile . -t pkcs-nginx 

6. Run the container.
  
  .. code-block:: bash
    
    docker run -p 9443:443 -p 9080:80 pkcs-nginx
  
The container will be available at `https://localhost:9443/ <https://localhost:9443/>`__.
