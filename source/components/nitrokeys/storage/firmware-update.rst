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


.. tabs::
    .. tab:: Linux
        1. Download the `Nitrokey App <https://www.nitrokey.com/download>`__ and the program “dfu-programmer” which should be available through your package-manager, e.g. ``apt-get update && apt-get install dfu-programmer`` on Debian-based systems.

        2. Download the latest firmware ".hex" file from `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases/latest>`__ and store it as "firmware.hex" in your home folder. Older releases are `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases>`__.

        3. Right click on the icon of the Nitrokey App and go to “Configure” -> “Enable Firmware Update”. The default firmware password is ‘12345678’.

            .. figure:: images/firmware-update/enable-firmware-update.png
                :alt: Enable firmware update

            .. note::

                The Nitrokey Storage is not detected by Nitrokey App anymore once update mode got
                activated. You have to proceed with the instructions described below
                to make it work again.


        4. Open a terminal and execute:

            .. code-block:: bash

                sudo dfu-programmer at32uc3a3256s erase
                sudo dfu-programmer at32uc3a3256s flash --suppress-bootloader-mem firmware.hex
                sudo dfu-programmer at32uc3a3256s launch
                # versions <0.7 of dfu-programmer use "start" instead of "launch"

            whereas “firmware.hex” needs to be the path and file name of the firmware which you downloaded in step 2.
    
    .. tab:: MacOS
        1. Download the `Nitrokey App <https://www.nitrokey.com/download>`__ and the `Nitrokey Update Tool <https://github.com/Nitrokey/nitrokey-update-tool/releases/latest>`__. The Nitrokey Update Tool is currently available for macOS and Windows only.

        2. Download the latest firmware ".hex" file from `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases/latest>`__. Older releases are `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases>`__.

        3. Right click on the icon of the Nitrokey App and go to “Configure” -> “Enable Firmware Update”. The default firmware password is ‘12345678’.

            .. figure:: images/firmware-update/enable-firmware-update.png
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

            .. figure:: images/firmware-update/nitrokey-update-tool.png
                :alt: Nitrokey Update Tool

    .. tab:: Windows

        1. Download the `Nitrokey App <https://www.nitrokey.com/download>`__ and the `Nitrokey Update Tool <https://github.com/Nitrokey/nitrokey-update-tool/releases/latest>`__. The Nitrokey Update Tool is currently available for macOS and Windows only.

        2. Download the latest firmware ".hex" file from `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases/latest>`__. Older releases are `here <https://github.com/Nitrokey/nitrokey-storage-firmware/releases>`__.

        3. Right click on the icon of the Nitrokey App and go to “Configure” -> “Enable Firmware Update”. The default firmware password is ‘12345678’.

            .. figure:: images/firmware-update/enable-firmware-update.png
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

            .. figure:: images/firmware-update/nitrokey-update-tool.png
                :alt: Nitrokey Update Tool

