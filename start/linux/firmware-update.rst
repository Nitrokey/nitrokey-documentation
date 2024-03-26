Firmware Update
===============

.. important::
   Updating could lead to data loss, so make sure you have proper backup login methods enabled and/or ensure that
   the Nitrokey Start is not the only way to authenticate/2FA for your 
   applications/services.

.. important::
   Never disconnect the Nitrokey Start or abort the process while updating,
   this will likely render your device useless

.. contents:: :local:

To update the firmware of your Nitrokey Start, proceed as follows.

1. Install pip3.

   .. code-block:: bash

      $ sudo apt install python3-pip 

2. Install pynitrokey. For this you need an Internet connection.

   .. code-block:: bash

      $ pip3 install --user pynitrokey 

3. Connect your Nitrokey Start and verify its recognition.

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      $ nitropy start list
            *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
            :: 'Nitrokey Start' keys:
            FSIJ-1.2.15-87042524: Nitrokey Nitrokey Start (RTM.8) 

4. Start the update process. For this you need an Internet connection.

   .. code-block:: bash

      $ nitropy start update 

5. You will then be asked to enter the Admin PIN of your Nitrokey Start.
   (Default PIN: 12345678)

   .. code-block:: bash

      *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
      Nitrokey Start firmware update tool
      Platform: Linux-5.3.0-59-generic-x86_64-with-Ubuntu-18 04-bionic
      System: Linux, is_linux: True
      Python: 3.6.9
      Saving run log to: /tmp/nitropy.log.d4erqux4
      Admin password: "your admin PIN"

6. Under “Device” you will find information about the current version of
   your Nitrokey Start. In the first item under “Please note” you can
   see the latest firmware version available. Now you have to confirm
   the update with “yes”.

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      Firmware data to be used:

      - FirmwareType.REGNUAL: 4504, hash: ...b'65ac82a1' valid (from ...built/RTM.10/regnual.bin)

      - FirmwareType.GNUK: 131072, hash: ...b'f85da8f7' valid (from ...prebuilt/RTM.10/gnuk.bin)
      Currently connected device strings:
      Device:
         Vendor: Nitrokey
      Product: Nitrokey Start
         Serial: FSIJ-1.2.15-43100927
      Revision: RTM.9
         Config: NITROKEY_START:dfu=no:debug=no:pinpad=no:certdo=yes:factory_reset=yes
            Sys: 3.0
      Please note:

      - Latest firmware available is: RTM.10 (published: 2020-06-04T12:34:14Z),
      provided firmware: None

      - All data will be removed from the device

      - Do not interrupt the update process, or the device will not run properly

      - Whole process should not take more than 1 minute
      Do you want to continue? [yes/no]: yes

7. You can check the firmware version after the upgrade process has
   completed.

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      $ nitropy start list 
      *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
      :: 'Nitrokey Start' keys:
      FSIJ-1.2.15-87042524: Nitrokey Nitrokey Start (RTM.10)
