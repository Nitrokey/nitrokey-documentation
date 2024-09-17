NitroPC with Ubuntu
===================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

Getting Started
---------------

1. During boot, the system will prompt you to enter the passphrase to decrypt
   the hard disk. Enter the default passphrase "12345678". This was changed on the 10.04.2024 so if "12345678" is not working try the old default: "PleaseChangeMe"
   The system will then guide you through the process of creating a user
   account. After that you should have successfully booted the system
   and could already use it normally.

2. Change the passphrase for disk encryption by opening a terminal and execute:

.. code-block:: bash

   sudo cryptsetup luksChangeKey /dev/nvme0n1p3
