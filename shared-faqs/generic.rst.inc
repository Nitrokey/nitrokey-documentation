Generic Nitrokeys FAQ
=====================

**Q:** Which Operating Systems are supported?
   Windows, Linux, and Mac OS X. Also some support (FIDO2) for Android.
   
**Q:** What are the default passwords?
   * **User PIN:** "123456"
   * **Administrator PIN:** "12345678"
   * **Firmware Password** (Nitrokey Storage only): "12345678"
   * **SO-PIN** (Nitrokey HSM only): "3537363231383830"
   
   We strongly recommend to change these PINs/password to user-chosen values
   before using the Nitrokey.

**Q:** What are the default passwords?
  It depends. No one can copy the keys which are stored on the Nitrokey. But
  depending on the key creation process you can still store a backup of the
  keys elsewhere.

  If you want to have a backup of your keys, you need to think about it when
  creating the keys. More information and options for the key creation can be
  found in our :doc:`documentation <../pro/linux/openpgp>`.

**Q:** What can I use the Nitrokey for?
  See the `frontpage`_ for an overview of supported use cases.

**Q:** How large is the storage capacity?
  Nitrokey Pro, Nitrokey Start, Nitrokey HSM and Nitrokey U2F don't contain
  storage capability for ordinary data (it can only store cryptographic keys
  and certificates).

  Nitrokey Storage can store and encrypt 8, 32, or 64 GB of data (depending on
  particular model).

**Q:** What is the maximum length of the PIN?
  Nitrokey uses PINs instead of passwords. The main difference is that the
  hardware limits the amount of tries to three while a limit doesn't exist for
  passwords. Because of this, a short PIN is still secure and there is not need
  to choose a long and complex PIN.

  Nitrokey Pro's and Storage's PINs can be up to 20 digits long and can consist
  of numbers, characters and special characters. Note: When using GnuPG or
  OpenSC, 32 character long PINs can be used but aren't supported by Nitrokey
  App.

**Q:** What is user/admin/firmware PIN/password for?
  **User PIN:** The user PIN is at least 6-digits long and is used to get
  access to the contect of the Nitrokey. This is the PIN you will use a lot in
  every day use e.g. for decrypting messages, for unlocking your encrypted
  storage (NK Storage only) etc.

  The user PIN can have up to 20 digits and other characters (e.g. alphabetic
  and special characters). But as the user PIN is blocked as soon three wrong
  PIN attempts were done, it is sufficiently secure to only have a 6 digits
  PIN. The default PIN is 123456.

  **Admin PIN:** The admin PIN is at least 8-digits long and is used to change
  contents/settings of the Nitrokey. That is to say after initializing the
  Nitrokey you probably won't need this PIN too often (e.g. if you want to add
  another password to the password safe of the Nitrokey Pro or Nitrokey
  Storage).

  The admin PIN can have up to 20 digits and other characters (e.g. alphabetic
  and special characters). But as the admin PIN is blocked as soon three wrong
  PIN attempts were done, it is sufficiently secure to only have 8 digits PIN.
  The default PIN is 12345678.

  **Firmware password:** The firmware password should meet general password
  recommandations (e.g. use alphabetic characters, digits and special
  characters or use a usfficiently long password). The firmware password is
  needed to update the firmware of the Nitrokey Storage. See further
  instructions for update process here.

  The firmware password is never blocked. An attacker could try to guess the
  password and would have unlimited attempts. Therefore you must choose a
  strong password. The default password is 12345678.

  **SO PIN:** The SO PIN is used in the Nitrokey HSM only and is something like a
  "master" PIN with special properties. Please read this instructions carefully
  to understand the SO PIN of the Nitrokey HSM.
   
   
**Q:** How many keys can I store? 
  The Nitrokey Pro,
  Nitrokey Start and Nitrokey Storage can store three RSA key pairs. All keys use
  the same identity but are used for different purposes: authentication,
  encryption and signing.

  Nitrokey HSM can store 20 RSA-2048 and 31 ECC-256 key pairs.

  Nitrokey U2F stores a single ECC key pair but can be used with an unlimited
  amount of user accounts.

**Q:** Which algorithms and maximum key length are supported?
  See the following table:

+-------------------+-------+---------------+-------------------+-----+-------+
|                   | Start | Pro + Storage | Pro 2 + Storage 2 | HSM | HSM2  |
+-------------------+-------+---------------+-------------------+-----+-------+
| rsa1024           | ✓     | ✓             |                   | ✓   | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| rsa2048           | ✓     | ✓             | ✓                 | ✓   | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| rsa3072           |       | ✓             | ✓                 |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| rsa4096           |       | ✓             | ✓                 |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| curve25519        | ✓     |               |                   |     |       |
+-------------------+-------+---------------+-------------------+-----+-------+
| NIST-P 192        |       |               |                   |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| NIST-P 256        | ✓     |               | ✓                 |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| NIST-P 384-521    |       |               | ✓                 |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| Brainpool 192     |       |               |                   | ✓   | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| Brainpool 256-320 |       |               | ✓                 | ✓   | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| Brainpool 384-521 |       |               | ✓                 |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| secp192           |       |               |                   | ✓   | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| secp256           | ✓     |               |                   | ✓   | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+
| secp521           |       |               |                   |     | ✓     |
+-------------------+-------+---------------+-------------------+-----+-------+


   
**Q:** How fast is encryption and signing?
  See the relevant product faq for details: (@todo add links)


**Q:** Do Nitrokeys contain a secure chip or just a normal microcontroller?
  Nitrokey Pro, Nitrokey HSM and Nitrokey Storage contain a tamper resistant
  smart card. To some extent this also applies to Nitrokey U2F but it's of
  lower quality. Nitrokey Start is implemented in the microprocessor.

**Q:** How good is the Random Number Generator (RNG)?
  See the relevant product faq for details: (@todo add links)

**Q:** Is Nitrokey Common Criteria or FIPS certified?
  **Nitrokey Storage 1+2:** `Cure53`_ has performed an `independent
  security audit`_ of the hardware, firmware, and Nitrokey App. 

  The security controler's hardware is Common Criteria certified (`Report`_; See
  `here`_, click "ICs, Smart Cards and Smart Card-Related Devices and Systems" and
  search for "NXP Smart Card Controller P5CD081V1A and its major configurations
  P5CC081V1A, P5CN081V1A, P5CD041V1A, P5CD021V1A and P5CD016V1A each with IC
  dedicated Software").

  **Nitrokey Pro 1+2:** The security controler's hardware is Common Criteria
  certified (`Report`_; See `here`_, click "ICs, Smart Cards and Smart
  Card-Related Devices and Systems" and search for "NXP Smart Card Controller
  P5CD081V1A and its major configurations P5CC081V1A, P5CN081V1A, P5CD041V1A,
  P5CD021V1A and P5CD016V1A each with IC dedicated Software").

  **Nitrokey HSM:** The security controler's hardware and operating system are
  Common Criteria certified (`HSM Report`_; See `here`_, click "ICs, Smart Cards and
  Smart Card-Related Devices and Systems" and search for "NXP J3A080 v2.4.1
  Secure Smart Card Controller (JCOP v2.4.1)").

  **Nitrokey HSM2:** The security controler's hardware and operating system are
  Common Criteria certified (`Security Target`_; `HSM2 Report`_; See `here`_,
  click "ICs, Smart Cards and Smart Card-Related Devices and Systems" and
  search for "NXP JCOP 3 P60").


.. _frontpage: https://nitrokey.com/
.. _Cure53: https://cure53.de
.. _independent security audit: https://www.nitrokey.com/news/2015/nitrokey-storage-got-great-results-3rd-party-security-audit
.. _Report: https://www.commoncriteriaportal.org/files/epfiles/0555a_pdf.pdf
.. _here: https://www.commoncriteriaportal.org/products/
.. _HSM Report: https://www.commoncriteriaportal.org/files/epfiles/0515a.pdf
.. _HSM2 Report: https://www.commoncriteriaportal.org/files/epfiles/[CR]%20NSCIB-CC-98209-CR3.pdf
.. _Security Target: https://www.commoncriteriaportal.org/files/epfiles/[ST-Lite]%20ST-Lite_JCOP3_P60_v3.8.pdf
