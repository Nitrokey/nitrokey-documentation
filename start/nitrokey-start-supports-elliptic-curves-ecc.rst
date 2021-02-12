Nitrokey Start Supports Elliptic Curves (ECC)
=============================================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

RSA-2048 Becomes Increasingly Insecure
--------------------------------------

For security reasons, the German Federal Office for Information Security (Bundesamt für Sicherheit in der Informationstechnik or BSI) no longer recommends RSA keys with a length of 2048 `bit be used after
2022 <https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TG02102/BSI-TR-02102-1.pdf;jsessionid=064DAA7AD3195C1C87B1C71B2760DB4E.1_cid360?__blob=publicationFile&v=7>`__. This means that longer keys will need to come into use in the foreseeable future. Assuming a period of use of five years, safer keys should already be being generated. However, longer RSA keys with 3072 bit or 4096 bit are significantly slower. For this reason `Nitrokey Start <https://shop.nitrokey.com/shop/product/nitrokey-start-6>`__ (resp. the underlying firmware `Gnuk <https://www.fsij.org/category/gnuk.html>`__) has been supporting encryption by means of `elliptic-curve cryptography (ECC) <https://en.wikipedia.org/wiki/Elliptic-curve_cryptography>`__ for some time. This method is considered to be just as secure for smaller key systems as longer RSA keys and is also considerably faster.

Basics of Elliptic-Curve Cryptography
-------------------------------------

In contrast to RSA, there are many different forms (so-called curves) of elliptic-curve cryptography. Notably, the `NSA was involved <https://www.schneier.com/essays/archives/2007/11/did_nsa_put_a_secret.html>`__ in the development of the NIST curves. Even if there is no evidence of back doors in the curves, using a certain curve can pose a question of trust. Fortunately the Nitrokey Start supports multiple curves, namely NIST, SECG and Curve25519. In what follows we will use Curve25519 and Ed25519 that is based upon this, both of which have a good reputation and are considered to be secure. `This article <https://arstechnica.com/information-technology/2013/10/a-relatively-easy-to-understand-primer-on-elliptic-curve-cryptography/>`__ provides a good entry point for gaining a general understanding of elliptic-curve cryptography.

System Requirements
-------------------

In order to create keys based on elliptic curves on the Nitrokey Start, firmware 1.2 and GnuPG version 2.1.16 or higher must be installed.

You can read Nitrokey Start’s firmware version via ‘gpg2 —card-status’:

.. code-block:: bash

   > gpg --card-status
   Reader ...........: 20A0:4211:FSIJ-1.2.4-67083322:0
   ...

The digit after ‘FSIJ’ indicates the state of the software — in this case it is 1.2.4. Elliptic-curve cryptography can be used with the Nitrokey Start from version 1.2.x onwards. Should older firmware happen to be installed, you can update it with the help of `these instructions <https://github.com/Nitrokey/nitrokey-start-firmware/blob/gnuk1.2-regnual-fix/prebuilt/README.md#firmware-upgrade-instructions>`__.

You can learn about the installed version of GnuPG via ‘gpg2 –version’. At least version 2.1.16 is required. The newest GnuPG version for Windows can be found `here <https://www.gpg4win.org/>`__ and the newest version for MacOS can be found `here <https://gpgtools.org/>`__. A suitable version of GnuPG is included in the GNU/Linux distributions Debian (from Stretch onwards), Arch Linux, Fedora (from Release 26 onwards) and openSUSE Tumbleweed. Unfortunately only GnuPG 2.1.15 is currently included in the latest release of Ubuntu (17.10) and use is therefore currently not readily possible. At the end of this articles are instructions how to manually update GnuPG on Ubuntu.

Important: GnuPG 2.0 is still being used, but support for it will run out around the end of 2017. All communication partners must use GnuPG
2.1 or newer for email encryption by means of ECC, otherwise incompatibility issues might arise. Therefore you should only use ECC if you are sure you will be able to circumvent this problem.

Key Generation on the Nitrokey Start
------------------------------------

Once these requirements are fulfilled, you can get started. (Warning:
existing keys will be overwritten in the process!) You now have two options. The first option is to create the key directly on the Nitrokey Start. The benefit here is that the key will never be outside the device and as such can never be read out. The second option is to import a previously locally generated key. The advantage in this case is that you can securely store a backup of the key, which can then be restored in case the Nitrokey is lost. Only the first option is described below. In order to create a key with backup, you can access `the following instructions <https://www.gniibe.org/memo/software/gpg/keygen-25519.html>`__ and use this `general information <https://wiki.fsfe.org/TechDocs/CardHowtos/CardWithSubkeysUsingBackups>`__ to transfer the key to the Nitrokey.

Within GnuPG there is already a ‘generate’ command, which can be used to easily create keys on the device. **(Update 20.11.2017: With GnuPG 2.2.2 and higher, during “generate” command you can enter the keysize “25519”
to select Curve25519. In this case you can skip the following lines.)**
However it is not as yet possible to select the type of key directly, so the key must first be prepared. We use the following commands for this:

.. code-block:: bash

   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 1 22 ed25519" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 2 18 cv25519" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 3 22 ed25519" /bye

Alternatively, other curves could be selected, as described in the next section.

Now we enter ‘gpg2 –card-edit’ and see that ed25519 or cv25519 is under ‘key attributes’ instead of rsa2048.

.. code-block:: bash

   > gpg2 --card-edit
   Reader ...........: 20A0:4211:FSIJ-1.2.4-67083322:0
   Application ID ...: D276000124010200FFFE670833220000
   Version ..........: 2.0
   Manufacturer .....: unmanaged S/N range
   Serial number ....: 67083322
   Name of cardholder: [not set]
   Language prefs ...: [not set]
   Sex ..............: unspecified
   URL of public key : [not set]
   Login data .......: [not set]
   Signature PIN ....: forced
   Key attributes ...: ed25519 cv25519 ed25519
   Max. PIN lengths .: 127 127 127
   PIN retry counter : 3 3 3
   Signature counter : 0
   Signature key ....: [none]
   Encryption key....: [none]
   Authentication key: [none]
   General key info..: [none]

Then we create the key.

.. code-block:: bash

   gpg/card> admin

Admin commands are allowed

.. code-block:: bash

   gpg/card> generate
   Make off-card backup of encryption key? (Y/n) n
   Please note that the factory settings of the PINs are
   PIN = '123456' Admin PIN = '12345678'
   You should change them using the command --change-pin
   Please specify how long the key should be valid.
   0 = key does not expire
   <n> = key expires in n days
   <n>w = key expires in n weeks
   <n>m = key expires in n months
   <n>y = key expires in n years
   Key is valid for? (0)
   Key does not expire at all
   Is this correct? (y/N) y
   GnuPG needs to construct a user ID to identify your key.
   Real name: Jane Doe
   Email address: jane.doe@example.org
   Comment:
   You selected this USER-ID:
   "Jane Doe <jane.doe@example.org>"
   Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
   gpg: key 7F8C68E1B084E169 marked as ultimately trusted
   gpg: revocation certificate stored as '/home/jane/.gnupg/openpgp-revocs.d/F8C00BC1636A7D7604A31A877F8C68E1B084E169.rev'
   public and secret key created and signed.

The Nitrokey Start now incorporates elliptic-curve cryptography instead of RSA keys and can be used as usual.

Available Curves
----------------

In the above procedure we chose the curve ed25519 and cv25519 by Daniel Bernstein. Alternatively, NIST or SECG curves can be used. The configuration is carried out as follows:

Option NIST curves:

.. code-block:: bash

   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 1 19 nistp256" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 2 18 nistp256" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 3 19 nistp256" /bye

Option SECG curves: **Warning: This curve is not recommended for email encryption but for Bitcoin-related use cases only!**

.. code-block:: bash

   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 1 19 secp256k1" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 2 18 secp256k1" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 3 19 secp256k1" /bye

Option Curve25519:

.. code-block:: bash

   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 1 22 ed25519" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 2 18 cv25519" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 3 22 ed25519" /bye

Update of GnuPG on Ubuntu
-------------------------

The following steps are needed only if you are running a Ubuntu version older than 18.04! You can install GnuPG 2.1.18 on such system with the commands below. This involves newer Debian packages, which is the easiest option. This approach has been tested successfully on Ubuntu
17.10. However, the occurence of problems during usage can‘t be excluded.

.. code-block:: bash

   $ mkdir gnupg_tmp
   $ cd gnupg_tmp
   $ wget http://ftp.debian.org/debian/pool/main/g/gnupg2/gnupg_2.1.18-8~deb9u1_amd64.deb
   $ wget http://ftp.debian.org/debian/pool/main/g/gnupg2/dirmngr_2.1.18-8~deb9u1_amd64.deb
   $ wget http://ftp.debian.org/debian/pool/main/g/gnupg2/gnupg-agent_2.1.18-8~deb9u1_amd64.deb
   $ wget http://ftp.debian.org/debian/pool/main/g/gnupg2/scdaemon_2.1.18-8~deb9u1_amd64.deb
   $ sudo dpkg -i *
   $ cd ..
   $ rm -rf gnupg_tmp

In case you want to undo the installation, you have to execute the following commands:

.. code-block:: bash

   $ sudo dpkg --remove --force-depends gnupg dirmngr gnupg-agent scdaemon

(removes manually installed packages)

.. code-block:: bash

   $ sudo apt-get install gnupg dirmngr gnupg-agent scdaemon

(installs the appropriate packages from regular package repositories)
