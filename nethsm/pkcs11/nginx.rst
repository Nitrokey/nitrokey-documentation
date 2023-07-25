Nginx
=====

Because Nginx doesn't directly support PKCS#11 modules, we use OpenSSL engine with our PKCS#11 module.

The certificate file has to be on the disk but the private key can be used from the NetHSM.

An example is available in the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11/tree/main/container/nginx>`__ under container/nginx.

OpenSSL Configuration
---------------------

.. code-block:: ini

  openssl_conf = openssl_init

  [openssl_init]
  engines=engine_section

  [engine_section]
  pkcs11 = pkcs11_section

  [pkcs11_section]
  engine_id = pkcs11
  dynamic_path = /usr/lib/x86_64-linux-gnu/engines-1.1/libpkcs11.so
  MODULE_PATH = /usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so
  init = 0


You need to configure the engine section to include the pkcs11 engine in the ``dynamic_path`` property and the ``libnethsm_pkcs11.so`` module in the ``MODULE_PATH`` property.

The engine can be installed on debian-based machines using

.. tabs::
  .. tab:: Debian/Ubuntu
      .. code-block:: bash
  
        apt install libengine-pkcs11-openssl

Nginx Configuration
-------------------

.. code-block:: 

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
  You must generate the certificate separately and then upload it to the NetHSM. If the certificate on disk and the key in the NetHSM don't match Nginx won't start.

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

To secure the password you can provide it via an environment variable (see `Setup <setup.html>`__). You can also provide it in the nginx configuration:

.. code-block::

    ssl_certificate_key "engine:pkcs11:pkcs11:object=webserver;type=private;pin=opPassphrase";


Executing The Example
---------------------

If you want to experiment with the given example you can clone with git the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11>`__ and run the following commands:

.. warning:: 

  Running the generate script deletes the ``webserver`` key and replaces it.

- Configure a NetHSM, either a real one or a container. See the getting-started guide for more information.
- If your NetHSM is not running on localhost, you will need to change the URL of the curl requests in ``container/nginx/generate.sh`` to point to your NetHSM.
- Change the libnethsm_pkcs11 configuration to match your NetHSM in ``container/nginx/p11nethsm.conf``.
- Generate the certificate and key.
  
  .. code-block:: bash
   
    ./container/nginx/generate.sh

- Build the container.
  
  .. code-block:: bash
    
    docker build -f container/nginx/Dockerfile . -t pkcs-nginx 

- Run the container.
  
  .. code-block:: bash
    
    docker run -p 9443:443 -p 9080:80 pkcs-nginx
  
The container will be available at `https://localhost:9443/ <https://localhost:9443/>`__.
