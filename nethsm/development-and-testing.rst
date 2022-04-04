Development and Testing
-----------------------

A public NetHSM demo instance is available at `nethsmdemo.nitrokey.com <https://nethsmdemo.nitrokey.com>`_.

Alternatively you can run the `NetHSM Docker container <https://hub.docker.com/r/nitrokey/nethsm>`_ locally. The NetHSM container requires nested virtualization for strong separation with other containers. Thus, to start a NetHSM container you need a Linux host with
/dev/kvm available. Execute this command:

::

   $ sudo docker run --rm -ti \
       --device=/dev/kvm:/dev/kvm --device=/dev/net/tun:/dev/net/tun \
       --cap-add=NET_ADMIN -p8443:8443 nitrokey/nethsm:testing

