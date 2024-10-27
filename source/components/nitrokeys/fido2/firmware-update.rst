Firmware Update
===============

This guide describes how to update the firmware on the Nitrokey FIDO2.

.. important::
   User Data is retained during firmware update. Anyways, be sure to **always** have another device (or login method) registered with your service, if for some reason your data is not retained.

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
2. Run ``nitropy fido2 update``.
3. Once instructed by ``nitropy`` touch the device to activate bootloader.
4. *macOS only:* If instructed by ``nitropy`` run update command again.
5. Please wait until the process finished. (This may vary depending on your operating system

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).



.. _installation instructions: /software/nitropy/all-platforms/installation.html


