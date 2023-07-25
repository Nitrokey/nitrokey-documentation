NetHSM
======

This documentation describes the NetHSM software and hardware.

The NetHSM software can be either used on the NetHSM hardware, or as a Docker container.
This documentation only covers the Docker container in the `Integration <integration.html>`__ chapter.

The NetHSM software features a REST API to perform installation, administration and operational tasks.
The recommended way to use the REST API is through the `nitropy <../software/nitropy/index.html>`_ tool.
Alternatively `curl <https://curl.se>`_ can be used to send HTTP requests to the REST API.

If you obtained a new NetHSM hardware, please refer to the chapter `Getting Started <getting-started.html#getting-started>`__ first.
In case you want to restore a backup of a NetHSM, please refer to the chapter `Restore <administration.html#restore>`__.

.. important::

   If you use a NetHSM instance with a self-signed certificate, for example using the Docker container, you will have to instruct *nitropy* or *curl* to ignore the validity of the certificate.
   For *nitropy* use the option ``--no-verify-tls`` and for *curl* use the option ``--insecure/-k`` to skip the certificate check.

.. note::

   The examples in this documentation use the environment variable ``NETHSM_HOST``, which contains the IP address or URL of the NetHSM.
   On a Unix shell the variable can be set with the following command.

   .. code-block:: bash

      $ export NETHSM_HOST="<URL-or-IP-address>"

.. toctree::
   :hidden:
   :maxdepth: 1
   :glob:

   getting-started.rst
   administration.rst
   operation.rst
   integration.rst
   pkcs11-setup.rst
   pkcs11-tool.rst
   nginx.rst
   ssh.rst
   opendnssec.rst

