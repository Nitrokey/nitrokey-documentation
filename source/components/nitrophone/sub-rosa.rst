sub rosa
========

.. product-table:: nk3 pro start storage


sub rosa can program an OpenPGP key onto your Nitrokey, allowing you to encrypt, decrypt, cryptographically sign documents, or authenticate to remote servers via SSH. An OpenPGP key acts as your digital identity.

Just like KeePassDroid managing passwords, OpenKeychain or PGPony manage OpenPGP keys. You can easily import OpenPGP keys generated or stored by these apps in sub rosa and then program them onto your Nitrokey.

.. note::

    For further information or issue/feature proposal, please refer to the `source repository <https://github.com/naive-HA/subrosa>`__.

Installation
------------

- sub rosa is available on `F-Droid <https://apt.izzysoft.de/packages/acab.naiveha.subrosa>`__ if you have the `IzzyOnDroid repository <https://apt.izzysoft.de/fdroid/index/info>`__.

- On the `Google Play Store <https://play.google.com/store/apps/details?id=acab.naiveha.subrosa.by.naiveha>`__.

- You can also download the ``.apk`` file in the  `source repository <https://github.com/naive-HA/subrosa>`__.

Features
--------

You can use sub rosa with any Nitrokey compatible with OpenPGP and manage your OpenPGP identities.

- On-the-Go OpenPGP Management: Program OpenPGP keys (RSA, NIST P-curves, Brainpool, Ed25519, X25519).

- Field PIN Management: Change or unblock User and Admin PINs on the fly.

- Firmware Updates: update your Nitrokey 3A or 3C directly from your phone.


Import OpenPGP Keys From OpenKeychain
-------------------------------------

sub rosa works closely with OpenKeychain. OpenKeychain manages OpenPGP keys, handling generation, secure storage, and backups.

Importing keys from OpenKeychain is a breeze. Share a key backup with sub rosa and enter the backup code provided by OpenKeychain. Because this backup code—consisting of 36 numbers and dashes—cannot be copied directly to the clipboard from OpenKeychain, sub rosa includes Tesseract (an Optical Character Recognition library) to make the process effortless:

1.    Take a screenshot of the OpenKeychain app displaying the backup code and share that screenshot with sub rosa.
2.    Select the region containing the backup code and tap **EXTRACT PASSWORD**.
3.    The backup code will be copied to your clipboard. Return to OpenKeychain and tap **SHARE BACKUP**.
4.    Paste the backup code into sub rosa and get ready to write your private OpenPGP key to your security key.


.. list-table::
   :widths: 33 33 33
   :class: borderless

   * - .. figure:: ./images/subrosa1.png
          :width: 100%

     - .. figure:: ./images/subrosa2.png
          :width: 100%

     - .. figure:: ./images/subrosa3.png
          :width: 100%



How to import OpenPGP keys from PGPony
--------------------------------------

Similarly to OpenKeychain, PGPony manages OpenPGP keys, handling generation, secure storage, and backups.

Importing keys from PGPony is even easier. Share a key backup with sub rosa and hit "WRITE OPENPGP KEY". That's all.

.. list-table::
   :widths: 33 33 33
   :class: borderless

   * - .. figure:: ./images/subrosa4.png
          :width: 100%

     - .. figure:: ./images/subrosa5.png
          :width: 100%

     - .. figure:: ./images/subrosa6.png
          :width: 100%


Nitrokey 3 firmware update
--------------------------

Since version 3.0.0 sub rosa can update the firmware of Nitrokey 3A and 3C.

Nitrokey 3A mini use NRF52 hardware and are not supported by sub rosa. Yet

.. list-table::
   :widths: 33 33 33
   :class: borderless

   * - .. figure:: ./images/subrosa7.png
          :width: 100%

     - .. figure:: ./images/subrosa8.png
          :width: 100%

     - .. figure:: ./images/subrosa9.png
          :width: 100%
