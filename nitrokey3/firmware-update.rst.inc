Firmware Update
===============

.. include:: ./product_platform_heading.rst

.. only:: comment

 .. contents:: :local:

This guide describes how to update the firmware on the Nitrokey 3.

.. important::
   **For firmware v.1.0.0 and below the update will delete all user data!**    
   Make sure you have proper backup login methods enabled and/or ensure that
   the Nitrokey 3 is not the only way to authenticate/2FA for your 
   applications/services.


   **For firmware v1.0.1 and above user data is retained** during the update. Anyways, be sure to always have another device (or login method) registered with your service, if for some reason your data is not retained.

How to Update
-------------

.. important::
   Never disconnect the Nitrokey 3 or abort the process while updating,
   this will likely render your device useless!

1. Make sure you have the latest `pynitrokey` version installed, please check the `installation instructions`_ for your OS.
2. Run ``nitropy nk3 update``.
3. Once instructed by ``nitropy`` touch the device to activate bootloader.
4. *macOS only:* If instructed by ``nitropy`` run update command again.
5. Please wait until the process finished. (This may vary depending on your operating system)
6. *Optional*: run ``nitropy nk3 test`` to check if device is working properly after flashing.

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).

.. _Nitrokey 3 Firmware - GitHub Releases: https://github.com/Nitrokey/nitrokey-3-firmware/releases
.. _installation instructions: ../../software/nitropy/all-platforms/installation.html


