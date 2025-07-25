Nitrokey Start FAQ
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

.. faq:: Which algorithms and maximum key length are supported?

   See the following table:

   +-------------------+-------+
   |                   | Start |
   +-------------------+-------+
   | RSA 1024          | ✓     |
   +-------------------+-------+
   | RSA 2048          | ✓     |
   +-------------------+-------+
   | RSA 3072          |       |
   +-------------------+-------+
   | RSA 4096          |       |
   +-------------------+-------+
   | Curve25519        | ✓     |
   +-------------------+-------+
   | NIST-P 192        |       |
   +-------------------+-------+
   | NIST-P 256        | ✓     |
   +-------------------+-------+
   | NIST-P 384-521    |       |
   +-------------------+-------+
   | Brainpool 192     |       |
   +-------------------+-------+
   | Brainpool 256-320 |       |
   +-------------------+-------+
   | Brainpool 384-521 |       |
   +-------------------+-------+
   | secp192k1         |       |
   +-------------------+-------+
   | secp256k1         | ✓     |
   +-------------------+-------+
   | secp521k1         |       |
   +-------------------+-------+

.. faq:: Does the Nitrokey Start contain a secure chip or just a normal microcontroller?

   Nitrokey Start is implemented in the microprocessor.

.. faq:: How large is the storage capacity?

   The Nitrokey Start doesn't contain storage capability for ordinary data (it can
   only store cryptographic keys and certificates).

.. faq:: How many keys can I store? 

   The Nitrokey Start can store nine RSA key pairs for three identities. 
   For one identity you need three key pairs for authentication, encryption and signing.

