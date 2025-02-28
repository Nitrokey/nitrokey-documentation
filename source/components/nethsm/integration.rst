Integration
===========

The chapter describes processes for various tasks and aims at all user groups.

REST-API
~~~~~~~~

NetHSM's primary interface is a modern REST-API that guarantees best performance and functionality.
The API specification is available in `OpenAPI format <https://nethsmdemo.nitrokey.com/api_docs/nethsm-api.yaml>`_,
and can be inspected and tested in the `API browser <https://nethsmdemo.nitrokey.com/api_docs/index.html>`_.

PKCS#11
-------

The NetHSM supports the PKCS#11 standard.
The required driver is available from the `repository <https://github.com/Nitrokey/nethsm-pkcs11>`__.
The repository containes the source code and libraries, for different operating systems.
The `PKCS#11 guide <pkcs11-setup.html>`_ describes the usage in detail.

Development and Testing
-----------------------

Demo Instance
^^^^^^^^^^^^^

A public NetHSM demo instance is available at `nethsmdemo.nitrokey.com <https://nethsmdemo.nitrokey.com/api/v1/info>`_.
It will be reset every eight hours (CET 6:00, 14:00, 22:00). User "admin", password "adminadmin", unlock password "unlockunlock".

Container Image
^^^^^^^^^^^^^^^

NetHSM `container images <container/index.html>`__ are available for testing and production.

Integration Into Custom Application
-----------------------------------

To integrate the NetHSM into own custom applications, client libraries are available for almost all programming languages. Here are our libraries for `Python <https://github.com/Nitrokey/nethsm-sdk-py>`_ and `Rust <https://github.com/Nitrokey/nethsm-sdk-rs>`_ as well as 3rd party libraries for `Rust <https://crates.io/crates/nethsm>`_ and `Go <https://github.com/borud/nethsm>`__. For all other programming languages we recommend using `OpenAPI Generator <https://github.com/OpenAPITools/openapi-generator>`_.

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

Command-line interface
----------------------

Users may administrate and use a NetHSM using a dedicated command-line interface (CLI).
Nitrokey offers ``nitropy``, which is distributed in the Python based `pynitrokey <https://pypi.org/project/pynitrokey/>`_.
With ``nethsm`` an alternative third-party application exists, which is developed in the Rust crate `nethsm-cli <https://crates.io/crates/nethsm-cli/>`_.
