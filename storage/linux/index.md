# Nitrokey Storage, Linux

1. To access the OpenPGP smart card of the Nitrokey, install the package libccid.
On Debian/Ubuntu based Distributions type in terminal: *sudo apt-get update && sudo apt-get install libccid*

    If your distribution has a rather old version of libccid (<1.4.21) you have to add the device information by yourself (for example if you are using Ubuntu 14.04 or older). In this case please follow these [instructions](https://www.nitrokey.com/documentation/frequently-asked-questions-faq#latest-device-driver-missing-on-older-linux-distribution).

2. Download and start the [Nitrokey App](https://www.nitrokey.com/download).
3. Open the About window from Nitrokey App's menu and check if you have the [latest firmware](https://github.com/Nitrokey/nitrokey-storage-firmware/releases) installed. If it's not the latest, please [update](https://www.nitrokey.com/en/documentation/firmware-update-storage).
4. Use the Nitrokey App to change the default User PIN (default: 123456) and Admin PIN (default: 12345678) to your own choices.

Your Nitrokey is now ready to use. [Checkout](https://www.nitrokey.com/documentation/applications) the various use cases and supported applications.

::: tip Note
For many use cases described, it is necessary to have either 
OpenPGP or S/MIME keys installed on the device (see below).
:::
## Key Creation with OpenPGP or S/MIME
There are two widely used standards for email encryption. While OpenPGP/GnuPG is popular among individuals, S/MIME/x.509 is mostly used by enterprises. If you are in doubt which one to choose, you should use OpenPGP.

- [instructions](https://www.nitrokey.com/documentation/openpgp-email-encryption) for using the OpenPGP standard with the Nitrokey
- [instructions](https://www.nitrokey.com/documentation/smime-email-encryption) for using S/MIME with the Nitrokey

