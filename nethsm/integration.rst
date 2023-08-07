Integration
===========

The chapter describes processes for various tasks and aims at all user groups.

PKCS#11
-------

The NetHSM supports the PKCS#11 standard.
The required driver is available from the `repository <https://github.com/Nitrokey/nethsm-pkcs11>`__.
The repository containes the source code and libraries, for different operating systems.

The `PKCS#11 guide <pkcs11-setup.html>`_ describes how to use them in detail.

.. important::
   This driver is still an early Proof of Concept implementation that only implements the
   functions that are necessary for operating TLS servers.

Development and Testing
-----------------------

A public NetHSM demo instance is available at `nethsmdemo.nitrokey.com <https://nethsmdemo.nitrokey.com/api/v1/info>`_.

Alternatively, you can run the NetHSM as a `Docker container <https://hub.docker.com/r/nitrokey/nethsm>`_ locally.

The container can be executed as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ sudo docker run --rm -ti -p8443:8443 nitrokey/nethsm:testing

   .. tab:: Podman
      .. code-block:: bash

         $ podman run --rm -ti -p8443:8443 nitrokey/nethsm:testing

This will provide the REST API on the port `8443` via the HTTPS protocol.

.. important::
   The container uses a self-signed TLS certificate.
   Make sure to use the correct connection settings to establish a connection.
   Please refer to chapter `NetHSM introduction <index.html>`__ to learn more.

Integration into Custom Application
-----------------------------------

To integrate the NetHSM into own custom applications, client libraries are available for almost all programming languages.
Therefore, we recommend using `OpenAPI Generator <https://github.com/OpenAPITools/openapi-generator>`_.

The list of all available languages can be retrieved as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ docker run --rm -ti openapitools/openapi-generator-cli list -i stable
   
   .. tab:: Podman
      .. code-block:: bash

         $ podman run --rm -ti openapitools/openapi-generator-cli list -i stable

The NetHSM client can be generated for your programming language as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ docker run --rm -ti -v "${PWD}/out:/out" openapitools/openapi-generator-cli generate -i=https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.yaml -o out -g javascript

   .. tab:: Podman
      .. code-block:: bash

         $ podman run --rm -ti -v "${PWD}/out:/out" openapitools/openapi-generator-cli generate -i=https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.yaml -o out -g javascript

The generated client code, in this example JavaScript, will be created in the ``./out/`` directory.
This folder also contains the necessary documentation how to use it.

.. important::
   If Podman is used with enforcing SELinux, a labeling to the volume mount might be required.
   The mode of SELinux can be requested with ``sestatus |grep "Current mode"``.
   If the mode is set to ``enforcing``, a change to the context is required.
   In this case the volume mount must be postfixed with ``:z``, resulting in ``-v "${PWD}/out:/out:z"``.

REST-API
~~~~~~~~

The NetHSM's API specification is available in `OpenAPI format <https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.yaml>`_,
and can be inspected and tested in the `API browser <https://nethsmdemo.nitrokey.com/api_docs/index.html>`_.
