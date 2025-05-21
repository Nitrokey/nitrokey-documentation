Factory Reset
=============

.. product-table:: nk3

The PIV smart card can be reset to factory defaults.
It can only be reset if the PIN and PUK are blocked.

.. warning::
   Performing a factory reset of the PIV smart card will delete all private keys and certificates.

The reset to factory defaults can be performed as follows.

::

    nitropy nk3 piv --experimental factory-reset
