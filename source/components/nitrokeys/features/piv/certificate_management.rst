Certificate Management
======================

.. product-table:: nk3

Every private key has a certificate associated. The certificates can be read and written.
The size of a certificate is limited by the transport layer and about 6kB.


Read Certificate
----------------

Certificates can be read from the Nitrokey per key slot.

The certificate can be retrieved as follows.

::

    nitropy nk3 piv read-certificate --key-slot <key-slot>``


Write Certificate
-----------------

Certificates can be written to the Nitrokey per key slot.

::

    nitropy nk3 piv write-certificate --key-slot <key-slot>
