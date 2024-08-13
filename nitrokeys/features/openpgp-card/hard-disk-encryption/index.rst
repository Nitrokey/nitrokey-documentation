Hard Disk Encryption
====================

.. section products-begin
.. list-table::
   :width: 100%
   :header-rows: 1

   * - `Nitrokey 3 <https://docs.nitrokey.com/nitrokeys/nitrokey3/index.html>`_
     - `Passkey <https://docs.nitrokey.com/nitrokeys/passkey/index.html>`_
     - `FIDO2 <https://docs.nitrokey.com/nitrokeys/fido2/index.html>`_
     - `U2F <https://docs.nitrokey.com/nitrokeys/u2f/index.html>`_
     - `HSM 2 <https://docs.nitrokey.com/nitrokeys/hsm/index.html>`_
     - `Pro 2 <https://docs.nitrokey.com/nitrokeys/pro/index.html>`_
     - `Start <https://docs.nitrokey.com/nitrokeys/start/index.html>`_
     - `Storage 2 <https://docs.nitrokey.com/nitrokeys/storage/index.html>`_

   * - ✓
     - ⨯
     - ⨯
     - ⨯
     - ✓
     - ✓
     - ✓
     - ✓
.. section products-end

.. contents:: :local:

VeraCrypt (formerly TrueCrypt)
------------------------------

`VeraCrypt <https://www.veracrypt.fr/en/Home.html>`__ is a free and Open Source disk encryption software for Windows, macOS, and GNU+Linux. It is the successor of TrueCrypt and thus recommended, although the following instructions should apply to TrueCrypt as well.

Follow these steps to use the program with `Nitrokey Storage
2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`__ or `Nitrokey Pro
2 <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`__:

1. Install the latest release of
   `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__, or download the
   `PKCS#11 library <https://smartcard-auth.de/download-en.html>`__.
2. Choose the library in VeraCrypt under Settings>Preferences>Security
   Token (location depends on system, e.g. ``/usr/lib/opensc``).
3. Generate a 64 Byte key file via Tools>Keyfile Generator.
4. Now you should be able to import the generated key file via
   Tools>Manage Security Token Keyfiles. You should choose the first
   Slot (``[0] User PIN``). The keyfile is then stored on the Nitrokey
   as ‘Private Data Object 1’ (``PrivDO1``).
5. After this you should wipe the original keyfile on your Computer
   securely!
6. Now you can use VeraCrypt with the Nitrokey: Create a container,
   choose the keyfile on the device as an alternative to a password.

.. warning::

   Security Consideration

   Please note that VeraCrypt doesn’t make use of the full security
   which Nitrokey (and smart cards in general) offer. Instead it stores
   a keyfile on the Nitrokey which theoretically could be stolen by a
   computer virus after the user enters the PIN.

Note: `Aloaha Crypt <https://www.aloaha.com/aloaha-crypt-disk/>`__ is based on TrueCrypt/VeraCrypt but without the described security limitation.

Hard Disk Encryption on GNU+Linux with LUKS/dm-crypt
----------------------------------------------------

For setting up LUKS Disk Encryption follow our guide:

.. toctree::
	:maxdepth: 1

	Full-Disk Encryption With cryptsetup/LUKS <luks>


Purism has created a `simple script <https://docs.puri.sm/PureBoot/LibremKeyLUKS.html>`__ to add the Nitrokey/LibremKey as a way to unlock LUKS partitions (not tested by Nitrokey yet).

`This project <https://github.com/artosan/nitroluks/>`__ aims to ease the use of LUKS with the Nitrokey Pro or Storage based on the Password Safe (not tested by Nitrokey yet). A description on how to use it on Gentoo can be found `here <https://amedeos.github.io/gentoo/nitrokey/2019/01/21/gentoo-nitrokey-luks.html>`__.

For Arch Linux, see `initramfs-scencrypt <https://github.com/fuhry/initramfs-scencrypt>`__.

Storage Encryption on GNU+Linux with EncFS
------------------------------------------

.. tip::

   Prerequisite

   Please ensure that you `installed the device driver, changed the
   default PINs and generated or imported keys with
   GnuPG <https://www.nitrokey.com/start>`__.

`EncFS <https://github.com/vgough/encfs>`__ is an easy to utlity for encrypted file systems and it is based on `FUSE <https://de.wikipedia.org/wiki/Filesystem_in_Userspace>`__. You may follow these steps to use it with very long passwords and Nitrokey Pro
2:

Initialization
''''''''''''''

1. Create a key file with random data:
                                      

    .. code-block:: bash

        $ dd bs=64 count=1 if=/dev/urandom of=keyfile

2. Encrypt the key file and use the User-ID of your Nitrokey
                                                            

    .. code-block:: bash

        $ gpg --encrypt keyfile

3. Remove the key file in clear text:
                                     

    .. code-block:: bash

        $ rm keyfile # you may want to use 'wipe' or 'shred' to securely delete the keyfile

4. Create mount point:
                      

    .. code-block:: bash

        $ mkdir ~/.cryptdir ~/cryptdir 

5. Create the actual encryption folder
                                      

    .. code-block:: bash

        $ gpg -d keyfile.gpg | encfs -S ~/.cryptdir ~/cryptdir
        # There may appears an error message about missing permission of fusermount
        # This message can be ignored

6. Unmount the new file system:
                               

    .. code-block:: bash

        $ fusermount -u ~/cryptdir

Usage
'''''

1. Mount encrypted file system and enter PIN of Nitrokey:
                                                         

    .. code-block:: bash

        $ gpg -d keyfile.gpg | encfs -S ~/.cryptdir ~/cryptdir 

2. After usage, unmount the file system:
                                        

    .. code-block:: bash

        $ fusermount -u ~/cryptdir

Storage Encryption on GNU+Linux with ECryptFS
---------------------------------------------

`eCryptfs <https://www.ecryptfs.org/>`__ is a file based transparent encryption file system for GNU+Linux which can be used with Nitrokey through a PKCS#11 driver.

See `these <http://tkxuyen.com/blog/?p=293>`__ instructions:

1. Import the certificate and key to the Nitrokey
                                                 

    .. code-block:: bash

        # Warning: This will delete existing keys on your Nitrokey!
        $ pkcs15-init --delete-objects privkey,pubkey --id 3 --store-private-key user@example.com.p12 --format pkcs12 --auth-id 3 --verify-pin

2. Create the file ~/.ecryptfsrc.pkcs11:
                                        

    .. code-block:: bash

        $ editor ~/.ecryptfsrc.pkcs11

3. Enter this content:
                      

    .. code-block:: bash

        $ pkcs11-log-level=5 pkcs11-provider1,name=name,library=/usr/lib/opensc-pkcs11.so,cert-private=true
        $ openvpn --show-pkcs11-ids path to opensc-pkcs11 module
        Certificate
            DN: /description=Iv4IQpLO02Mnix9i/CN=user@example.com/emailAddress=user@example.com
            Serial: 066E04
            Serialized id: ZeitControl/PKCS\x2315\x20emulated/000500000c7f/OpenPGP\x20card\x20\x28User\x20PIN\x29/03

4. Copy the serialized id for later usage:
                                          

    .. code-block:: bash

        $ ecryptfs-manager
        # This will show list option. Choose option "Add public key to keyring" 
        # Choose pkcs11-helper
        # Enter the serialized ID of step 3 to PKCS#11 ID.

Alternatively, try `ESOSI <https://sourceforge.net/projects/esosi/>`__ or follow these steps using OpenSC and OpenVPN.

Source of the guide: https://www.nitrokey.com/documentation/applications#a:hard-disk-encryption
