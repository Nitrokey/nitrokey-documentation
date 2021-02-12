Firmware Update
===============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

This guide describes how to update the Heads firmware of the NitroPad.

These instructions are relevant in the following cases:

-  You want to update the Heads firmware.

-  You have already performed an OEM factory reset, but the TPM counter
   has not been reset.

Preparation
~~~~~~~~~~~

1. Connect your NitroPad to a power plug and load its battery to over
   70%
2. Download the `latest
   firmware <https://github.com/Nitrokey/heads/releases>`__ and store it
   on a USB drive. The files are in the “Assets” dropdown box at the end
   of the release information.
3. For hash sum verification, store ``SHA256SUM.txt`` file at the USB
   drive.

E.g. for ``v1.1-rc3`` version: 1. Firmware should be downloaded from `here <https://github.com/Nitrokey/heads/releases/tag/v1.1-rc3>`__ 2. Firmware and hashsum files should be located on the USB drive in the main directory:

.. code-block:: bash

   /nitropad_x230_v1.1-rc3.rom
   /SHA256SUM.txt

Firmware file verification
^^^^^^^^^^^^^^^^^^^^^^^^^^

It is mandatory to run a firmware file consistency check before writing it to the device. After copying the firmware file to the USB drive make sure the latter is properly unmounted/ejected to avoid write issues. The consistency check should be run on NitroPad, so the data verified will be exact same as the later read by the update application. This action will not be required in the further firmware updates.

1. Start Nitropad and open recovery console from
   ``Options -> Exit to recovery shell``
2. Execute the following to verify the firmware:

.. code-block:: bash

   $ mount-usb              # select USB device
   $ cd /media
   $ sha256sum -c SHA256SUM.txt

For ``v1.1-rc3`` version this should result in:

.. code-block:: bash

   $ sha256sum -c SHA256SUM.txt
   nitropad_x230_v1.1-rc3.rom: OK

This confirms the content of the file is as expected. Please reboot the Nitropad to continue (either by switching off and powering on again, or hitting CTRL+ALT+DELETE).

Procedure
~~~~~~~~~

This is the actual update procedure. Usually the first two screens will not be shown - in that case please start from step 3.

1. (Optional screen) Select “Ignore error and continue to default boot
   menu”.

.. figure:: /x230/images/firmware-update/1.jpg
   :alt: img1



2. (Optional screen) Select “Ignore error and continue to default boot
   menu”.

.. figure:: /x230/images/firmware-update/2.jpg
   :alt: img2



3. Go to “Options”.

.. figure:: /x230/images/firmware-update/3.jpg
   :alt: img3



4. Select “Flash/Update the BIOS”.

.. figure:: /x230/images/firmware-update/4.jpg
   :alt: img4



5. Please confirm the first option.

.. figure:: /x230/images/firmware-update/5.jpg
   :alt: img5



6. Confirm the process with Enter.

.. figure:: /x230/images/firmware-update/6.jpg
   :alt: img6



7. Select the desired .rom file.

.. figure:: /x230/images/firmware-update/7.jpg
   :alt: img7



8. Confirm the process with Enter.

.. figure:: /x230/images/firmware-update/8.jpg
   :alt: img8



9. Confirm the restart with Enter.

.. figure:: /x230/images/firmware-update/9.jpg
   :alt: img9



Now you have updated your firmware.

Further steps
~~~~~~~~~~~~~

In case ``ERROR: TOTP Generation Failed!`` screen will show up, please follow the instructions for Factory Reset (on the left side menu), starting from step 11.
