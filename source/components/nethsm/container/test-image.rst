Test Image
----------

The test image is provided for testing and development purposes.
It does not offer to run the NetHSM process with hardware-based separation (KVM), to encrypt the data store, or to use an external etcd.
The connection between the NetHSM process and the integrated key-value store is unencrypted.
The image is distributed as OCI image and can be run locally with a compatible executor such as Docker and Podman.

.. include:: container-hardware-restriction.rst.inc

The image can be obtained from `Docker Hub <https://hub.docker.com/r/nitrokey/nethsm>`_.

.. warning::

   Do not use the test image under any circumstances for production data and use cases.
   For production environments with high security demands you must use the production image.

Tagging Policy
^^^^^^^^^^^^^^

The images in the repository are tagged with the Git commit hash from the main branch of the `repository <https://github.com/nitrokey/nethsm>`__.
The latest image is tagged with ``testing``.

Configuration
^^^^^^^^^^^^^

The image can be configured with the following environment variables.

+----------------------+--------------------------------------+
| Environment variable | Description                          |
+======================+======================================+
| ``DEBUG_LOG``        | Enables extended logging for NetHSM. |
+----------------------+--------------------------------------+

Usage
^^^^^

The container can be executed as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ docker run --rm -ti -p 8443:8443 docker.io/nitrokey/nethsm:testing

   .. tab:: Podman
      .. code-block:: bash

         $ podman run --rm -ti -p 8443:8443 docker.io/nitrokey/nethsm:testing

This will run NetHSM as a Unix process inside the container and expose the REST API via the HTTPS protocol on port `8443`.

.. important::
   The container uses a self-signed TLS certificate.
   Make sure to use the correct connection settings to establish a connection.
   Please refer to chapter `NetHSM introduction <index.html>`__ to learn more.