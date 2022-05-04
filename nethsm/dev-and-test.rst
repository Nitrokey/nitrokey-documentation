.. highlight:: none

Development and Testing
-----------------------

A public NetHSM demo instance is available at `nethsmdemo.nitrokey.com <https://nethsmdemo.nitrokey.com>`_.

Alternatively you can run the `NetHSM Docker container <https://hub.docker.com/r/nitrokey/nethsm>`_ locally. The NetHSM container requires nested virtualization for strong separation with other containers. Thus, to start a NetHSM container you need a Linux host with
/dev/kvm available. Execute this command:

::

   $ sudo docker run --rm -ti --device=/dev/kvm:/dev/kvm --device=/dev/net/tun:/dev/net/tun --cap-add=NET_ADMIN -p8443:8443 nitrokey/nethsm:testing

.. include:: _tutorial.rst
   :start-after: .. start:: inspect-key
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: key-certificates
   :end-before: .. end
   
   Decryption

We can encrypt data for the key stored on the NetHSM using openssl. (public.pem is the public key file that we created in the Show Key Details section.)

::

$ echo 'NetHSM rulez!' | openssl rsautl -encrypt -inkey public.pem -pubin | base64 > data.crypt

