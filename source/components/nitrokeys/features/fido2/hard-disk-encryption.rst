Full-Disk Encryption with cryptsetup/LUKS
=========================================

.. product-table:: nk3 passkey fido2

This guide shows how to configure LUKS-encrypted volumes, to unlock the system disk at boot with a FIDO2 capable Nitrokey.

To provide some background, cryptsetup-initramfs now has support for using
FIDO2 security keys like the Nitrokey 3 and Nitrokey Passkey to unlock
LUKS-encrypted volumes. Once you finish the setup, you will just need to insert
your Nitrokey at boot and enter your User PIN, instead of typing in your
regular disk encryption passphrase.

These instructions have been tested on Ubuntu 26.04.

.. note::

   This method works with the automatically created volumes 
   created by the automatic full-disk encryption provided by the operating system.

.. warning::

   The following guide can potentially lock you out of your computer.
   You should be aware of these risks, and we recommend to procede only after a full backup as you
   might lose your data.

Requirements
------------

-  at least one LUKS-encrypted volume

-  a FIDO2 capable Nitrokey with FIDO2 PIN

-  cryptsetup

-  systemd

-  libfido2 / fido2-tools

-  initramfs-tools

Instructions
------------

1. Get the device-name of the LUKS patition

    .. code-block:: bash
    
    
        $ lsblk

    Get the partition with the "dm_crypt-0" in it. For example "/dev/nvme0n1p3".


2. Add a Nitrokey security token

    .. code-block:: bash


        $ sudo systemd-cryptenroll --fido2-device=auto <disk-device-name>

    .. note::
    
    The Nitrokey must be plugged in, and only one should be plugged in.


3. Set the Nitrokey as default for disk unlock at startup

    Edit the file "/etc/crypttab" e.g. with nano:

    .. code-block:: bash


        $ sudo nano /etc/crypttab
    
    Add the option "fido2-device=auto" into the fourth column:

    .. code-block:: bash


        <name: e.g. dm_crypt-0> <UUID> none luks,fido2-device=auto


4. Update the initramfs

    .. code-block:: bash
    
    
        $ sudo update-initramfs -u

Done!

By now you must reboot, and you should be able to use your Nitrokey to unlock
your encrypted drive.

    .. note::
    By now you will need your Nitrokey to unlock your disk at startup. 
    If you lose you Nitrokey you will need another PC or operating system to unlock the partition with your passphrase, 
    to recover you data or to add an new Nitrokey.
    Because of that we recommending adding another Nitrokey as backup. For that see below. 

Usage
-----

After reboot you should be prompted to enter your User PIN to unlock the drive.


Further Hints
-------------

Change Passphrase 
^^^^^^^^^^^^^^^^^

Once this setup is done, you should not use the (gnome) *disks* utility anymore
to change the passphrase (not Nitrokey PIN). The proper way to do this is to call *cryptsetup*
directly like this:

    .. code-block:: bash

        $ sudo cryptsetup luksChangeKey <disk-device-name> 

Use Multiple Nitrokeys
^^^^^^^^^^^^^^^^^

It is easy to use multiple FIDO2 Nitrokeys so that each of them is able to unlock the 
LUKS drive independently. Just add it like before:

    .. code-block:: bash

        $ sudo systemd-cryptenroll --fido2-device=auto <disk-device-name>

    .. note::
    
    The Nitrokey must be plugged in, and only one should be plugged in.


Delete Nitrokeys
^^^^^^^^^^^^^^^^^^^

If you want to remove a Nitrokey e.g. because it got lost you will need to delete all Nitrokeys and add them again.

1. Delete the Nitrokeys

    .. code-block:: bash
    
        $ sudo systemd-cryptenroll --wipe-slot=fido2 <disk-device-name>

2. Add the Nitrokeys again

    Just add the Nitrokeys again like before:

    .. code-block:: bash

        $ sudo systemd-cryptenroll --fido2-device=auto <disk-device-name>

    .. note::
    
    The Nitrokey must be plugged in, and only one should be plugged in.
