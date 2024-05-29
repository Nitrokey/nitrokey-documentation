Firmware Update With Qubes OS
=============================

.. only:: comment

 .. contents:: :local:

This guide describes how to update Nitrokey 3's firmware with nitropy in Qubes OS. 

.. important:: 
   please read the general `firmware update instructions`_ before! Since for specifc versions there are limitations regarding what data is possible to migrate to the new version. 

.. _firmware update instructions: ./firmware-update.html


Setup
-----

Install nitropy in a app VM of your choice following the `installation instructions`_.

.. _installation instructions: ../../software/nitropy/all-platforms/installation.html


How to Update
-------------

.. important::
   Never disconnect the Nitrokey 3 or abort the process while updating,
   because it will likely render your device unusable!

1. Run ``nitropy nk3 reboot --bootloader`` in app VM.
2. Once instructed by ``nitropy`` touch the device to activate the bootloader.
3. This will detach the nitrokey from the app VM, and the bootloader will apear in sys-usb 
4. Attach the bootloader to the app VM 
5. Run ``nitropy nk3 update`` and follow the instructions. This will reboot the Nitrokey to finalice the update eventually.
6. Re-attach the Nitrokey back to th app VM

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).
