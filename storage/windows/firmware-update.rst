Firmware Update
===============

.. contents:: :local:

.. warning::

   You should backup all data from the device before upgrading, as
   firmware upgrades may destroy all data on the device (especially
   coming from firmware version <0.45)!

.. important::
   Never disconnect the Nitrokey Start or abort the process while updating,
   this will likely render your device useless


1. Download the `Nitrokey App <https://www.nitrokey.com/download>`__ and the `Nitrokey Update Tool <https://github.com/Nitrokey/nitrokey-update-tool/releases/latest>`__. The Nitrokey Update Tool is currently available for macOS and Windows only.

2. Download the latest firmware ".hex" file from `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases/latest>`__. Older releases are `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases>`__.

3. Right click on the icon of the Nitrokey App and go to “Configure” -> “Enable Firmware Update”. The default firmware password is ‘12345678’.

.. figure:: /storage/images/enable-firmware-update.png
   :alt: Enable firmware update

.. note::

   The Nitrokey Storage is not detected by Nitrokey App anymore once update mode got
   activated. You have to proceed with the instructions described below
   to make it work again.

.. note::

   If you are using Microsoft Windows Build 1809 and Nitrokey Storage
   Firmware 0.52 or lower, you need to use another system or if this is not
   feasible use `these
   instructions <firmware-update-manually.html>`_ to
   enable the Firmware Update mode.

4. Start the Nitrokey Update Tool and click “Select firmware file”. Select the previously downloaded firmware ".hex" file. Click on “Update firmware” to start the update process. Your device should get detected by the Nitrokey App again as soon as the update is finished.

.. figure:: /storage/windows/images/nitrokey-update-tool.png
   :alt: Nitrokey Update Tool

