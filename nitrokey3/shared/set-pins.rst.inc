.. start-header

Set PINs
========

The Nitrokey 3 has distinct PINs for each feature.

- FIDO2
- Password and OTP secrets
- OpenPGP Card (User PIN, Admin PIN, and optional Reset Code)
- PIV

.. end-header

.. start-passwords-otp-secrets

Passwords and OTP secrets
-------------------------

The PIN for passwords and OTP secrets can be set with the `Nitropy <../../software/nitropy/index.html>`__ utility.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``nitropy nk3 secrets set-pin`` and follow the instructions.

.. end-passwords-otp-secrets

.. start-openpgp-card

OpenPGP Card
------------

The PINs on the OpenPGP Card can be set with GnuPG.
The OpenPGP Card has the *User PIN*, *Admin PIN*, and an optional *Reset Code*.

User PIN
^^^^^^^^

The *User PIN* is used for key operations, such as signing, encrypting, and authentication.
The factory default for the *User PIN* is ``123456``.

.. note::
    The *User PIN* must have a minimal length of 6 characters and maximal length of 127 characters.
    It can contain alphanumeric characters, including special characters such as punctations.

.. warning::
    The *User PIN* has a PIN retry counter of 3 attempts.
    If this attempts are used up, the *User PIN* must be unlocked with the *Admin PIN*.
    Alternatively the optional *Reset Code* can be used for unlocking.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``gpg --card-edit``.
3. In the promt enter ``passwd``.
4. GnuPG will now ask for the current *User PIN*, and the new *User PIN*.
   Please note that if you provision a new Nitrokey the factory default PIN from above must be entered as the current *User PIN*.

Admin PIN
^^^^^^^^^

The Admin PIN is used for management operations, such as copying and generating keys, unblocking the PIN, and setting the *Admin PIN* and Reset Code.
The factory default for the *Admin PIN* is ``12345678``.

.. note::
    The *Admin PIN* must have a minimal length of 8 characters and maximal length of 127 characters.
    It can contain alphanumeric characters, including special characters such as punctations.

.. warning::
    The *Admin PIN* has a PIN retry counter of 3 attempts.
    If this attempts are used up, the OpenPGP Card can not be used anymore and must be reset to factory defaults.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``gpg --card-edit``.
3. In the prompt enter ``admin``, followed by ``passwd``.
4. In the prompt enter ``3``, to set the *Admin PIN*.
5. GnuPG will now ask for the current *Admin PIN*, and the new *Admin PIN*.
   Please note that if you provision a new Nitrokey the factory default PIN from above must be entered as the current *Admin PIN*.

Reset Code
^^^^^^^^^^

The *Reset Code* is used to unblock the *User PIN*.
It is useful in situations when the user of the Nitrokey should be able to unblock the *User PIN*, but not be able to manage it with the *Admin PIN*.

.. note::
    The Reset Code has no factory default. It must be explicitly set using the Admin PIN.

.. note::
    The *Reset Code* must have a minimal length of 6 characters and maximal length of 127 characters.
    It can contain alphanumeric characters, including special characters such as punctations.

.. note::
    Once the *Reset Code* is set it can not be disabled anymore. Disabling would require a reset of the OpenPGP Card application.

.. warning::
    The *Reset Code* has a PIN retry counter of 3 attempts.
    If this attempts are used up, the *Reset Code* must be unlocked with the *Admin PIN*.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``gpg --card-edit``.
3. In the prompt enter ``admin``, followed by ``passwd``.
4. In the prompt enter ``4``, to set the *Reset Code*.
5. GnuPG will now ask for the *Admin PIN*, and the *Reset Code*.

.. end-openpgp-card

.. start-piv-card

PIV
---

The *PIN* and *PUK* for PIV (Personal Identity Verification) Card can be set with `pivy-tool <hhttps://github.com/arekinath/pivy>`__.

PIN
^^^

The *PIN* is used for key operations, such as signing and authentication.

.. note::
    The *PIN* must have maximal length of 8 characters.
    It can contain alphanumeric characters, including special characters such as punctations.

.. warning::
    The *PIN* has a PIN retry counter of 3 attempts.
    If this attempts are used up, the *PIN* must be unlocked with the *PUK*.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``pivy-tool change-pin``.

PUK
^^^

The *PUK* is used for management operations, such as unblocking the PIN.

.. note::
    The *PUK* must have a maximal length of 8 characters.
    It can contain alphanumeric characters, including special characters such as punctations.

.. warning::
    The *PUK* has a retry counter of 3 attempts.
    If this attempts are used up, the PIV Card can not be used anymore and must be reset to factory defaults.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``pivy-tool change-puk``.

.. end-piv-card