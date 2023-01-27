FIDO2 With Linux
================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

.. include:: ../shared/index-content1.rst.inc

Troubleshooting
---------------

If the Nitrokey is not detected, proceed the following:

1. Copy this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__
   to ``/etc/udev/rules.d/``. In very rare cases, the system will need
   the `older
   version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`__
   of this file.
2. Restart udev via ``sudo service udev restart``.
