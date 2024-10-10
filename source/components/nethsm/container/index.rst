Container
=========

Software container images of NetHSM are available for testing and production. They are distributed as OCI images and can be run locally with a compatible executor such as Docker and Podman.

Compared to the NetHSM hardware the following functions are not implemented at software container's REST API:

* Network configuration
* Factory reset
* Reboot
* Software update

Refer to the following chapters to learn more about the respective differences.

.. toctree::
   :hidden:
   :maxdepth: 1
   :glob:

   production-image.rst
   test-image.rst
