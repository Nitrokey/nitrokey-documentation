Factory Reset
=============

.. include:: index.rst
	:start-after: products-begin
	:end-before: products-end

The PIV application can be reset to factory defaults.
It can only be reset if the PIN and PUK are blocked.

.. warning::
   Performing a factory reset of the PIV application will delete all private keys and certificates.

The reset to factory defaults can be performed as follows.

::

    nitropy nk3 piv factory-reset
