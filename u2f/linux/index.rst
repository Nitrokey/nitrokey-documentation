Nitrokey FIDO U2F with Linux
============================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

The Nitrokey FIDO U2F supports **two-factor authentication (2FA)**. With
two-factor authentication (2FA), the Nitrokey FIDO U2F is checked in
addition to the password.

The Nitrokey FIDO U2F can be used with any current browser.

Two-Factor Authentication (2FA)
-------------------------------

1. Open one of the `websites that support FIDO
   U2F <https://www.dongleauth.com/>`__.
2. Log in to the website and enable two-factor authentication in your
   account settings. (In most cases you will find a link to the
   documentation of the supported web service at
   `dongleauth.com <https://www.dongleauth.com/>`__)
3. Register your Nitrokey FIDO U2F in the account settings by touching
   the button to activate the Nitrokey FIDO U2F. After you have
   successfully configured the device, you must activate the Nitrokey
   FIDO U2F this way each time you log in.

`Checkout <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`__
the various use cases and supported applications.

.. important::

   The Nitrokey App can not be used for the Nitrokey FIDO U2F.

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
