Firmware Update
===============

.. include:: ./product_platform_heading.rst

This guide describes how to update the firmware on the Nitrokey FIDO2.

.. important::
   **Currently updating the firmware will delete all user data!** Make
   sure you have proper backup login methods enabled and/or ensure that
   the Nitrokey FIDO2 is not the only way to authenticate/2FA for your 
   applications/services.

How to Update
-------------

.. important::
   Never disconnect the Nitrokey FIDO2 or abort the process while updating,
   this will likely render your device useless!

Webupdate
^^^^^^^^^

The easiest way to update a Nitrokey FIDO2 is to open `update.nitrokey.com <https://update.nitrokey.com>`_ in your browser and follow the instructions on the web page.

Using the command line
^^^^^^^^^^^^^^^^^^^^^^

If the webupdate doesn't work for you, you can also use our command line tool.

1. Make sure you have the latest `pynitrokey` version installed, please check the `installation instructions`_ for your OS.
2. Run ``nitropy fido update``.
3. Touch device to activate bootloader (once instructed by ``nitropy``).
4. *macOS only:* Run update command again (once instructed by ``nitropy``).
5. Wait 3-10mins on macOS/Linux, 12-25mins on Windows.
6. The update is finished.
7. *Optional*: run ``nitropy nk3 test`` to check if device is working properly after flashing.

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).



.. _Nitrokey 3 Firmware - GitHub Releases: https://github.com/Nitrokey/nitrokey-3-firmware/releases
.. _installation instructions: ../software/nitropy/all-platforms/installation.html


