Factory Reset
=============
.. contents:: :local:

The multiple identites feature allows to use 3 virtual smart cards in place of one, giving bigger flexibility in the every day use, as well as separation between user identities (business, personal etc.) or even allowing usage of it for more than one user (PINs are separate).

All of the smart cards have separate data objects, meaning they all could have different keys, certificates stored, and PINs set. Identities do not intereact between each other.

This means each identity needs to be resetted on its own.

Old versions (below 1.2.5) of the firmware might need special treatment (see below). 
Usage
-----

To change the identity it suffices to send a custom CCID command. This could be achieved with ``pynitrokey`` tool:

1. `Install pynitrokey <../../software/nitropy/all-platforms/installation.html>`.

2. Connect your Nitrokey Start and verify that it got recognized.

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      $ nitropy start list
         *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
         :: 'Nitrokey Start' keys:
         FSIJ-1.2.15-87042524: Nitrokey Nitrokey Start (RTM.10) 

3. Change the identity, by replacing ``<ID>`` with ``0``, ``1``, or ``2``.

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      $ nitropy start set-identity <ID>
         *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
         Trying to set identity to <ID>4
         device has reset, and should now have the new identity

Reset
-----

.. code-block:: bash

   $ gpg --card-edit

In the menu enter `admin` and then `factory-reset`

This will reset the current identity. To reset  all identitites the following needs to be done:

.. code-block:: bash

    $ nitropy start set-identity 2`
    $ gpg --card-edit` -> admin -> factory-reset
    $ nitropy start set-identity 1`
    $ gpg --card-edit` -> admin -> factory-reset
    $ nitropy start set-identity 0`
    $ gpg --card-edit` -> admin -> factory-reset

It deletes all keys, pins, configurations and meta data associated with the respective identity.


Reset code
----------

This step is optional with new firmware.. You can add a reset code which enable the reset of the User PIN (not the Admin PIN). For older Firmware it is recommended since it is needed to reset the device (see below)


`Checkout the documentation here <https://www.fsij.org/doc-gnuk/gnuk-passphrase-setting.html#set-up-pw1-pw3-and-reset-code>`__.




Firmware below 1.2.5
--------------------
Nitrokey Start firmware 1.2.2 to 1.2.5:
---------------------------------------

If and only if the device is not blocked (PIN wasn't typed in wrong too often) you can use the same procedure as in newer firmware (see above). You need the reset code to unblock device or you can not use the device anymore!

Nitrokey Start firmware 1.0:
----------------------------
In order to reset a Nitrokey Start 1.0, you need to define a public key for `firmware updates <http://no-passwd.net/askbot/question/34/how-gnuk-supports-firmware-upgrade/>`__ beforehand! In case of a blocked device it enables you to perform a firmware update which resets the device.

