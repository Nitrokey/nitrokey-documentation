NitroPad with Qubes OS
======================

.. include:: ../content/shared-index-content1.rst

Getting Started
---------------

After purchase, the passwords are set to a default value and must be
changed by you:

1. Press Enter (“Default Boot”) after booting the system, provided the
   NitroPad has not shown any errors and the Nitrokey is lit green (see
   above).

2. Next, the system will prompt you to enter the passphrase to decrypt
   the hard disk. The passphrase is initially “PleaseChangeMe”. 

   .. figure:: ./images/QubesDiskPassword.jpg
      :alt: img3

3. The system will then guide you through the process of creating a user
   account. After that you should have successfully booted the system
   and could already use it normally.

4. Open the pre-installed Nitrokey App and change the PINs of your
   Nitrokey as `described here <change-pins.html>`__.

5. Change the passphrase for the hard disk encryption by running “sudo cryptsetup luksChangeKey /dev/sda2” in a terminal. This passphrase is different from your user acount's passphrase.

In case the Network Manager icon is not shown and when starting a VM an
error like “Domain sys-net has failed to start: PCI device dom0:03_00.0
does not exist” is shown, proceed as follows:

1. Open menu -> Service: sys-net -> sys-net: Qube Settings
2. Go to Devices tab
3. Remove “Unknown device” from the right side
4. Add “Network controler” device
5. Click “OK” and restart the system.

.. include:: ../content/shared-index-content2.rst
