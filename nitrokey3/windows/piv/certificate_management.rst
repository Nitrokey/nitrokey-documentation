Certificate Management
======================

Every private key has a certificate associated. The certificates can be read and written.
The size of a certificate is limited by the transport layer and about 6kB.


Read Certificate
----------------

Certificates can be read from the Nitrokey per key slot.

The certificate can be retrieved as follows.

.. code-block::

    nitropy nk3 piv --experimental read-certificate --key-slot <key-slot>``


Write Certificate
-----------------

Certificates can be written to the Nitrokey per key slot.

.. code-block::

    nitropy nk3 piv --experimental write-certificate --key-slot <key-slot>
