# Full-Disk Encryption with cryptsetup/LUKS

This guide shows how to configure LUKS-encrypted volumes, to authenticate at boot with Nitrokey Pro or Nitrokey Storage.

To provide some background, cryptsetup-initramfs now has support for using OpenPGP smart cards like the Nitrokey Pro (or Nitrokey Storage) to unlock LUKS-encrypted volumes. Once you finish th setup, you will just need to insert your Nitrokey at boot and enter your User PIN, instead of typing in your regular disk encryption passphrase.

These instructions have been tested on Ubuntu 20.04 and Debian 10.

::: warning

The following guide can potentially lock you out of your machine. You should be aware of these risks, and we recommend you use the script below on a secondary machine, or after a full backup as you might lose your data.

:::

## Requirements

- An Ubuntu (or Debian) machine with at least one luks-encrypted volume

- An initialized Nitrokey Pro (or Nitrokey Storage)

## Instructions

1. Install dependencies

```bash

$ sudo apt install scdaemon opensc gnupg2

```

The pre-packaged version will install OpenSC version 0.19.0-1. If you wish to install and use the latest release, i.e. OpenSC 0.20, you can follow these instructions.

2. Create smartcard-luks directory

```bash

$ mkdir smartcard-luks && cd smartcard-luks

```

You might use sudo if required.

2. Download the smartcard-luks-script

//// Place the link to the script

//// Requires raw format to use wget otherwise install and use git clone

3. Generate and export the OpenPGP keypair

To generate an OpenPGP keypair on-device you can refer to the following documentation, as we will not cover these instructions in this guide.

To export your public key use the following command

```bash

$ gpg2 --armor --export KeyID > pubkey.asc

```

If you already have uploaded a public key to a keyserver (or have it stored somewhere else), you shoulod retrieve it in the way you are most comfortable with, and proceed to step 4.

4. Add the public key to your local keyring

```bash

$ sudo apt-key add pubkey.asc

```

5. Execute the script wit the pubkey.asc argument

```bash

$ ./smartcard-luks-script pubkey.asc

```

You might use sudo if required.

Once, you run the script with the GPG public key, it automatically sets up a new LUKS secret, encrypts it against that public key, and sets up crypttab, LUKS, initramfs, and GRUB.

First you will be prompted for the User PIN

Once you unlock the smartcard, you will be prompted for your OLD passphrase

Notice: This is a fall-back alternative in case you lose your Nitrokey, or if it's unavailable. So far, it was not tested, and users must be aware of these risk of getting locked out of their machine, if the fall-back method does not work.

Once you enter the passphrase, the script finishes the setup

Done!

By now you must reboot, and you should be able to use your Nitrokey to unlock your encrypted drive.

## Usage

After reboot you should be prompted for your User PIN

Enter your User PIN to unlock the drive

## Known Issues

The script seems to work only with manually-partitioned volumes, that are composed of an unencrypted /boot partition, and an encrypted root / volume.

There are some errors that are recurrent when the partitioning is done automatically using the installation interface on Ubuntu and Debian.
