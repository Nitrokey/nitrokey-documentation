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

install nitropy in a app vm of your choice follow this `installation instructions`_

.. _installation instructions: ../../software/nitropy/all-platforms/installation.html


How to Update
-------------

.. important::
   Never disconnect the Nitrokey 3 or abort the process while updating,
   because it will likely render your device unusable!

1. Run ``nitropy nk3 reboot --bootloader`` in app vm.
2. Once instructed by ``nitropy`` touch the device to activate the bootloader.
3. This will detach the nitrokey from the app vm, and the bootloader will apear in sys-usb 
4. attach the bootloader to the app vm 
5. run ``nitropy nk3 update`` and follow the instrutions, in the end this will reboot the nitrokey to finalice the update.
6. reattch the nitrokey back to th app vm

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).


