Production Image
----------------

The production image is provided for production environments with high security demands.
The image is distributed as OCI image and can be run locally with a compatible executor such as Docker and Podman.
It requires an external etcd key-value store and offers to run the NetHSM process with hardware-based separation (KVM).
The connection between the NetHSM process and the key-value store is encrypted.
Additionally, the required secrets such as certificates and private keys can be set through the secrets feature of the container executor.

.. include:: container-hardware-restriction.rst.inc

The NetHSM production container is a product for paying customers only and can be purchased `here <https://www.nitrokey.com/contact>`__.
The image can be obtained from `Nitrokey NetHSM registry <https://registry.git.nitrokey.com/distribution/nethsm>`_ using the credentials provided after purchase.

.. warning::

   The security of the NetHSM software container strongly depends on the platform's security.
   A compromised platform could easily compromise a NetHSM software container it executes.
   In addition the TRNG is not existent so that the entropy used and provided by the NetHSM depends on the platform's entropy. 

Tagging Policy
^^^^^^^^^^^^^^

The images in the repository are tagged with the Git commit hash and the version of the release.
The latest image is tagged with ``latest``.

Modes of Operation
^^^^^^^^^^^^^^^^^^

The image can be run in two modes of operation, i.e. Unix process or unikernel.

The Unix process mode runs NetHSM as a process on top of the operating system.

The unikernel mode runs NetHSM as a guest in a KVM based virtual machine and provides strong separation from the host operating system.
This mode is only available on Linux and requires access to the ``/dev/tun`` and ``/dev/kvm`` device nodes and the ``NET_ADMIN`` capability.

.. important::

   For security choose to run the container in the unikernel mode.

The mode can be set with the environment variable ``MODE`` (see next chapter `Configuration <container.html#production-image-configuration>`__).

Configuration
^^^^^^^^^^^^^

The container can be configured with the following environment variables.

+----------------------+----------------------------------------------------------------------------------------------------+
| Environment variable | Description                                                                                        |
+======================+====================================================================================================+
| ``DEBUG_LOG``        | Enables extended logging for NetHSM.                                                               |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``UNLOCKPW``         | A set unlock passphrase automatically unlocks the container during start.                          |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``MODE``             | The mode accepts the values `unix` or `unikernel`, defaults to `unix`.                             |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``ETCD_HOST``        | The URL/IP address of the host running the etcd service.                                           |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``ETCD_PORT``        | The port running the etcd service, defaults to `2379`.                                             |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``ETCD_CA_CERT``     | The path to the certificate of the CA (Certificate Authority) which signed the client certificate. |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``ETCD_CLIENT_CERT`` | The path to the certificate for the client authentication.                                         |
+----------------------+----------------------------------------------------------------------------------------------------+
| ``ETCD_CLIENT_KEY``  | The path to the secret key for the client authentication.                                          |
+----------------------+----------------------------------------------------------------------------------------------------+

The container runtime secrets such as certificates and private keys need to be set with the secrets feature of Docker or Podman.

+-----------------+----------------------------------------------------------------------------------------------------------------------------------+
| Secret variable | Description                                                                                                                      |
+=================+==================================================================================================================================+
| ``ca_cert``     | CA certificate which signed the client certificate and server certificate.                                                       |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------+
| ``client_cert`` | Client certificate for authentication of the NetHSM process with the key-value store.                                            |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------+
| ``client_key``  | Client key for authentication of the NetHSM process with the key-value store.                                                    |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------+
| ``server_cert`` | Server certificate for the API of the key-value store.                                                                           |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------+
| ``server_key``  | Server key for the API of the key-value store.                                                                                   |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------+
| ``device_key``  | Device key of the NetHSM process. To learn more about the device key refer to chapter                                            |
|                 | `Terminology and Conventions <https://github.com/Nitrokey/nethsm/blob/main/docs/system-design.md#terminology-and-conventions>`__ |
|                 | in the system design.                                                                                                            |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------+

Usage
^^^^^

The production container supports two `modes of operation <container.html#Modes of Operation>`__. The following chapters describe how to run the container with the provided compose files or with the _run_ command.

Unix Mode
~~~~~~~~~

You can obtain a provided compose file `here <https://raw.githubusercontent.com/Nitrokey/nethsm/refs/heads/main/src/container/alpine/compose-unix.yaml>`__.
Make sure you have the necessary files for the secrets, mentioned in the compose file, available.

To run the container without the compose file you need to provide an external etcd yourself.
`Here <https://quay.io/coreos/etcd>`__ you find the recommended container image for etcd.
Make sure to pass the configuration options, as described in chapter `Configuration <container.html#production-image-configuration>`__.

The container can be executed as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ docker run -ti --rm -p 8443:8443 registry.git.nitrokey.com/distribution/nethsm:latest

   .. tab:: Podman
      .. code-block:: bash

         $ podman run -ti --rm -p 8443:8443 registry.git.nitrokey.com/distribution/nethsm:latest

This will run NetHSM as a Unix process inside the container and expose the REST API on the port `8443` via the HTTPS protocol.

.. important::
   The container uses a self-signed TLS certificate.
   Make sure to use the correct connection settings to establish a connection.
   Please refer to chapter `NetHSM introduction <index.html>`__ to learn more.

Unikernel Mode
~~~~~~~~~~~~~~

You can obtain a provided compose file `here <https://raw.githubusercontent.com/Nitrokey/nethsm/refs/heads/main/src/container/alpine/compose-unikernel.yaml>`__.
Make sure you have the necessary files for the secrets, mentioned in the compose file, available.

To run the container without the compose file you need to provide an external etcd yourself.
`Here <https://quay.io/coreos/etcd>`__ you find the recommended container image for etcd.
Make sure to pass the configuration options, as described in chapter `Configuration <container.html#production-image-configuration>`__.

The container can be executed as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ docker run -ti --rm -p 8443:8443 --device /dev/net/tun --device /dev/kvm --cap-add=NET_ADMIN -e "MODE=unikernel" registry.git.nitrokey.com/distribution/nethsm:latest

   .. tab:: Podman
      .. code-block:: bash

         $ podman run -ti --rm -p 8443:8443 --device /dev/net/tun --device /dev/kvm --cap-add=NET_ADMIN -e "MODE=unikernel" registry.git.nitrokey.com/distribution/nethsm:latest

This will run NetHSM as a unikernel inside a KVM virtual machine.
The container will expose the REST API, via the HTTPS protocol, on the interface `tap200` with the IP address `192.168.1.100` and port `8443`.

.. important::
   The container uses a self-signed TLS certificate.
   Make sure to use the correct connection settings to establish a connection.
   Please refer to chapter `NetHSM introduction <index.html>`__ to learn more.
