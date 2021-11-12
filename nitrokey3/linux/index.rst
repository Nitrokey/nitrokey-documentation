Nitrokey 3 with Linux
================

.. include:: ../../fido2/shared/index-content1.rst

Troubleshooting
---------------

If the Nitrokey is not detected, proceed the following:

1. Copy this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__
   to ``/etc/udev/rules.d/``.
2. Restart udev via ``sudo service udev restart``.
