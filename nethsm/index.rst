NetHSM
============================

Getting Started
---------------


1. Your NetHSM has been delivered in a sealed packaging. `Verify the sealing <sealed-hardware.html>`_ before unpacking to ensure the device has not been tampered with.

2. Connect the NetHSM's ETH port with the network. Don't use the BMC ETH port because it allows wider system access. The NetHSM is available at address 192.168.1.1.

3. Change the password of the BMC ETH Port.

4. Initialize the NetHSM using `nitropy command line tool <cli.html>`_. Alternatively, the `REST API <api.html>`_ can be used.

Further information can be obtained in other parts of the documentation.


.. toctree::
   :hidden:
   :maxdepth: 1
   :glob:

   sealed-hardware.rst
   cli.rst
   pkcs11.rst
   nginx.rst
   apache2-tls.rst
   api.rst
   tags.rst
   integration.rst
   dev-and-test.rst
   REST API Index <https://nethsmdemo.nitrokey.com/api_docs/index.html#docs/summary/summary>
