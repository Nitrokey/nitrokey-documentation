Firmware Update
===============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

This guide describes how to update the firmware on the Nitrokey 3.

.. important::
   **Currently updating the firmware will delete all user data!** Make
   sure you have proper backup login methods enabled and/or ensure that
   the Nitrokey 3 is not the only way to authenticate/2FA for your 
   applications/services.

.. warning::
   For Windows the firmware update is still **experimental**, because it 
   takes a very long time > 12mins. We recommend to wait for the next
   release(s) until this issue is fixed.

How to update
^^^^^^^^^^^^^^^^^^^^^^^^^^
.. important::
   Never disconnect the Nitrokey 3 or abort the process while updating,
   this will likely render your device useless!

1. Make sure you have the latest `pynitrokey` version installed, please check the `installation instructions`_ for your OS
2. Run ``nitropy nk3 update`` (for Windows use of the ``--experimental`` switch is required)
3. Touch device to activate bootloader (once instructed by ``nitropy``)
4. *macOS only:* Run update command again (once instructed by ``nitropy``)
5. Wait 3-10mins on macOS/Linux, 12-25mins on Windows
6. The update is finished
7. *Optional*: run ``nitropy nk3 test`` to check if device is working properly after flashing

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).

.. _Nitrokey 3 Firmware - GitHub Releases: https://github.com/Nitrokey/nitrokey-3-firmware/releases
.. _installation instructions: https://github.com/Nitrokey/pynitrokey#installation


