System Software Update via USB
==============================

The following describes the software update process for the NetHSM system software.
This installation method should only be used if the update described in `Software Update <administration.html#software-update>`__ is not available.
Follow the instructions precisely to prevent any accidental deletion of data.
It's recommended to export a backup from the NetHSM before performing the update.

The system software update can be performed as follows.

.. tabs::
   .. tab:: NetHSM 2
      1. Download the installer image ending with ``installer.img.zip`` from the provided private download page.

      2. Unpack the installer image.

      3. Write the installer image to a USB flash drive.
         For this you could use the graphical tool `balenaEtcher <https://etcher.balena.io/>`__.
         On Linux you could also use the command line tool ``dd``.
         Ignore any warning that a partition table is missing.

      4. Connect the USB flash drive to any USB port on the front or one of the two USB 2.0 ports located in the center of the back of the machine.
         The USB 2.0 ports have a black insert in the middle of the port.

         .. note::
            Some USB drives are incompatible with the NetHSM.
            This results in the NetHSM not recognizing them as a boot media.
            In case the NetHSM does not boot from the connected USB drive, try a different USB drive model.

      5. Turn off the NetHSM and disconnect it from power.

      6. Connect a monitor and optionally a keyboard to the NetHSM.

         .. note::
            Make sure you only have the keyboard and the flash drive connected to the USB ports.

      7. Connect the NetHSM to power and wait for 10 seconds.
         Turn on the NetHSM by pressing the power button on the front.

      8. After about 30 seconds the NetHSM will show a boot menu on the monitor.
         The boot menu will default to perform the software update.
         This will take about 2 minutes.
         The machine will automatically shutdown after the update.

         Alternatively you can select **NetHSM automatic boot (USB or primary system)** in the first boot menu and then **NetHSM Software Installer** in the second boot menu.

         .. warning::
            Do **NOT** select **NetHSM Factory Reset - DELETES ALL DATA!** from the menu.
            This will irrecoverably wipe the data on the disk.

      9. Turn on the NetHSM by pressing the power button on the front.
   .. tab:: NetHSM 1
      1. Download the installer image ending with ``installer.img.zip`` from the provided private download page.

      2. Unpack the installer image.

      3. Make sure the system is turned off, but connected to power, and the power button on the back turned on.

      4. Connect the BMC network port with a network cable.

         See the image below to identify the BMC network port.

         .. figure:: ./images/nethsm1-back-with-labels.png
            :scale: 100
            :alt: Back side of the server

            Back side of the server

         Per default the BMC will wait for an address assignment with DHCP.
         If DHCP is not available the link-local address can be determined with Nmap.
         The command ``nmap <network-in-cidr-notation> -p 80 --open`` will return a list of hosts with open port 80.

      5. Open the BMC website in a web browser, using the determined IP address from the previous step.
         To login, the default credentials are username ``bmc_admin``, and password ``8mCU$3r0nE``.

         .. important::
            In case you encounter an unauthorized login error on the BMC web interface it can be one of the following issues.

            1. Username or password wrong.
            2. During factory reset the BMC generates a new TLS certificate.
               Some web browsers fail with connection errors when the certificate changes while the same window stays open.
               Close the web browser window and open a new one.
            3. The BMC software sometimes shows the issue that it doesn't accept an older session cookie which are still in the cache of the web browser.
               Clear the web browsers cache and try again.

      6. Mount the downloaded installer image by clicking in the menu on the left on **FRU: Hermes CFL (with TPM) Nitrokey Config** followed by **Virtual media** in the submenu.
         In the middle open the tab *usb0*, and click the button *Attach media*.

         .. figure:: ./images/system-recovery/bmc-usb-attach.png
            :alt: BMC menu to attach USB device

            BMC menu to attach USB device

         In the opening dialog choose **Stream local file via browser** as the **Transfer method**.
         Click the button **Browse...** and choose the downloaded installer image.
         Confirm the operation with the **Submit** button.

         .. figure:: ./images/system-recovery/bmc-usb-attach-image-selection.png
            :alt: BMC menu to select USB image

            BMC menu to select USB image

      7. In the menu on the left select **FRU: Hermes CFL (with TPM) Nitrokey Config**, and then **Remote KVM**.

      8. In the middle click the **Open a floating Remote KVM window** button, in the top right corner of the VGA output box.

         .. figure:: ./images/system-recovery/bmc-kvm-console.png
            :alt: BMC KVM console view

            BMC KVM console view

         This window will show you the graphical output of the NetHSM installer.
         Keep this second window open together with the main window from the BMC.

      9. Change to the view **Overview** from the top of the menu on the left.

      10. In the box **Override Boot Device**, select **USB_BMC-virtual_media** from the drop-down next to **Select a Boot Device**.

         .. figure:: ./images/system-recovery/bmc-boot-device-override.png
            :alt: BMC boot device setting

            BMC boot device setting

      11. In the box with the title **FRU: Hermes CFL (with TPM) Nitrokey Config**, select **On** from the drop-down menu next to **Power**.
          Confirm with the **Apply** button.

          .. figure:: ./images/system-recovery/bmc-power-on.png
             :alt: BMC power up setting

             BMC power up setting

          In the previously opened **Remote KVM** window you can now see the installation wizard.

      12. The KVM window now shows the boot dialog.
          Confirm the selection of **NetHSM automatic boot (USB or primary system)** with the **Enter** key.

          .. figure:: ./images/system-recovery/bmc-kvm-system-software-boot-selection.png
             :alt: NetHSM boot selection in the BMC KVM console

             NetHSM boot selection in the BMC KVM console

          In the following dialog confirm the selection of **NetHSM Software Installer** with the **Enter** key.

          .. figure:: ./images/system-recovery/bmc-kvm-system-software-installation-selection.png
             :alt: NetHSM installer selection in the BMC KVM console

             NetHSM installer selection in the BMC KVM console

          .. warning::
             Do **NOT** select **NetHSM Factory Reset - DELETES ALL DATA!** from the menu.
             This will irrecoverably wipe the data on the disk.

You successfully performed a system update of the NetHSM.
