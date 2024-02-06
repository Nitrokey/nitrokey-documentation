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
   the hard disk. Enter the default passphrase "12345678". This was change on the 15.01.2024 so if "12345678" is not working try the old default: "PleaseChangeMe"
   The system will then guide you through the process of creating a user
   account. After that you should have successfully booted the system
   and could already use it normally.

2. Change the passphrase for disk encryption by searching in the Qubes Menu for "Change Disk Password"

   .. figure:: ../../images/qubes/ChangeDiskPasswordQubes.png
        :alt: Change Password Qubes Image



Failed to start Load Kernel Modules
-----------------------------------

During boot of the system the error "Failed to start Load Kernel Modules" is displayed. `This is a known issue <https://github.com/QubesOS/qubes-issues/issues/2638>`__ which is not critical and can be ignored.
