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

-  If the Nitrokey is not accepted immediately, you may need to install the Nitrokey udev rules, see :doc:`../../../software/nitropy/linux/udev`.
