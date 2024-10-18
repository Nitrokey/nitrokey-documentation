OpenPGP smartcard with GnuPG on Fedora
======================================

.. include:: index.rst
	:start-after: products-begin
	:end-before: products-end

.. note::
   The following instructions require the Nitrokey 3 to have at least firmware version ``1.4.0`` installed.
   Please refer to `firmware update <./firmware-update.html>`__ to learn how to update it.

The GnuPG smartcard support requires *scdaemon*.
In Fedora the *scdaemon* is part of the GnuPG package.

.. note::
   The *scdaemon* is installed in ``/usr/libexec/scdaemon``.
   This path is usually not part of the PATH environment variable.

The GnuPG project supports two setups of interfacing with a OpenPGP smartcard.

1. **GnuPG (scdaemon with CCID driver) → Smartcard (e.g. Nitrokey)**

   In this setup the *scdaemon* communicates directly to the Nitrokey with its internal CCID driver and *libusb*.
   It requires the Udev rules to be set, because the *scdaemon* runs in userspace with the permissions of the logged in user.
   
2. **GnuPG (scdaemon with PCSC library) → pcscd → Smartcard (e.g. Nitrokey)**

   In this setup the *scdaemon* communicates with *pcscd*, which then communicates with the Nitrokey.

On Fedora only the second setup is supported, because the configuration of the GnuPG package sets the CCID driver as disabled and the pcsc support as required.
The relevant configuration can be found in the spec file `here <https://src.fedoraproject.org/rpms/gnupg2/blob/rawhide/f/gnupg2.spec#_140>`__ and `here <https://src.fedoraproject.org/rpms/gnupg2/blob/rawhide/f/gnupg2.spec#_51>`__.

Troubleshooting
---------------

The latest Fedora 38 version should work after installation without issues.
Upgraded versions of Fedora might have conflicting configuration and should be checked as below.
Fedora Silverblue was reported to have issues with GnuPG and smartcards.
The instructions below only apply to *Fedora Workstation* and *Fedora Server* editions.

The correct configuration of a setup can be checked by querying information about the Nitrokey with ``gpg --card-status``.

Check recognition
^^^^^^^^^^^^^^^^^

Verify with the `lsusb` command that the Nitrokey is recognized.
The output should list the Nitrokey, e.g. `Bus 001 Device 002: ID 20a0:42b2 Clay Logic Nitrokey 3`.

Check system configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Make sure the *pcscd* package is installed with ``dnf install pcsc-lite``.
   Further the *systemd* service and socket must be enabled and started with ``systemctl enable pcscd.socket pcscd.service && systemctl start pcscd.socket``.

2. The *scdaemon* requires the *libpcsclite* library to connect to *pcscd*.
   The path to the pcsc library can be set explicitly with ``echo "pcsc-driver /usr/lib64/libpcsclite.so.1" >> ~/.gnupg/scdaemon.conf``.
   Alternatively, the library can also be made available with a symlink as follows ``ln -s /usr/lib64/libpcsclite.so.1 /usr/lib64/libpcsclite.so``.
   Make sure the ``~/.gnupg/scdaemon.conf`` file has no conflicting settings applied.

3. The *scdaemon* by default expects exclusive access to *pcscd*, to avoid potential issues with concurrent modifications of information on the card.
   This causes access to fail if other clients, usually web browsers, accessed the card, even if only for reading.
   Shared access can be enabled with ``echo "pcsc-shared" >> ~/.gnupg/scdaemon.conf`` (in GnuPG version 2.2.28 or higher).
