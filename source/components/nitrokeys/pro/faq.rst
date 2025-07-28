Nitrokey Pro 2 FAQ
==================

.. faq:: Which Operating Systems are supported?

   Windows, Linux and macOS.

.. faq:: What can I use the Nitrokey for?

   See the `overview <https://www.nitrokey.com/products/nitrokeys>`__ of supported use cases.

.. faq:: What are the default PINs?

   * User PIN: ``123456``
   * Administrator PIN: ``12345678``
   
   We strongly recommend to change these PINs/password to user-chosen values
   before using the Nitrokey.

.. faq:: What is the maximum length of the PIN?

   Nitrokey uses PINs instead of passwords. The main difference is that the
   hardware limits the amount of tries to three while a limit doesn't exist for
   passwords. Because of this, a short PIN is still secure and there is not need
   to choose a long and complex PIN.

   Nitrokey Storage's PINs can be up to 20 digits long and can consist
   of numbers, characters and special characters. Note: When using GnuPG or
   OpenSC, 32 character long PINs can be used but aren't supported by Nitrokey
   App.

.. faq:: What is the User PIN for?

   The user PIN is at least 6-digits long and is used to get
   access to the contect of the Nitrokey. This is the PIN you will use a lot in
   every day use e.g. for decrypting messages, for unlocking your encrypted
   storage (NK Storage only) etc.
  
   The user PIN can have up to 20 digits and other characters (e.g. alphabetic
   and special characters). But as the user PIN is blocked as soon three wrong
   PIN attempts were done, it is sufficiently secure to only have a 6 digits
   PIN. The default PIN is ``123456``.

.. faq:: What is the Admin PIN for?

   The admin PIN is at least 8-digits long and is used to change
   contents/settings of the Nitrokey. That is to say after initializing the
   Nitrokey you probably won't need this PIN too often (e.g. if you want to add
   another password to the password safe of the Nitrokey Pro or Nitrokey
   Storage).
  
   The admin PIN can have up to 20 digits and other characters (e.g. alphabetic
   and special characters). But as the admin PIN is blocked as soon three wrong
   PIN attempts were done, it is sufficiently secure to only have 8 digits PIN.
   The default PIN is ``12345678``.

.. faq:: Why does my Nitrokey Pro hang when switching between nitrokey-app and GnuPG?

   GnuPG and nitrokey-app sometimes tend to hand each other. This is a known problem
   and it can be fixed by re-inserting the Nitrokey into the USB slot.

.. faq:: Which drivers/tools can be used?

   GnuPG is required for many use cases. It is a command line tool but usually
   you don't need to invoke it directly but use another application with user
   interface.

   Don't use GnuPG in parallel with OpenSC or another PKCS#11 driver because both may interfere and unexpected issues may result.

   Install GPG4Win which contains Gnu Privacy Assistant (GPA) and GnuPG (GPG).
   Start Gnu Privacy Assistant (GPA) or another application such as your email client to use GnuPG.
   Advanced users could use GnuPG directly (command line). Please note: The
   Fellowship smart card is similar to the Nitrokey Pro so that this
   instructions work Nitrokey as well. In general the official documentation
   is recommended.

.. faq:: How fast is encryption and signing?

   Encryption of 50kiB of data:
  
   * 256 bit AES, 2048 bytes per command -> 880 bytes per second
   * 128 bit AES, 2048 bytes per command -> 893 bytes per second
   * 256 bit AES, 240 bytes per command -> 910 bytes per second
   * 128 bit AES, 240 bytes per command -> 930 bytes per second

.. faq:: Which algorithms and maximum key length are supported?

   See the following table:

   +-------------------+-----+-------+
   |                   | Pro | Pro 2 |
   +-------------------+-----+-------+
   | RSA 1024          | ✓   |       |
   +-------------------+-----+-------+
   | RSA 2048          | ✓   | ✓     |
   +-------------------+-----+-------+
   | RSA 3072          | ✓   | ✓     |
   +-------------------+-----+-------+
   | RSA 4096          | ✓   | ✓     |
   +-------------------+-----+-------+
   | Curve25519        |     |       |
   +-------------------+-----+-------+
   | NIST-P 192        |     |       |
   +-------------------+-----+-------+
   | NIST-P 256        |     | ✓     |
   +-------------------+-----+-------+
   | NIST-P 384-521    |     | ✓     |
   +-------------------+-----+-------+
   | Brainpool 192     |     |       |
   +-------------------+-----+-------+
   | Brainpool 256-320 |     | ✓     |
   +-------------------+-----+-------+
   | Brainpool 384-521 |     | ✓     |
   +-------------------+-----+-------+
   | secp192k1         |     |       |
   +-------------------+-----+-------+
   | secp256k1         |     |       |
   +-------------------+-----+-------+
   | secp521k1         |     |       |
   +-------------------+-----+-------+


.. faq:: Does the Nitrokey Pro contain a secure chip or just a normal microcontroller?

   Nitrokey Pro contains a tamper resistant smart card.

.. faq:: Is the Nitrokey Pro Common Criteria or FIPS certified?

   The security controller (NXP Smart Card Controller P5CD081V1A and its major
   configurations P5CC081V1A, P5CN081V1A, P5CD041V1A, P5CD021V1A and P5CD016V1A
   each with IC dedicated Software) is Common Criteria EAL 5+ certified up to the OS level.

   * `Certification Report <https://commoncriteriaportal.org/files/epfiles/0555a_pdf.pdf>`__
   * `Security Target <https://commoncriteriaportal.org/files/epfiles/0555b_pdf.pdf>`__
   * `Maintenance Report <https://commoncriteriaportal.org/files/epfiles/0555_ma1a_pdf.pdf>`__
   * `Maintenance ST <https://commoncriteriaportal.org/files/epfiles/0555_ma1b_pdf.pdf>`__

.. faq:: How can I use the True Random Number Generator (TRNG) of the Nitrokey Pro for my applications?

   Both devices are compatible to the OpenPGP Card, so that `scdrand`_ should work. `This script`_ may be useful.
   The user comio `created a systemd file`_ to use scdrand and thus the TRNG more generally. He created an `ebuild for Gentoo`_, too.

.. faq:: How good is the Random Number Generator?

   Nitrokey Pro and Nitrokey Storage use a True Random Number Generator (TRNG)
   for generating keys on the device. The entropy generated by the TRNG is used
   for the entire key length. Therefore the TRNG is compliant to `BSI TR-03116`_.

   The TRNG provides about 40 kbit/s.

.. faq:: How large is the storage capacity?

   The Nitrokey Pro doesn't contain storage capability for ordinary data (it can
   only store cryptographic keys and certificates).

.. faq:: How many keys can I store? 

   The Nitrokey Pro can store three RSA key pairs. All keys use the same
   identity but are used for different purposes: authentication, encryption and
   signing.

.. _scdrand: http://www.incenp.org/dvlpt/scdrand.html
.. _This script: https://lists.gnupg.org/pipermail/gnupg-users/2017-June/058456.html
.. _created a systemd file: https://support.nitrokey.com/t/scdrand-systemd-service-and-gentoo-ebuild/1164
.. _ebuild for Gentoo: https://github.com/comio/comio-overlay/tree/master/app-crypt/scdtools
.. _BSI TR-03116: https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/Technische-Richtlinien/TR-nach-Thema-sortiert/tr03116/TR-03116_node.html

