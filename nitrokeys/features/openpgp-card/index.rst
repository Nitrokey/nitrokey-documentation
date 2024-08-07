OpenPGP Email Encryption
========================

There are two widely used standards for email encryption.

-  OpenPGP/GnuPG is popular among individuals,

-  S/MIME/X.509 is mostly used by enterprises.

If you are in doubt which one to choose, you should use OpenPGP. While this page describes the usage of OpenPGP, S/MIME is described `here <smime/index.html>`_.

Please familiarize yourself with the general concept behind the OpenPGP standard first, for example by reading `this info graphic <https://emailselfdefense.fsf.org/en/infographic.html>`__ of the Free Software Foundation.

Key Generation
--------------

If you do not have OpenPGP keys yet, you need to generate them first.

-  `Generate keys on
   your Nitrokey device <openpgp-keygen-gpa.html>`_
   - this is the best option if you are unexperienced, but you won’t
   have a backup of your keys and therefore won’t be able to mitigate
   the loss of the Nitrokey

-  `Generate keys on your Nitrokey device with different algorithm or key
   size <openpgp-keygen-on-device.html>`_
   - this is as secure as the previous option and thus you won’t have a
   backup as well, but you can change the key attributes (that is the
   algorithm and key size)

-  `Generate keys
   locally <openpgp-keygen-backup.html>`_
   and copy them to your Nitrokey device - this is the most flexible, expert option,
   but only secure if your system is not compromised, because you can
   create a backup key outside your Nitrokey A similar description in
   french can be found
   `here <https://xieme-art.org/post/importer-des-clefs-gnupg-dans-sa-nitrokey-pro/>`__.

Importing Existing Keys
-----------------------

If you already have OpenPGP keys you may want to use them with your Nitrokey, instead of generating new ones. Importing existing keys works basically the same as generating keys locally first and copying them to the Nitrokey (see above). Therefore, please have a look at the `corresponding instructions <openpgp-keygen-backup.html#key-import>`_. Note that you probably want to generate another subkey for authentication to your existing key. See at the same instructions for `subkey generation <openpgp-keygen-backup.html#subkey-for-authentication>`_.

Usage
-----

You can find further information about the usage on these pages:


-  to use `OpenPGP encryption with
   Thunderbird <openpgp-thunderbird.html>`_

-  to use `OpenPGP encryption with
   Outlook <openpgp-outlook.html>`_

-  to use `OpenPGP Touch Confirmation (Nitrokey 3 only) <uif.html>`_

-  to use `OpenVPN <openvpn/index.html>`_

-  to use `Claws
   Mail <https://www.claws-mail.org/plugin.php?plugin=gpg>`__, an email
   client (and news reader) for Linux and Windows

-  to use
   `Evolution <https://help.gnome.org/users/evolution/stable/mail-encryption.html.en>`__,
   an email client for the Gnome Desktop on Linux systems

-  to use `GPGTools <https://gpgtools.org/>`__ on macOS.

-  to use `Desktop Login <desktop-login/index.html>`_

-  to use `IPSec <ipsec/index.html>`_

-  to use `Hard Disk Encryption <hard-disk-encryption/index.html>`_

-  to use `Stunnel <stunnel/index.html>`_

-  to use `Gnu Privacy Assistant (GPA) <gpa/index.html>`_

-  to use `EID <eid/index.html>`_

-  to use `Certificate-authority <certificate-authority/index.html>`_

-  to use `GnuPG with Fedora <fedora-gnupg-configuration.html>`_