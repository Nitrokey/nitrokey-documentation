System Recovery
===============

The following describes the recovery process for the NetHSM system software.
These instructions are only applicable if the API is inoperable, e.g. not responding to API requests.
In the case of an operable API perform a `factory reset <administration.html#reset-to-factory-defaults>`__ instead.
Follow the instructions precicsely to prevent any accidential deletion of data.

.. important::
   The system recovery only works if the GUID partition table (GPT) and the partitions itself on the disk are not corrupted.
   A corruption could be indicated by the following message during boot.

   .. code-block::

      Booting 'NetHSM automatic boot (USB or primary system)'

      GRUB: No valid configuration found on (usb0).
      GRUB: No valid configuration found on (ahci0,gpt1).

      GRUB: Booting failed. System will switch off in 10 second.

   If they are corrupted this instructions will result in a factory installation of the NetHSM system software.

The system recovery can be performed as follows.

1. Download the installer image from the `releases page <https://github.com/nitrokey/nethsm/releases>`__.
2. Make sure the system is turned off, but connected to power, and the power button on the back turned on.
3. Connect the BMC network port with a network cable.

   See the image below to identify the BMC network port.

   .. figure:: ./images/server-back-with-labels.png
      :scale: 100
      :alt: 

      Back side of the server

   Per default the BMC will wait for an address assignment with DHCP.
   If DHCP is not available the link-local address can be determined with Nmap.
   The command ``nmap <network-in-cidr-notation> -p 80 --open`` will return a list of hosts with open port 80.
4. Open the BMC website in a web browser, using the determined IP address from the previous step.
   The credentials for login are username ``bmc_admin``, and password ``abcd1234``.

5. Mount the downloaded installer image by clicking in the menu on the left on *FRU: Hermes CFL (with TPM) Nitrokey Config* followed by *Virtual media* in the submenu.
   In the middle open the tab *usb0*, and click the button *Attach media*.

   .. figure:: ./images/bmc-usb-attach.png
      :alt: BMC menu to attach USB device

      BMC menu to attach USB device

   In the opening dialog choose *Stream local file via browser* as the *Transfer method*.
   Click the button *Browse...* and choose the downloaded installer image.
   Confirm the operation with the *Submit* button.

   .. figure:: ./images/bmc-usb-attach-image-selection.png
      :alt: BMC menu to select USB image

      BMC menu to select USB image

6. In the menu on the left select *FRU: Hermes CFL (with TPM) Nitrokey Config*, and then *Remote KVM*.
7. In the middle click the *Open a floating Remote KVM window* button, in the top right corner of the VGA output box.

   .. figure:: ./images/bmc-kvm-console.png
      :alt: BMC KVM console view

      BMC KVM console view

   This window will show you the graphical output of the NetHSM installer.
   Keep this second window open together with the main window from the BMC.
8. Change to the view *Overview* from the top of the menu on the left.
9. In the box *Override Boot Device*, select *USB_BMC-virtual_media* from the drop-down next to *Select a Boot Device*.

   .. figure:: ./images/bmc-boot-device-override.png
      :alt: BMC boot device setting

      BMC boot device setting

10.   In the box with the title *FRU: Hermes CFL (with TPM) Nitrokey Config*, select *On* from the drop-down menu next to *Power*.
      Confirm with the *Apply* button.

      .. figure:: ./images/bmc-power-on.png
         :alt: BMC power up setting

         BMC power up setting

      In the previously opened *Remote KVM* window you can now see the installation wizard.
11.   The KVM window now shows the boot dialog.
      Confirm the selection of ``NetHSM automatic boot (USB or primary system)`` with the *Enter* key.

      .. figure:: ./images/bmc-kvm-system-software-boot-selection.png
         :alt: NetHSM boot selection in the BMC KVM console

         NetHSM boot selection in the BMC KVM console

      In the following dialog confirm the selection of ``NetHSM Software Installer`` with the *Enter* key.

      .. figure:: ./images/bmc-kvm-system-software-installation-selection.png
         :alt: NetHSM installer selection in the BMC KVM console

         NetHSM installer selection in the BMC KVM console

      .. warning::
         Do NOT select ``NetHSM Factory Reset - DELETES ALL DATA!`` from the menu. This will unrecoverable wipe the data on the disk.

The NetHSM Installer will install the system software and shutdown.
