NitroPad X230 with Qubes OS
===========================

With the NitroPad X230, malicious changes to the BIOS, operating system,
and software can be easily detected. For example, if you left your
NitroPad in a hotel room, you can use your Nitrokey to check if it has
been tampered with while you were away. If an attacker modifies the
NitroPad’s firmware or operating system, the Nitrokey will detect this
(instructions below).

Verification of Sealed Hardware
-------------------------------

If you have ordered the unit with the option “sealed screws and sealed
bag”, please `verify the sealing <verify-sealed-hardware>`__ before
unpacking. If you do not know what this means, skip this section.

Secure Starting Procedure
-------------------------

With the NitroPad X230, malicious changes to the BIOS, operating system,
and software can be easily detected. For example, if you left your
NitroPad in a hotel room, you can use your Nitrokey to check if it has
been tampered with while you were away. If an attacker modifies the
NitroPad’s firmware or operating system, the Nitrokey will detect this
(instructions below).

Each time you start the NitroPad, you should - if possible - connect
your Nitrokey. If the Nitrokey is plugged in and the system has not been
modified, the following screen will appear when the NitroPad is turned
on.

|image1|

The box marked in red contains the information that the BIOS has not
been changed and that the shared secret of the NitroPad and the Nitrokey
match. But this information is not sufficient, because an attacker could
have faked it. If at the same time the Nitrokey also flashes green,
everything is fine. An attacker would have to have had access to the
NitroPad and Nitrokey to achieve this result. It is therefore important
that you do not leave both devices unattended.

If the information on the NitroPad does not match the information on the
Nitrokey, the background would turn red and the message “Invalid Code”
would appear. This could indicate that manipulation has taken place.

|image2|

How the boot process may look like if the system has been changed (for
example after an update) and what error messages may otherwise occur is
described further below.

.. tip::

   The NitroPad X230 can also be started without the Nitrokey. If you
   don’t have the Nitrokey with you, but are sure that the hardware has
   not been manipulated, you can boot your system without checking.

Getting Started
---------------

After purchase, the passwords are set to a default value and must be
changed by you:

1. Press Enter (“Default Boot”) after booting the system, provided the
   NitroPad has not shown any errors and the Nitrokey is lit green (see
   above).
2. Next, the system will prompt you to enter the passphrase to decrypt
   the hard disk. The passphrase is initially “PleaseChangeMe”. |image3|
3. The system will then guide you through the process of creating a user
   account. After that you should have successfully booted the system
   and could already use it normally.
4. Open the pre-installed Nitrokey App and change the PINs of your
   Nitrokey as described here.
5. Change the passphrase for the hard disk encryption by running “sudo
   cryptsetup luksChangeKey /dev/sda2” in a terminal.

In case the Network Manager icon is not shown and when starting a VM an
error like “Domain sys-net has failed to start: PCI device dom0:03_00.0
does not exist” is shown, proceed as follows:

1. Open menu -> Service: sys-net -> sys-net: Qube Settings
2. Go to Devices tab
3. Remove “Unknown device” from the right side
4. Add “Network controler” device
5. Click “OK” and restart the system.

Behavior After a System Update
------------------------------

The NitroPad firmware checks certain system files for changes. If your
operating system has updated important components, you will be warned
the next time you boot the NitroPad. This could look like this, for
example:

|image4|

That’s why it’s important to restart your NitroPad under controlled
conditions after a system update. Only when the new status has been
confirmed can you leave the device unattended again. Otherwise, you will
not be able to distinguish a possible attack from a system update.
Detailed instructions for a system update can be `found
here <https://docs.nitrokey.com/x230/qubes/system-update.html>`__.

Troubleshooting
---------------

If Qubes doesn’t boot as shown below, please execute the following
steps:

::

   +++ Found verified kexec boot params 
   gpg: verify signatures failed: Unknown system error 
   Invalid signature on kexec boot params 
   !!!!! Failed default boot 
   New value of PCR[4]: XXXXXXXXXXXXXXXXXXXXXXXXXXXXX 
   !!!!!Starting recovery shell 
   /boot # 

1. Restart your Laptop and go to Options. |image5|

2. Select “Update Checksums and sign all files on /boot”. |image6|

3. After that, please follow `these instructions from step 3
   onwards <system-update>`__.

.. |image1| image:: ../images/NitroPad-boot-process_0.jpeg
.. |image2| image:: ../images/NitroPad-boot-process-bad.jpeg
.. |image3| image:: ./images/QubesDiskPassword.jpg
.. |image4| image:: ../images/NitroPad-error-mismatch.jpeg
.. |image5| image:: ../images/boot-menu.jpg
.. |image6| image:: ../images/options.jpg
