Elliptic Curves (ECC) Support
=============================

.. contents:: :local:

RSA-2048 Becomes Increasingly Insecure
--------------------------------------

For security reasons, the German Federal Office for Information Security (Bundesamt für Sicherheit in der Informationstechnik, BSI) no longer recommends RSA keys with a length of 2048 bit `to be used after
2023 <https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/Publications/TechGuidelines/TG02102/BSI-TR-02102-1.pdf>`__. This means that longer keys will need to come into use in the foreseeable future. Assuming a usage period of five years, is is already necessary to generate longer keys. However, longer RSA keys with 3072 bit or 4096 bit are significantly slower. For this reason the new Nitrokey Storage 2 and Pro 2 (resp. the integrated OpenPGP Card version
3.3) supports encryption by means of `elliptic-curve cryptography (ECC) <https://en.wikipedia.org/wiki/Elliptic-curve_cryptography>`__. This method is considered to be just as secure with smaller ECC keys as longer RSA keys and is also considerably faster.

Basics of Elliptic-Curve Cryptography
-------------------------------------

In contrast to RSA, there are many different forms (so-called curves) of elliptic-curve cryptography. Notably, the `NSA was involved <https://www.schneier.com/essays/archives/2007/11/did_nsa_put_a_secret.html>`__ in the development of the NIST curves. Even if there is no evidence of back doors in the curves, using a certain curve can pose a question of trust. Fortunately the new Nitrokey Storage 2 and Pro 2 support two kind of curves, namely NIST and Brainpool. In what follows we will use Brainpool curves. `This article <https://arstechnica.com/information-technology/2013/10/a-relatively-easy-to-understand-primer-on-elliptic-curve-cryptography/>`__ provides a good entry point for gaining a general understanding of elliptic-curve cryptography.

System Requirements
-------------------

In order to create keys based on elliptic curves a Nitrokey Storage 2 /
Pro 2 and GnuPG version 2.1.17 or higher are required.

You can read Nitrokey’s OpenPGP Card version via ``gpg2 --card-status``:

.. code-block:: bash

   > gpg2 --card-status
   Reader ...........: 20A0:...
   Application ID ...: D276...
   Version ..........: 3.3
   ...

The ‘Version’ field represents the version of the OpenPGP Card integrated in the Nitrokey — in this case it is 3.3 as needed for Elliptic-curve cryptography. OpenPGP Card version 2.2 doesn’t support ECC.

You can learn about the installed version of GnuPG via ``gpg2  --version``. At least version 2.1.16 is required. The newest GnuPG version for Windows can be found `here <https://www.gpg4win.org/>`__ and the newest version for MacOS can be found `here <https://gpgtools.org/>`__. A suitable version of GnuPG is included in the GNU/Linux distributions Ubuntu (since 18.04), Debian (from Stretch onwards), Arch Linux, Fedora (from Release 26 onwards) and openSUSE Tumbleweed. At the end of this articles are instructions how to manually update GnuPG on older Ubuntu versions.

.. important::

   GnuPG 2.0 is still being used, but support for it has been
   discontinuied in 2017. All communication partners must use GnuPG 2.1
   or newer for email encryption by means of ECC, otherwise
   incompatibility issues might arise. Therefore you should only use ECC
   if you are sure you will be able to circumvent this problem.

Key Generation on the Nitrokey Storage 2 / Pro 2
------------------------------------------------

Once these requirements are fulfilled, you can get started. (Warning: existing keys will be overwritten in the process!) You now have two options. The first option is to create the key directly on the Nitrokey Storage 2 / Pro 2. The benefit here is that the key will never be outside the device and as such can never be read out. The second option is to import a previously locally generated key. The advantage in this case is that you can securely store a backup of the key, which can then be restored in case the Nitrokey is lost. Only the first option is described below. In order to create a key with backup, you can access `the following instructions <https://www.gniibe.org/memo/software/gpg/keygen-25519.html>`__ and use this `general information <https://wiki.fsfe.org/TechDocs/CardHowtos/CardWithSubkeysUsingBackups>`__ to transfer the key to the Nitrokey.

Within GnuPG there is already a “generate” command, which can be used to easily create keys on the device. However it is not as yet possible to select the type of key directly, so the key must first be prepared. We use the following commands for this:

.. code-block:: bash

   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 1 19 brainpoolP256r1" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 2 18 brainpoolP256r1" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 3 19 brainpoolP256r1" /bye

Alternatively, other curves could be selected, as described in the next section.

Now we enter ``gpg2 --card-edit`` and see that brainpoolP256r1 is under
“key attributes” instead of rsa2048.

.. code-block:: bash

   > gpg2 --card-edit
   Reader ...........: 20A0:4109:0000000000000:0
   Application ID ...: D276000124010303000500005F100000
   Version ..........: 3.3
   Manufacturer .....: ZeitControl
   Serial number ....: 00005F10
   Name of cardholder: [not set]
   Language prefs ...: [not set]
   Sex ..............: unspecified
   URL of public key : [not set]
   Login data .......: [not set]
   Signature PIN ....: forced
   Key attributes ...: brainpoolP256r1 brainpoolP256r1 brainpoolP256r1
   Max. PIN lengths .: 64 64 64
   PIN retry counter : 3 0 3
   Signature counter : 0
   Signature key ....: [none]
   Encryption key....: [none]
   Authentication key: [none]
   General key info..: [none]

Then we create the key.

.. code-block:: bash

   gpg/card> admin
   Admin commands are allowed
    
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

The Nitrokey now incorporates elliptic-curve cryptography instead of RSA keys and can be used as usual.

Available Curves
----------------

In the above procedure we chose the Brainpool curves. Alternatively, NIST curves can be used. The configuration is carried out as follows:

.. code-block:: bash

   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 1 19 nistp256" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 2 18 nistp256" /bye
   > gpg-connect-agent "SCD SETATTR KEY-ATTR --force 3 19 nistp256" /bye

Update of GnuPG on Ubuntu
-------------------------

The following steps are needed only if you are running a Ubuntu version older than 18.04. You can install GnuPG 2.1.18 on such system with the commands below. This involves newer Debian packages, which is the easiest option. This approach has been tested successfully on Ubuntu
17.10 and propbably works on 16.04 as well. However, the occurence of problems during usage can‘t be excluded.

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
     # (removes manually installed packages)
   $ sudo apt-get install gnupg dirmngr gnupg-agent scdaemon
     # (installs the appropriate packages from regular package repositories)
