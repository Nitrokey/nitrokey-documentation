# OpenPGP Email Encryption

There are two widely used standards for email encryption.

- OpenPGP/GnuPG is popular among individuals,
- S/MIME/X.509 is mostly used by enterprises.

If you are in doubt which one to choose, you should use OpenPGP. While this page describes the usage of OpenPGP, S/MIME is described [here](https://docs.nitrokey.com/pro/smime-email-encryption.html).

Please familiarize yourself with the general concept behind the OpenPGP standard first, for example by reading [this info graphic](https://emailselfdefense.fsf.org/en/infographic.html) of the Free Software Foundation.

## Key Generation

If you do not have OpenPGP keys yet, you need to generate them first.

- [Generate keys on Nitrokey](https://docs.nitrokey.com/pro/openpgp-key-generation-using-gpa.html) - this is the best option if you are unexperienced, but you won't have a backup of your keys and therefore won't be able to mitigate the loss of the Nitrokey
- [Generate keys on Nitrokey with different algorithm or key size](https://docs.nitrokey.com/pro/openpgp-key-generation-on-device.html) - this is as secure as the previous option and thus you won't have a  backup as well, but you can change the key attributes (that is the  algorithm and key size)
- [Generate keys locally](https://docs.nitrokey.com/pro/openpgp-key-generation-with-backup.html) and copy them to Nitrokey - this is the most flexible, expert option,  but only secure if your system is not compromised, because you can  create a backup key outside your Nitrokey
   A similar description in french can be found [here](https://xieme-art.org/post/importer-des-clefs-gnupg-dans-sa-nitrokey-pro/).

## Importing Existing Keys

If you already have OpenPGP keys you may want to use them with your  Nitrokey, instead of generating new ones. Importing exsiting keys works  basically the same as generating keys locally first and copy them to the Nitrokey (see above). Therefore, please have a look at the [corresponding instructions](https://docs.nitrokey.com/pro/openpgp-key-generation-with-backup.html#key-import). Note that you probably want to generate another subkey for  authentication to your existing key. See at the same instructions for [subkey generation](https://docs.nitrokey.com/pro/openpgp-key-generation-with-backup.html#subkey-for-authentication).

## Usage

You can find further information about the usage on these pages:

- for using [OpenPGP encryption with Thunderbird](https://docs.nitrokey.com/pro/openpgp-email-encryption-with-thunderbird.html)
- for using [OpenPGP encryption with Outlook](https://docs.nitrokey.com/pro/windows/openpgp-email-encryption-with-outlook.html)
- for using [Claws Mail](https://www.claws-mail.org/plugin.php?plugin=gpg), an email client (and news reader) for Linux and Windows
- for using [Evolution](https://help.gnome.org/users/evolution/stable/mail-encryption.html.en), an email client for the Gnome Desktop on Linux systems
- for using [GPGTools](https://gpgtools.org/) on macOS.