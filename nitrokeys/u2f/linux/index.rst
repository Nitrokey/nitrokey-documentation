Nitrokey FIDO U2F With Linux
============================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

.. include:: ../shared/index-content1.rst

Troubleshooting
---------------

-  If the Nitrokey is not accepted immediately, you may need to copy
   this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__
   to ``etc/udev/rules.d/``. In very rare cases, the system will need
   the `older
   version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`__
   of this file.

-  After copying the file, restart udev via
   ``sudo service udev restart``.
