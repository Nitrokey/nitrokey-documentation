NetHSM
======

This documentation describes the NetHSM software and hardware.

The NetHSM software can be either used on the NetHSM hardware, or as a Docker container.
This documentation only covers the Docker container in the `Integration <integration.html>`__ chapter.

The NetHSM software features a REST API to perform installation, administration and operational tasks.
The recommended way to use the REST API is through the `nitropy <https://github.com/Nitrokey/pynitrokey>`_ tool.
Alternatively `curl <https://curl.se>`_ can be used to send HTTP requests to the REST API.
This documentation contains for each nitropy command the respective curl command.

To learn how to install nitropy, please refer to the `documentation <../software/nitropy/index.html>`__.

For the installation of curl, please refer to the project `website <https://curl.se/download.html>`_.

If you obtained a new NetHSM hardware, please refer to the chapter `Installation <installation.html#installation>`__ first.

.. important::

    If you use a NetHSM instance with a self-signed certificate, for example using the Docker image, you will have to instruct *nitropy* or *curl* to ignore the validity of the certificate.
    For *nitropy* use the option ``--no-verify-tls`` and for *curl* use the option ``--insecure/-k`` to skip the certificate check.

.. note::

    The examples in this documentation use the environment variable ``NETHSM_HOST``, which contains the IP address or URL of the NetHSM.
    On a Unix shell the variable can be set with the following command.

    .. code:: bash

        $ export NETHSM_HOST="<URL-or-IP-address>"

.. toctree::
   :hidden:
   :maxdepth: 1
   :glob:

   installation.rst
   administration.rst
   operation.rst
   api.rst
   integration.rst
   guides.rst
