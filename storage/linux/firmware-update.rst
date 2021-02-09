Firmware Update
===============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

.. danger::

   You should backup all data from the device before upgrading, as
   firmware upgrades may destroy all data on the device (especially
   coming from firmware version <0.45)!

Basically you need both, the Nitrokey App and the program
“dfu-programmer”. The Nitrokey App can be found here, dfu-programmer
should be available through your package-manager,
e.g. ``apt-get update && apt-get install dfu-programmer`` on
Debian-based systems.

Please enable Firmware Update mode as described above through the
Nitrokey App. Afterwards, open a terminal and type in the following
three commands:

.. code-block:: bash

   sudo dfu-programmer at32uc3a3256s erase
   sudo dfu-programmer at32uc3a3256s flash --suppress-bootloader-mem firmware.hex
   sudo dfu-programmer at32uc3a3256s launch # versions <0.7 of dfu-programmer use "start" instead of "launch"

whereas “firmware.hex” is the file you have downloaded before as
described above. “at32uc3a3256s” is the name of the controller in the
Nitrokey that dfu-programmer should use.
