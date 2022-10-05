NitroPC with Qubes OS
=====================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

Getting Started
---------------

1. During boot, the system will prompt you to enter the passphrase to decrypt
   the hard disk. Enter the default passphrase “PleaseChangeMe”.
   The system will then guide you through the process of creating a user
   account. After that you should have successfully booted the system
   and could already use it normally.

2. Change the passphrase for disk encryption by opening a terminal and execute:

.. code-block:: bash

   sudo cryptsetup luksChangeKey /dev/nvme0n1p3


Failed to start Load Kernel Modules
-----------------------------------

During boot of the system the error "Failed to start Load Kernel Modules" is displayed. `This is a known issue <https://github.com/QubesOS/qubes-issues/issues/2638>`__ which is not critical and can be ignored.
