Container
^^^^^^^^^

For the NetHSM two container images are available for testing and production.

The container image is distributed as an OCI image and can be obtained from `Docker Hub <https://hub.docker.com/r/nitrokey/nethsm>`_.
It can be run locally with a compatible executor, e.g. Docker or Podman.

Compared to the NetHSM hardware the following functions are not implemented at software container's REST API:

* network configuration
* factory reset
* reboot
* software update

The container can be executed as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ sudo docker run --rm -ti -p8443:8443 nitrokey/nethsm:testing

   .. tab:: Podman
      .. code-block:: bash

         $ podman run --rm -ti -p8443:8443 docker.io/nitrokey/nethsm:testing 

This will run NetHSM as a Unix process inside the container and expose the REST API on the port `8443` via the HTTPS protocol.

Additionaly to running the NetHSM as a Unix process it can be run as a unikernel supported by KVM.

The container can be executed as follows.

.. tabs::
   .. tab:: Docker
      .. code-block:: bash

         $ docker run -ti --rm -p 8443:8443 --device /dev/net/tun --device /dev/kvm --cap-add=NET_ADMIN nitrokey/nethsm:testing

This will run NetHSM as a unikernel inside a KVM virtual machine.
The container will expose the REST API, via the HTTPS protocol, on the interface `tap200` with the IP address `192.168.1.100` and port `8443`.

.. important::
   The container uses a self-signed TLS certificate.
   Make sure to use the correct connection settings to establish a connection.
   Please refer to chapter `NetHSM introduction <index.html>`__ to learn more.
