Nitrokey Storage FAQ
====================

As the Nitrokey Storage 2 is essentially a Nitrokey Pro 2 including a
non-volatile (encrypted) storage, the :doc:`Nitrokey Pro 2 FAQ <../pro/faq>` also partly applies.

.. faq:: Which Operating Systems are supported?

   Windows, Linux and macOS.

.. faq:: What can I use the Nitrokey for?

   See the `overview <https://www.nitrokey.com/products/nitrokeys>`__ of supported use cases.

.. faq:: What are the default PINs?

   * **User PIN:** "123456"
   * **Administrator PIN:** "12345678"
   * **Firmware Password**: "12345678"
   
   We strongly recommend to change these PINs/password to user-chosen values
   before using the Nitrokey.

.. faq:: How large is the storage capacity?

   Nitrokey Storage can store and encrypt 8, 32, or 64 GB of data (depending on
   particular model).

.. faq:: Why can't I access the encrypted storage on a new Nitrokey Storage?

   On a new Nitrokey Storage device, before you can access the encrypted volume
   make sure you first "Destroy encrypted data" inside the Nitrokey App.

.. faq:: What is the maximum length of the PIN?

   Nitrokey uses PINs instead of passwords. The main difference is that the
   hardware limits the amount of tries to three while a limit doesn't exist for
   passwords. Because of this, a short PIN is still secure and there is not need
   to choose a long and complex PIN.

   Nitrokey Storage's PINs can be up to 20 digits long and can consist
   of numbers, characters and special characters. Note: When using GnuPG or
   OpenSC, 32 character long PINs can be used but aren't supported by Nitrokey
   App.

.. faq:: What is the User PIN for?

   The user PIN is at least 6-digits long and is used to get
   access to the contect of the Nitrokey. This is the PIN you will use a lot in
   every day use e.g. for decrypting messages, for unlocking your encrypted
   storage (NK Storage only) etc.
  
   The user PIN can have up to 20 digits and other characters (e.g. alphabetic
   and special characters). But as the user PIN is blocked as soon three wrong
   PIN attempts were done, it is sufficiently secure to only have a 6 digits
   PIN. The default PIN is ``123456``.

.. faq:: What is the Admin PIN for?

   The admin PIN is at least 8-digits long and is used to change
   contents/settings of the Nitrokey. That is to say after initializing the
   Nitrokey you probably won't need this PIN too often (e.g. if you want to add
   another password to the password safe of the Nitrokey Pro or Nitrokey
   Storage).
  
   The admin PIN can have up to 20 digits and other characters (e.g. alphabetic
   and special characters). But as the admin PIN is blocked as soon three wrong
   PIN attempts were done, it is sufficiently secure to only have 8 digits PIN.
   The default PIN is ``12345678``.

.. faq:: Why does my Nitrokey Storage hang when switching between nitrokey-app and GnuPG?

   GnuPG and nitrokey-app sometimes tend to hand each other. This is a known problem
   and it can be fixed by re-inserting the Nitrokey into the USB slot.

.. faq:: What is the firmware PIN for?

   The firmware password should meet general password
   recommandations (e.g. use alphabetic characters, digits and special
   characters or use a usfficiently long password). The firmware password is
   needed to update the firmware of the Nitrokey Storage. See further
   instructions for update process here.

   The firmware password is never blocked. An attacker could try to guess the
   password and would have unlimited attempts. Therefore you must choose a
   strong password. The default password is 12345678.

.. faq:: How many keys can I store? 

   The Nitrokey Storage can store three RSA key pairs. All keys use the same
   identity but are used for different purposes: authentication, encryption and
   signing.

.. faq:: How fast is encryption and signing?

   Encryption of 50kiB of data:

   * 256 bit AES, 2048 bytes per command -> 880 bytes per second
   * 128 bit AES, 2048 bytes per command -> 893 bytes per second
   * 256 bit AES, 240 bytes per command -> 910 bytes per second
   * 128 bit AES, 240 bytes per command -> 930 bytes per second

.. faq:: Which algorithms and maximum key length are supported?

   See the following table:

   +-------------------+---------+-----------+
   |                   | Storage | Storage 2 |
   +-------------------+---------+-----------+
   | RSA 1024          | ✓       |           |
   +-------------------+---------+-----------+
   | RSA 2048          | ✓       | ✓         |
   +-------------------+---------+-----------+
   | RSA 3072          | ✓       | ✓         |
   +-------------------+---------+-----------+
   | RSA 4096          | ✓       | ✓         |
   +-------------------+---------+-----------+
   | Curve25519        |         |           |
   +-------------------+---------+-----------+
   | NIST-P 192        |         |           |
   +-------------------+---------+-----------+
   | NIST-P 256        |         | ✓         |
   +-------------------+---------+-----------+
   | NIST-P 384-521    |         | ✓         |
   +-------------------+---------+-----------+
   | Brainpool 192     |         |           |
   +-------------------+---------+-----------+
   | Brainpool 256-320 |         | ✓         |
   +-------------------+---------+-----------+
   | Brainpool 384-521 |         | ✓         |
   +-------------------+---------+-----------+
   | secp192k1         |         |           |
   +-------------------+---------+-----------+
   | secp256k1         |         |           |
   +-------------------+---------+-----------+
   | secp521k1         |         |           |
   +-------------------+---------+-----------+

.. faq:: Does the Nitrokey Storage contain a secure chip or just a normal microcontroller?

   Nitrokey Storage contains a tamper resistant smart card.

.. faq:: Is the Nitrokey Storage Common Criteria or FIPS certified?

   The security controller (NXP Smart Card Controller P5CD081V1A and its major
   configurations P5CC081V1A, P5CN081V1A, P5CD041V1A, P5CD021V1A and P5CD016V1A
   each with IC dedicated Software) is Common Criteria EAL 5+ certified up to the OS
   level.

   * `Certification Report <https://commoncriteriaportal.org/files/epfiles/0555a_pdf.pdf>`__
   * `Security Target <https://commoncriteriaportal.org/files/epfiles/0555b_pdf.pdf>`__
   * `Maintenance Report <https://commoncriteriaportal.org/files/epfiles/0555_ma1a_pdf.pdf>`__
   * `Maintenance ST <https://commoncriteriaportal.org/files/epfiles/0555_ma1b_pdf.pdf>`__`)

   Additionally `Cure53 <https://cure53.de>`__ has performed an `independent security audit <https://www.nitrokey.com/news/2015/nitrokey-storage-got-great-results-3rd-party-security-audit>`__ of the hardware, firmware, and Nitrokey App.

.. faq:: How can I use the True Random Number Generator (TRNG) of the Nitrokey Storage for my applications?

   Both devices are compatible to the OpenPGP Card, so that `scdrand`_ should work. `This script`_ may be useful.
   The user comio `created a systemd file`_ to use scdrand and thus the TRNG more generally. He created an `ebuild for Gentoo`_, too.

.. faq:: How good is the Random Number Generator?

   Nitrokey Pro and Nitrokey Storage use a True Random Number Generator (TRNG)
   for generating keys on the device. The entropy generated by the TRNG is used
   for the entire key length. Therefore the TRNG is compliant to `BSI TR-03116`_.

   The TRNG provides about 40 kbit/s.
    
.. faq:: How can I use the encrypted mobile Storage?

   Prior of using the encrypted mobile storage you need to install and initialize the Nitrokey Storage and download the latest Nitrokey App.

   * Start the Nitrokey App.
   * Press its tray icon and select "unlock encrypted volume" in the menu.
   * Enter your User PIN in the appearing popup window.
   * If this is the first time you may need to create a partition on the encrypted volume. Windows will open an appropriate window and ask you to do so. On Linux and Mac you may need to open a partition manager and create a partition manually. You can create as many partitions as you want. We recommend FAT(32) if you want to access the partition from various operating systems.
   * Now you can use the encrypted volume as you would use any other ordinary USB drive. But all data stored on it will be encrypted in the Nitrokey hardware automatically.
   * To remove or lock the encrypted volume you should unmount/eject it first.
   * Afterwards you can disconnect the Nitrokey or select "lock encrypted volume" from the Nitrokey App menu.

   The Nitrokey Storage is able to create hidden volumes as well. Please have a look at the corresponding instructions for hidden volumes.

.. faq:: How can I use the hidden volume?

   Hidden volumes allow to hide data in the encrypted volume. The data is protected
   with an additional password. Without the password the data existence's can't be
   proven. Hidden volumes are not setup by default so that their existence can be
   denied plausibly. The concept is similar to VeraCrypt's/TrueCrypt's hidden
   volume but with Nitrokey Storage the entire functionality of hidden volumes is
   implemented in hardware.

   You can configure up to four hidden volumes. Once unlocked, hidden volumes
   behave like ordinary storage where you can create various partitions,
   filesystems and store files as you like.

   If you decide to configure Hidden Volumes, you can not use the encrypted storage
   anymore. Because the Hidden Volume is situated on the free space of the
   encrypted storage, there is the potential of overwriting data in the Hidden
   Volume. You can say, even the encrypted storage "does not know" that there is a
   hidden volumes. The general structure is shown in the diagram below. Therefore,
   please do not write anything in the encrypted storage after creating a hidden
   volume (you have to unlock it first though).

   Hidden volumes are like containers inside of a container, the encrypted volume.

.. _scdrand: http://www.incenp.org/dvlpt/scdrand.html
.. _This script: https://lists.gnupg.org/pipermail/gnupg-users/2017-June/058456.html
.. _created a systemd file: https://support.nitrokey.com/t/scdrand-systemd-service-and-gentoo-ebuild/1164
.. _ebuild for Gentoo: https://github.com/comio/comio-overlay/tree/master/app-crypt/scdtools
.. _BSI TR-03116: https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Technische-Richtlinien/TR-nach-Thema-sortiert/tr03116/TR-03116_node.html

