Nitrokey Start, Windows
=======================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

1. Install `Gpg4win <https://www.gpg4win.org/>`__ on your Computer.
2. Connect your Nitrokey to your computer and confirm all dialogs so
   that the USB smart card device driver gets installed almost
   automatically.

   .. note::
      Windows may fail to install an additional device driver for the smart card. Its safe to ignore this warning.

3. Use GnuPG to `generate new keys or import existing ones <openpgp.html>`_.

   .. note::
      It is indeed necessary to first import or create new keys and change the PINs afterwards. Otherwise changing User PIN will fail! Furthermore overriding keys results in PIN reset (default values),  please keep this in mind!

4. Change the Admin PIN (default: ``12345678``) and then the User PIN (default: ``123456``) to your own choices.

   * The PIN must consist of at least 14 characters (starting from RTM.8), can contain any character (not only numbers). Do not select only numbers. If your environment allows that, use emoticons or national characters.
   * The longer the PIN the better. It is possible to use 6 randomly selected words instead as well for the same or better security than random character string.
   * Use ‘gpg –card-edit’ -> ‘admin’ -> ‘passwd’ to achieve this (for Admin PIN case). - Please be careful to change Admin PIN first and User PIN second! Otherwise the admin-less mode got activated, see `this instructions <https://www.fsij.org/doc-gnuk/gnuk-passphrase-setting.html#>`__ for further information.
   * Optionally Reset code can be set up (`guide <https://www.fsij.org/doc-gnuk/gnuk-passphrase-setting.html>`__). The minimum length accepted is 8 characters, however it should be as long as User PIN.
   * KDF-DO allows for a shorter PIN of 8 characters minimum, by executing part of the calculations on the PC.

**Firmware version 1.2.5 or below: In case you forget a PIN or enter it
wrongly three times you need the reset code to unblock the PIN.
Otherwise the device wouldn’t be usable anymore! Therefore
please** `set the reset
code <https://www.fsij.org/doc-gnuk/gnuk-passphrase-setting.html>`__ **as
well when initialising the key!**

Your Nitrokey is now ready to use.

Key Creation with OpenPGP or S/MIME
###################################

There are two widely used standards for email
encryption. While OpenPGP/GnuPG is popular among individuals,
S/MIME/x.509 is mostly used by enterprises. If you are in doubt which
one to choose, you should use OpenPGP.

To learn more about how to use OpenPGP for email encryption with the Nitrokey,
please refer to chapter `OpenPGP Email Encryption <openpgp.html>`_.

To learn more about how to use S/MIME for email encryption with the Nitrokey,
please refer to chapter `S/MIME Email Encryption <smime.html>`_.

Please note that the Nitrokey App can not be used for this device!
