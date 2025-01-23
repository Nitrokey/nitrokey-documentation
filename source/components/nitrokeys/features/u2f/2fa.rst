Two-Factor Authentication (2FA)
===============================

.. product-table:: fido2 u2f nk3 passkey

1. Open one of the `websites that support FIDO
   U2F <https://www.dongleauth.com/>`__.
2. Log in to the website and enable two-factor authentication in your
   account settings. (In most cases you will find a link to the
   documentation of the supported web service at
   `dongleauth.com <https://www.dongleauth.com/>`__)
3. Register your Nitrokey in the account settings by touching the
   button to activate the Nitrokey. After you have successfully
   configured the device, you must activate the Nitrokey this way
   each time you log in.

You are now ready to go.

.. important::
    The Nitrokey App can not be used for the Nitrokey U2F.

Troubleshooting (Linux)
-----------------------

-  If the Nitrokey is not accepted immediately, you may need to copy
   this file
   `41-nitrokey.rules <https://raw.githubusercontent.com/Nitrokey/nitrokey-udev-rules/main/41-nitrokey.rules>`__
   to ``etc/udev/rules.d/``. In very rare cases, the system will need
   the `older
   version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`__
   of this file.

-  After copying the file, restart udev via
   ``sudo service udev restart``.
