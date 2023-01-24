
.. include:: ./product_platform_heading.rst

.. only:: comment

 .. contents:: :local:

VeraCrypt (formerly TrueCrypt)
------------------------------

`VeraCrypt <https://www.veracrypt.fr/en/Home.html>`__ is a free and Open Source disk encryption software for Windows, macOS, and GNU+Linux. It is the successor of TrueCrypt and thus recommended, although the following instructions should apply to TrueCrypt as well.

Follow these steps to use the program with `Nitrokey <https://shop.nitrokey.com/>`__:

1. Install the latest release of
   `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__, or download the
   `PKCS#11 library <https://smartcard-auth.de/download-en.html>`__.
2. Choose the library in VeraCrypt under Settings>Preferences>Security
   Token (location depends on system, e.g. ``/usr/lib/opensc``).
3. Generate a 64 Byte key file via Tools>Keyfile Generator.
4. Now you should be able to import the generated key file via
   Tools>Manage Security Token Keyfiles. You should choose the first
   Slot (``[0] User PIN``). The keyfile is then stored on the Nitrokey
   as ‘Private Data Object 1’ (``PrivDO1``).
5. After this you should wipe the original keyfile on your Computer
   securely!
6. Now you can use VeraCrypt with the Nitrokey: Create a container,
   choose the keyfile on the device as an alternative to a password.

.. warning::

   Security Consideration

   Please note that VeraCrypt doesn’t make use of the full security
   which Nitrokey (and smart cards in general) offer. Instead it stores
   a keyfile on the Nitrokey which theoretically could be stolen by a
   computer virus after the user enters the PIN.

Note: `Aloaha Crypt <https://www.aloaha.com/aloaha-crypt-disk/>`__ is based on TrueCrypt/VeraCrypt but without the described security limitation.
