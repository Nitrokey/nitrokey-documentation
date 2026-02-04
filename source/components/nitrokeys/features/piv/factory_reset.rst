Factory Reset
=============

.. product-table:: nk3

The PIV smart card can be reset to factory defaults.

.. warning::
   Performing a factory reset of the PIV smart card will delete all private keys and certificates.

The reset to factory defaults can be performed as follows.

::

    opensc-tool -s 00:A4:04:00:0B:A000000308000010000100 -s 00:20:00:80:08:3333333333333333 -s 00:20:00:80:08:3333333333333333 -s 00:20:00:80:08:3333333333333333 -s 00:FB:00:00


Or, using ``nitropy nk3 piv --experimental factory-reset``, after 3 failed attempts at logging in (when the PIN counter is blocked).

