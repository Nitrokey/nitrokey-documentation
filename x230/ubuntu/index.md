# NitroPad X230 with Ubuntu Linux

## Verification of Sealed Hardware

If you have ordered the unit with the option "sealed screws and sealed bag", please [verify the sealing](verify-sealed-hardware) before unpacking. If you do not know what this means, skip this section.

## Secure Starting Procedure

With the NitroPad X230, malicious changes to the BIOS, operating system, and software can be easily detected. For example, if you left your NitroPad in a hotel room, you can use your Nitrokey to check if it has been tampered with while you were away. If an attacker modifies the NitroPad's firmware or operating system, the Nitrokey will detect this (instructions below).

Each time you start the NitroPad, you should - if possible - connect your Nitrokey. If the Nitrokey is plugged in and the system has not been modified, the following screen will appear when the NitroPad is turned on.

![](../images/NitroPad-boot-process_0.jpeg)

The box marked in red contains the information that the BIOS has not been changed and that the shared secret of the NitroPad and the Nitrokey match. But this information is not sufficient, because an attacker could have faked it. If at the same time the Nitrokey also flashes green, everything is fine. An attacker would have to have had access to the NitroPad and Nitrokey to achieve this result. It is therefore important that you do not leave both devices unattended.

If the information on the NitroPad does not match the information on the Nitrokey, the background would turn red and the message "Invalid Code" would appear. This could indicate that manipulation has taken place.

![](../images/NitroPad-boot-process-bad.jpeg)

How the boot process may look like if the system has been changed (for example after an update) and what error messages may otherwise occur is described further below.

::: tip
The NitroPad X230 can also be started without the Nitrokey. If you don't have the Nitrokey with you, but are sure that the hardware has not been manipulated, you can boot your system without checking.
:::

## Getting Started

After purchase, the passwords are set to a default value and must be changed by you:

1. Press Enter ("Default Boot") after booting the system, provided the NitroPad has not shown any errors and the Nitrokey is lit green (see above).
2. Next, the system will prompt you to enter the passphrase to decrypt the hard disk. The passphrase is initially "PleaseChangeMe".
    ![](./images/UbuntuDiskPassword.png)
3. The system will then guide you through the process of creating a user account. After that you should have successfully booted the system and could already use it normally.
4. Click on the Nitrokey icon on the left side of the screen to open the pre-installed Nitrokey App.
5. Change the PINs of your Nitrokey as [described here](https://www.nitrokey.com/documentation/change-user-and-admin-pin).

6. Change the passphrase for disk encryption as [described here](https://www.nitrokey.com/documentation/changing-passphrase-disk-encryption).

## Behavior After a System Update

The NitroPad firmware checks certain system files for changes. If your operating system has updated important components, you will be warned the next time you boot the NitroPad. This could look like this, for example:

![](../images/NitroPad-error-mismatch.jpeg)

That's why it's important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be [found here](Operating System Update).

## Troubleshooting

If Ubuntu doesn't boot as shown below, please execute the following steps:

```
+++ Found verified kexec boot params 
gpg: verify signatures failed: Unknown system error 
Invalid signature on kexec boot params 
!!!!! Failed default boot 
New value of PCR[4]: XXXXXXXXXXXXXXXXXXXXXXXXXXXXX 
!!!!!Starting recovery shell 
/boot # 
```

1. Restart your Laptop and go to Options.
   ![](../images/boot-menu.jpg)

2. Select "Update Checksums and sign all files on /boot".
   ![](../images/options.jpg)

3. After that, please follow [these instructions from step 3 onwards](operating-system-update).

## Invalid Code

Each boot the code is generated on the Nitropad and the Nitrokey, if its connected. It is allowed to run 10 boots without loosing the synchronization between the devices, after which the bad code signal is shown, regardless of the rest of the system being in a correct state. 
If you are sure the system was not beign tampered with (e.g. the Nitropad was booted more than 10 times without the Nitrokey), you can safely reset the system's warning.

Please connect the Nitrokey and execute the following from the main boot screen:

1. Options 
2. TPM/TOTP/HOTP Options 
3. Generate new TOTP/HOTP secret

and follow the on-screen guide. After that the secret and counter should be both reset to a new value.
