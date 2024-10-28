.. include:: ../firmware-update.rst.inc 

**Issue:** I get ``permission denied for /dev/hidrawX`` during update.
  This likely means your user has not the needed permissions to
  read/write the device. Please make sure you have set up the correct
  `udev-rules`_. Download this `udev-rules`_ set and place it in your
  udev rules directory (e.g., ``/etc/udev/rules.d``). Then remove
  your Nitrokey Pro from the USB slot and run: 
  ``udevadm control --reload-rules && udevadm trigger`` or reboot
  your machine. Afterwards the update should work without the 
  permission issue.

.. _udev-rules: https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey.rules
