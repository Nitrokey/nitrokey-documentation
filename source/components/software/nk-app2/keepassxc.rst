KeePassXC
=========

These instructions describe how to protect and encrypt a `KeePassXC <https://keepassxc.org/>`__ password database with Nitrokey 3.

Prerequisites
^^^^^^^^^^^^^

- KeePassXC version 2.7.6 or newer is required.
- `Nitrokey App 2 <index.html>`__ version 2.2.2 or newer is required.

First Step: Generate a HMAC Secret With the Nitrokey App 2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Open Nitrokey App 2
2. Select the Nitrokey 3
3. Select the ``PASSWORDS`` tab
4. Click on ``ADD`` to create a new credential
5. Select ``HMAC`` from the algorithm drop-down menu

   .. note::
      - The credential is automatically named in ``HmacSlot2``.
      - No extra attributes can be saved for the HMAC credential.
      - The HMAC secret must be *exactly 20 bytes* long and in *Base32* format. That is exactly 32 characters.
      - It is possible to save exactly one HMAC secret on a Nitrokey 3.

6. To generate a secret, there is a button in the field on the right-hand. 
   It is also possible to enter your own secret, as long as it is compliant.

   .. warning::
      The database can no longer be unlocked if the Nitrokey 3 is lost or unavailable! Thus, you may want to set up a second Nitrokey 3 with the same HMAC secret as a backup device.  

   .. important::
      The secret can **only** be seen before saving. If the KeePassXC database is to be used with another Nitrokey 3, the HMAC secret must be copied which is **only** possible **before saving** the credential.

7. Click on ``SAVE`` to save the credential

First Option: Protect an Existing KeePassXC Database With a Nitrokey 3
**********************************************************************

1. Open KeePassXC 
2. Open the existing KeePassXC database that is to be protected with a Nitrokey 3.
3. Select ``Database`` -> ``Database Security...`` from the menu bar
4. Select ``Security`` on the left side
5. Click on the ``Add additional protection...`` button in the ``Database Credentials`` tab
6. Scroll down to ``Challenge-Response`` and click on ``Add Challenge-Response``
7. Now if the Nitrokey 3 is plugged in and a HMAC was generated before, Nitrokey 3 should be displayed in the field.

   Click on ``OK`` to add the Nitrokey 3 to the existing KeePassXC database

.. note::
    By default the Nitrokey 3 is used as a second factor in addition to the passphrase. To protect the database by the Nitrokey 3 exclusively, delete the passphrase by clicking the button ``Remove Password``.

.. tip::
    If the Nirokey 3 is not recognized, close KeePassXC completely. Then connect the Nitrokey 3 to your computer before restarting KeePassXC.



Second Option: Creating a KeePassXC Database, Protected by Nitrokey 3
*********************************************************************

1. Open KeePassXC 
2. Select ``Database`` -> ``New Database...`` from the menu bar to create a new KeePassXC database.
3. Fill in the display name and an optional description for your new database and click on ``Continue``
4. `Further database encryption settings <https://keepassxc.org/docs/>`__ can now be configured here or the default settings can be retained.
   The settings can also be changed later in the database settings. 

   Click on ``Continue`` to confirm the settings
5. **Database Credential**

   Here you can enter a password as a second factor to unlock the database.
   To connect the Nitrokey 3 (on which the HMAC secret was generated) to the new KeePassXC database, click on ``Add additional protection...``
6. Scroll down to ``Challenge-Response`` and click on ``Add Challenge-Response``
7. Now if the Nitrokey 3 is plugged in and a HMAC was generated before, Nitrokey 3 should be displayed in the field.
   Click on ``Continue`` to complete the creation of the new KeePassXC database.

.. note::
    If the passphrase is left empty, the database will be protected by the Nitrokey 3 exclusively. If a passphrase is entered, the database will be protected by the passphrase **and** the Nitrokey 3.

.. tip::
    If the Nitrokey 3 is not recognized, close KeePassXC completely. Then connect the Nitrokey 3 to your computer before restarting KeePassXC.

Troubleshooting for Linux
^^^^^^^^^^^^^^^^^^^^^^^^^
If the Nirokey 3 device is not recognised by `KeePassXC <https://keepassxc.org/>`__ on a Linux system:

* Provided that the udev rules have been set as described `here <../nitropy/linux/udev.html>`__.
* Provided that the ``pcscd service`` are has been started with: 

  .. code-block:: bash

     sudo systemctl start pcscd.service

* Install the latest version of KeePassXC with flatpak:

  .. code-block:: bash

     flatpak install flathub org.keepassxc.KeePassXC

* Install ``ccid`` on Arch Linux based systems. See also: `Arch wiki: Nitrokey <https://wiki.archlinux.org/title/Nitrokey>`__.


pcscd: Card Not Found
*********************

**Problem:**
An application using ``pcscd`` does not show the Nitrokey 3.

**Solution:**
First, make sure that ``scdaemon`` is not running (see the previous section)::

   $ gpg-connect-agent "SCD KILLSCD" /bye

Now list the smartcards recognized by ``pcscd`` with ``pcsc_scan -r``.
You should see an entry like this one::

   $ pcsc_scan -r
   Using reader plug'n play mechanism
   Scanning present readers..
   0: Nitrokey 3 [CCID/ICCD Interface] 00 00

If the Nitrokey 3 shows up, it is recognized correctly by ``pcscd`` and there might be an issue with the application that tries to access it.
If it does not show up, make sure that your ``libccid`` version is up to date.
Support for the Nitrokey 3 was added in ``libccid`` 1.5.0.

Updating The Device Database
****************************

If you cannot update ``libccid`` to a supported version, you have to manually update the device database.
The path of the database depends on your distribution:

- Arch, Debian, Ubuntu: ``/etc/libccid_Info.plist``

Make sure to backup the file before overwriting it.
You can download an `updated device database file <https://github.com/Nitrokey/nitrokey-3-firmware/blob/main/Info.plist>`__ from the ``nitrokey-3-firmware`` repository.
After updating the file, restart ``pcscd`` and run ``pcsc_scan -r`` again.
The Nitrokey 3 should now show up.
