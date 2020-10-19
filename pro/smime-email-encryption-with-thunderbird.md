# S/MIME Email Encryption with Thunderbird

## Prerequisites

If you do not have a S/MIME key-certificate pair installed on your Nitrokey yet or if you did not installed OpenSC, please look at [this page](https://docs.nitrokey.com/pro/smime-email-encryption.html) first.

You need to have OpenSC installed on your System. Please have a look at the [wiki page of the OpenSC project](https://github.com/OpenSC/OpenSC/wiki). While GNU/Linux users usually can install OpenSC over the package manager (e.g. sudo apt update && sudo apt install opensc on Ubuntu), macOS and Windows users can download the installation files from the wiki page.


::: tip Note
Windows users with 64-bit system (standard) need to install both, the 32-bit and the 64-bit version of OpenSC!
:::

## Settings in Thunderbird

Before you can use the Nitrokey in Thunderbird you have to activate S/MIME encryption in the account settings. You can achieve this by clicking on the menu and go to 'Preferences' -> 'Account Settings' and clicking on 'Security' in the account settings window.

![img1](./images/smime-email-encryption-with-thunderbird/1.png)

Click on "Security Devices" to import the right PCKS11 module. Click on "Load" on the right-hand side. Now give the Module a name (like "OpenSC Module") and click on "Browse" to choose the location of the Module (see below).

![img2](./images/smime-email-encryption-with-thunderbird/2.png)

On Windows the right file lays under "C:\Windows\System32\opensc-pkcs11.dll".
On macOS and GNU/Linux the file should be in "/lib/pkcs11/opensc-pkcs11.so" or "/usr/lib/pkcs11/opensc-pkcs11.so" or alike. Press "OK" twice and you are back in security section of the account settings. Now you can actually choose a certificate on the upper part of the window. You should get asked for a PIN to unlock your Nitrokey. Please type in your User PIN.

![img3](./images/smime-email-encryption-with-thunderbird/3.png)

## Usage

When composing an email you can now choose to encrypt and sign the message.

![img4](./images/smime-email-encryption-with-thunderbird/4.png)