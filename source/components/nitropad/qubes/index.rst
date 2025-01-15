NitroPad with Qubes OS
======================

.. include:: ../content/shared-index-content1.rst

Getting Started
---------------

After purchase, the passwords are set to a default value and must be
changed by you:

1. Press Enter (“Default Boot”) after booting the system, provided the
   NitroPad has not shown any errors and the Nitrokey is lit green (see
   above).

2. Next, the system will prompt you to enter the passphrase to decrypt
   the hard disk. The passphrase is initially "12345678".

   .. figure:: ./images/QubesDiskPassword.jpg
      :alt: img3

3. The system will then guide you through the process of creating a user
   account. After that you should have successfully booted the system
   and could already use it normally.

4. Open the pre-installed Nitrokey App and change the PINs of your
   Nitrokey as `described here <change-pins.html>`_.

5. Change the passphrase for the hard disk encryption by searching in the Qubes Menu for "Change Disk Passwort". This passphrase is different from your user acount's passphrase.

   .. figure:: /images/qubes/ChangeDiskPasswordQubes.png
        :alt: Change Password Qubes Image 

6. We use the latest Install image offert bei Qubes, this needs to updated after install since it does not contain all the security fixes since the release of this Image. User the Update Manager for that see `Qubes Documentation <https://www.qubes-os.org/doc/how-to-update/>`__

.. note::

   Specialy for the nitropad v54 the Qubes 4.2.3 install image contains a bug that just allows the highest screen resoultion. This is fixed after you update dom0 and reboot. 
   
.. include:: ../content/shared-index-content2.rst
