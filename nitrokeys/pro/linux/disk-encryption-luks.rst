Full-Disk Encryption With cryptsetup/LUKS
=========================================

.. contents:: :local:

This guide shows how to configure LUKS-encrypted volumes, to authenticate at boot with `Nitrokey Pro <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`__ or `Nitrokey Storage <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`__.

To provide some background, cryptsetup-initramfs now has support for using
OpenPGP smart cards like the Nitrokey Pro and Nitrokey Storage to unlock
LUKS-encrypted volumes. Once you finish the setup, you will just need to insert
your Nitrokey at boot and enter your User PIN, instead of typing in your
regular disk encryption passphrase.

These instructions have been tested on Ubuntu 20.04 and Debian 10.

.. warning::

   The following guide can potentially lock you out of your computer.
   You should be aware of these risks, and we recommend you use the
   script below on a secondary computer, or after a full backup as you
   might lose your data.

Requirements
------------

-  An Ubuntu or Debian computer with at least one LUKS-encrypted volume.

See the section below to determine which method is compatible with this guide.

-  A Nitrokey Pro 2 or Nitrokey Storage 2
   `initialized <openpgp.html>`_
   with keys.

Known Issues
------------

So far, the script works only with manually-partitioned volumes, that are
composed of an unencrypted ``/boot`` partition, and an encrypted root ``/``
partition.

Please do not select the automatic full-disk encryption provided by the
operating system you are using for this guide. You will face recurrent errors
when the partitioning is done automatically, using the installation interface
on Ubuntu and Debian.

Instructions
------------

1. Install dependencies

    .. code-block:: bash


        $ sudo apt install scdaemon opensc gnupg2

2. Create smartcard-luks directory

    .. code-block:: bash


        $ mkdir smartcard-luks && cd smartcard-luks

3. Download the smartcard-luks-script

    .. code-block:: bash


        $ wget https://raw.githubusercontent.com/daringer/smartcard-key-luks/main/smartcard-key-luks 
        $ sudo chmod +x smartcard-key-luks

4. Export the public key

    To export your public key from GnuPG’s keyring:

    .. code-block:: bash


        $ gpg2 --armor --export KeyID > pubkey.asc

    If you already have uploaded a public key to a keyserver (or have it stored
    somewhere else), you should retrieve it in the way you are most comfortable
    with, and proceed to step 5.

5. Determine and verify the correct LUKS device name for your root-partition:

    .. code-block:: bash

        $ cat /etc/crypttab  
        # if there is only one entry, you want the 1st column of this entry

    .. hint::
        Usually this should be something like `nvme0n1p3_crypt` (for NitroPC) or
        `sda3_crypt` (for NitroPads).  You can and should crosscheck that the UUID
        referred inside `/etc/crypttab` is the designated partition by checking the
        symbolic link inside `/dev/disks/by-uuid/`.

6. Execute the script with the luks device name (e.g., `nvme0n1p3_crypt`) and
   `pubkey.asc` as arguments.

    .. code-block:: bash

        $ sudo ./smartcard-key-luks nvme0n1p3_crypt pubkey.asc

Once, you run the script with the OpenPGP public key as argument, it
automatically sets up a new LUKS secret, encrypts it against that public key,
and sets up crypttab, LUKS, initramfs, and GRUB.

First you will be prompted for the ``User PIN``

.. figure:: /pro/linux/images/luks_1.png
   :alt: img1

Once you unlock the Nitrokey, you will be prompted for your ``OLD passphrase``.
It is the passphrase you entered to encrypt your volume at installation.

.. figure:: /pro/linux/images/luks_2.png
   :alt: img2

.. note:: This is a fall-back alternative in case you lose your Nitrokey, or if
  it’s unavailable. So far, it was not tested, and users must be aware of the
  risk of getting locked out of their computer, if the fall-back method does not
  work.

Once you enter the passphrase, the script finishes the setup in about one
minute. Do not interrupt the script, or you might get locked out of your
computer after reboot.

.. figure:: /pro/linux/images/luks_3.png
   :alt: img3

Done!

By now you must reboot, and you should be able to use your Nitrokey to unlock
your encrypted drive.

Usage
-----

After reboot you should be prompted for your User PIN

.. figure:: /pro/linux/images/luks_5.png
   :alt: img5

Enter your User PIN to unlock the drive

.. figure:: /pro/linux/images/luks_6.png
   :alt: img6


Further Hints
-------------

Change Passphrase 
^^^^^^^^^^^^^^^^^

Once this setup is done, you should not use the (gnome) *disks* utility anymore
to change the (fallback) passphrase. The proper way to do this is to call *cryptsetup*
directly like this:

.. code-block:: bash

  $ sudo cryptsetup luksChangeKey /dev/nvme0n1p3

With `nvme0n1p3` being the partition you set up the keys for. 

Use Multiple Keys
^^^^^^^^^^^^^^^^^

It is easy to use multiple (hardware) security keys so that each of them is able to unlock the 
LUKS drive independently. Just export multiple public keys and also *pass multiple keys* to the 
setup script like this:

.. code-block:: bash

   $ sudo ./smartcard-key-luks nvme0n1p3_crypt pubkey-1.asc pubkey-2.asc 


Set Cardholder Name
^^^^^^^^^^^^^^^^^^^

During the PIN entry on boot for decryption of the LUKS root partition a cardholder is presented
to the user, to set this please use ``$ gpg --edit-card`` and inside the prompt type ``admin`` and
``name`` to set the cardholder for the OpenPGP Card (Nitrokey Storage 2 or Nitrokey Pro 2).


Replace/Delete Keys
^^^^^^^^^^^^^^^^^^^

It is not possible to add/remove keys directly. Therefore you need to delete/remove the old 
setup and re-run the setup with the designated key(s):


Remove the keyfile (path, if you used the script above) from luks-device (*nvme0n1p3*):

.. code-block:: bash

   $ sudo cryptsetup luksRemoveKey /dev/nvme0n1p3 /etc/cryptsetup-initramfs/cryptkey.gpg

Remove the keyfile itself:

.. code-block:: bash

   $ sudo rm /etc/cryptsetup-initramfs/cryptkey.gpg

Re-run setup above.

Unlocking LUKS2 with X509 certificate
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

SystemD supports unlocking a LUKS2 partition using a X509 certificate, find a
great blog entry on how to realize this at the `Personal blog of Vladimir Timofeenko`_ 


.. _Personal blog of Vladimir Timofeenko: https://vtimofeenko.com/posts/unlocking-luks2-with-x509-certificate-on-nitrokey-storage/




