NitroPC with Debian
===================

.. contents:: :local:

Getting Started
---------------

1. During boot, the system will prompt you to enter the passphrase to decrypt
   the hard disk. Enter the default passphrase “PleaseChangeMe”.

2. The system has a user account setup already. Choose it and login with the default passphrase "PleaseChangeMe".
   You may keep using the existing user account or create you a new one, as you like.

3. Change the passphrase for disk encryption by opening a terminal and execute:

.. code-block:: bash

   sudo cryptsetup luksChangeKey /dev/nvme0n1p3


Using WIFI (with RTL8821ce chipset)
-----------------------------------

.. code-block:: bash

   sudo apt install bc module-assistant build-essential dkms git
   sudo m-a prepare
   git clone https://github.com/tomaspinho/rtl8821ce.git /tmp/rtl8821ce
   cd /tmp/rtl8821ce
   sudo ./dkms-install.sh

