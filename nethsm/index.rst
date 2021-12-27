NetHSM
======

.. contents:: :local:

Getting Started
---------------

Connect the NetHSM's ETH3 port with the network. Don't use the ETH0 port because it allows wider system access.

   .. figure:: ./images/io-shield.png
      :alt: IO Shield

The NetHSM appliance is available at address 192.168.1.1. Access and initialize the NetHSM using nitropy command line tool <cli>. Alternatively, the REST API <api> and PKCS#11 driver <pkcs11> can be used.

Development and Testing
-----------------------

A public NetHSM demo instance is available at `nethsmdemo.nitrokey.com <https://nethsmdemo.nitrokey.com>`__.

Alternatively you can run the `NetHSM Docker container <https://hub.docker.com/r/nitrokey/nethsm>`__ locally. The NetHSM container requires nested virtualization for strong separation with other containers. Thus, to start a NetHSM container you need a Linux host with
/dev/kvm available. Execute this command:

::

   $ sudo docker run --rm -ti \
       --device=/dev/kvm:/dev/kvm --device=/dev/net/tun:/dev/net/tun \
       --cap-add=NET_ADMIN -p8443:8443 nitrokey/nethsm:testing

Integration to Custom Application
---------------------------------

To integrate the NetHSM into own custom applications client libraries are available for almost all programming languages, including JavaScript, C++ and Python for example. Therefore we recommend using `OpenAPI Generator <https://github.com/OpenAPITools/openapi-generator>`__.

To list all the available languages, you enter

::

   $ docker run --pull --rm -ti openapitools/openapi-generator-cli list -i stable

Then you can generate the NetHSM client for your programming language like this:

::

   $ docker run --rm -ti -v "${PWD}/out:/out" openapitools/openapi-generator-cli generate \
       -i=https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json \
       -o /out -g javascript

The generated client code, in this example JavaScript, will be created in
the ``./out/`` directory. This folder also contains the necessary documentation how to use it.


