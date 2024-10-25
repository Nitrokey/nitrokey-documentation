Troubleshooting
===============

Here you will find a collection of common issues.


Nitrokey is Not Detected on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the Nitrokey is not detected, proceed as follows:

1. Copy this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__
   to ``/etc/udev/rules.d/``.
2. Restart udev via ``sudo service udev restart`` or ``udevadm control --reload-rules && udevadm trigger`` if you are using Fedora.

 

Google and Microsoft Services
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently there seems to be a bug we hope to fix soon which affects the Nitrokey 3 working with some Google and Microsoft Services per FIDO2.

Timeout Bug
^^^^^^^^^^^

There is a bug with the Nitrokey being recognized by the system, where a timeout occurs before the connection succeeds. 

NFC is Not Working
^^^^^^^^^^^^^^^^^^
Please make sure FIDO2 is working correctly. Otherwise NFC won't work either.

Also check if you are using the right spot on your smartphone. 
Find the right spot using: `nfc.fail`_. 

The backside of the Nitrokey has to be held against the smartphone. For the USB-A version it might be helpful to lift the side with the USB connector slightly to reduce the distance to the end part of the stick. 

If you have a phone cover, try to find the right spot first without it. Retry afterwards with the cover.

The search of the optimal spot sometimes took up to 20-30 sec. In our experience holding the Nitrokey in an horizontal orientation yields better results.If you still encounter issues please write a mail to our support. For optimal help please include the shipping/order number and your smartphone model. 

OpenPGP Troubleshooting
^^^^^^^^^^^^^^^^^^^^^^^

GnuPG: OpenPGP Card Not Available
---------------------------------

**Problem:**
GnuPG cannot access the Nitrokey 3 and shows an error message like this::

    $ gpg --card-status 
    gpg: selecting openpgp failed: No such device
    gpg: OpenPGP card not available: No such device

**Solution:**
There are two common smartcard services on Linux systems: ``scdaemon``, GnuPG’s smartcard daemon, and ``pcscd``, a generic smartcard daemon.
``scdaemon`` has two drivers for accessing smartcards:
Its integrated ``ccid`` driver tries to directly access the smartcard.
The ``pcsc`` drivers uses the ``pcscd`` daemon instead.

A smartcard can only be accessed directly by one daemon.
This means that depending on the startup order, ``pcscd`` might lock the card before ``scdaemon`` tries to access it using the internal ``ccid`` driver.
Therefore we recommend to use the ``pcscd`` driver for ``scdaemon``.
You can activate it by adding ``disable-ccid`` to the ``~/.gnupg/scdaemon.conf`` config file and restarting ``scdaemon``, for example with ``gpg-connect-agent "SCD KILLSCD" /bye``.
If this does not fix the problem, see the next section for more information.

Alternatively, you can deactivate or uninstall ``pcscd`` to avoid this conflict.

pcscd: Card Not Found
---------------------

**Problem:**
An application using ``pcscd`` does not show the Nitrokey 3.

**Solution:**
First, make sure that ``scdaemon`` is not running (see the previous section)::

    $ gpg-connect-agent "SCD KILLSCD" /bye

Now list the smartcards recognized by ``pcscd`` with ``pcsc_scan -r``.
You should see an entry like this one::

    $ pcsc_scan -r
    Using reader plug'n play mechanism
    Scanning present readers..
    0: Nitrokey 3 [CCID/ICCD Interface] 00 00

If the Nitrokey 3 shows up, it is recognized correctly by ``pcscd`` and there might be an issue with the application that tries to access it.
If it does not show up, make sure that your ``libccid`` version is up to date.
Support for the Nitrokey 3 was added in ``libccid`` 1.5.0.

Updating The Device Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you cannot update ``libccid`` to a supported version, you have to manually update the device database.
The path of the database depends on your distribution:

- Arch, Debian, Ubuntu: ``/etc/libccid_Info.plist``

Make sure to backup the file before overwriting it.
You can download an `updated device database file <https://github.com/Nitrokey/nitrokey-3-firmware/blob/main/Info.plist>`__ from the ``nitrokey-3-firmware`` repository.
After updating the file, restart ``pcscd`` and run ``pcsc_scan -r`` again.
The Nitrokey 3 should now show up.

Update Via update.nitrokey.com Does Not Work
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently the web updater doesn't support the Nitrokey 3. However you can get the latest firmware using these `instructions <firmware-update.html>`_. 


.. _nfc.fail: https://nfc.fail/


Piv Troubleshooting
^^^^^^^^^^^^^^^^^^^

Pyscard is not available
------------------------

If pyscard is not available to nitropy, you might get the following error trying to use the PIV functionality:

    This command requires the pyscard library that is not available on your system. Please consult https://docs.nitrokey.com/nitrokey3/linux/troubleshooting#pyscard-is-not-available for more information

To fix this error, please install nitropy with the `pcsc` extra dependencies:

    pip install pynitrokey[pcsc]
    pipx install pynitrokey[pcsc]

If you install pynitrokey through another distrubition channel, please install all optional dependencies for this channel.
