Using Additional Decryption Subkeys (ADSK) with GnuPG
=====================================================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

`Additional Decryption Subkeys (ADSK) <https://gnupg.org/blog/20230321-adsk.html>`__ can be used to automatically add recipients when encrypting a message with GnuPG.
Typical use cases include

- having a single encryption key for a group without the need to share the private key between the members of the group,
- adding a backup key to an encryption key, and
- setting up a master key that can decrypt messages for other keys.

.. note::

   To configure an ADSK, you need GnuPG 2.4.1 or newer.
   To encrypt a message for a key with an ADSK, you need GnuPG 2.2.42 or newer.

Overview
--------

This guide explains how to add a backup key (user ID ``backup@example.com``) as an ADSK to a main key (user ID ``main@example.com``).
Both keys are stored on a Nitrokey.
The same steps can be used to add multiple ADSK to a key, or to add the same key as an ADSK to multiple other keys.

Preparing the Keys
------------------

Follow one of these guides to generate the two keys:

- :doc:`openpgp-keygen-backup`
- :doc:`openpgp-keygen-on-device`
- :doc:`openpgp-keygen-gpa`

Make sure that you can list both keys with ``gpg --list-keys``, for example::

   $ gpg --list-keys main@example.com backup@example.com
   pub   ed25519 2023-07-04 [SC]
         55BC284C1D30D97638DA4A2C7963A4CD00C947CE
   uid           [ultimate] Main Key <main@example.com>
   sub   ed25519 2023-07-04 [A]
   sub   cv25519 2023-07-04 [E]
   
   pub   ed25519 2023-07-04 [SC]
         5271152B531F7FFD8787818251FB75800E281241
   uid           [ultimate] Backup Key <backup@example.com>
   sub   ed25519 2023-07-04 [A]
   sub   cv25519 2023-07-04 [E]


Adding an ADSK
--------------

First determine the fingerprint of the encryption subkey for the backup key::

   $ gpg --list-keys --with-subkey-fingerprints backup@example.com
   pub   ed25519 2023-07-04 [SC]
         5271152B531F7FFD8787818251FB75800E281241
   uid           [ultimate] Backup Key <backup@example.com>
   sub   ed25519 2023-07-04 [A]
         7AEA1A0EC7BD66FF03AFEFAC8F243D8EC7678FCC
   sub   cv25519 2023-07-04 [E]
         C1735CB29890EEDEABCF1D0DC9310F81D77519BC

Look for the line starting with ``sub`` that contains the letter ``E``, indicating a subkey with the encryption capability.
The fingerprint of this subkey is listed in the next line.
In this case, the fingerprint is ``C1735CB29890EEDEABCF1D0DC9310F81D77519BC``.

Then determine the fingerprint of the main key::

   $ gpg --list-keys main@example.com
   pub   ed25519 2023-07-04 [SC]
         55BC284C1D30D97638DA4A2C7963A4CD00C947CE
   uid           [ultimate] Main Key <main@example.com>
   sub   ed25519 2023-07-04 [A]
   sub   cv25519 2023-07-04 [E]

You can find it in the next line after ``pub``, in this case ``55BC284C1D30D97638DA4A2C7963A4CD00C947CE``.

Now you can add the ADSK using the ``--quick-add-adsk`` flag::

    $ gpg --quick-add-adsk \
          55BC284C1D30D97638DA4A2C7963A4CD00C947CE \
          C1735CB29890EEDEABCF1D0DC9310F81D77519BC

The first argument is the fingerprint of the main key.
The second argument is the fingerprint of the encryption subkey of the backup key.

You can check that the ADSK has been created::

   $ gpg --list-keys --with-subkey-fingerprints main@example.com
   pub   ed25519 2023-07-04 [SC]
         55BC284C1D30D97638DA4A2C7963A4CD00C947CE
   uid           [ultimate] Main Key <main@example.com>
   sub   ed25519 2023-07-04 [A]
         9DF42A789DA4E848295C529634E35A6897DFABFD
   sub   cv25519 2023-07-04 [E]
         1DFD6EA8D8B88BEA063ADB4BD75708BAF0CD49C8
   sub   cv25519 2023-07-04 [R]
         C1735CB29890EEDEABCF1D0DC9310F81D77519BC

The subkey with the ``R`` (restricted) capability is the ADSK.
It has the same fingerprint as the encryption subkey of the backup key.

Now you can distribute the public key with the ADSK.

Using an ADSK
-------------

When encrypting a message for the main key, the backup key is now automatically added as a recipient.
The only requirements for this are:

* The sender of the message has an up-to-date public key that includes the ADSK.
* The sender of the message uses GnuPG 2.2.42 or newer.

If you add the ``--verbose`` flag, you can check the keys the message is encrypted to::

   $ echo message | gpg --verbose --encrypt --armor --recipient main@example.com > /tmp/msg.asc
   gpg: using pgp trust model
   gpg: using subkey D75708BAF0CD49C8 instead of primary key 7963A4CD00C947CE
   gpg: automatically retrieved 'main@example.com' via Local
   gpg: This key belongs to us
   gpg: reading from '[stdin]'
   gpg: writing to stdout
   gpg: ECDH/AES256 encrypted for: "D75708BAF0CD49C8 Main Key <main@example.com>"
   gpg: ECDH/AES256 encrypted for: "C9310F81D77519BC Main Key <main@example.com>"


You can also use the ``--list-packets`` option to check an encrypted message::

   $ gpg --pinentry-mode cancel --list-packets /tmp/msg.asc | grep "pubkey enc packet"
   :pubkey enc packet: version 3, algo 18, keyid D75708BAF0CD49C8
   :pubkey enc packet: version 3, algo 18, keyid C9310F81D77519BC

Each ``pubkey enc packet`` line represents one key that can decrypt the message.


Revoking an ADSK
----------------

If you revoke an ADSK, it will no longer be added as a recipient when encrypting a message.
To perform a revocation, open the key with ``gpg --edit-key``::

   $ gpg --edit-key main@example.com
   
   sec  ed25519/7963A4CD00C947CE
        created: 2023-07-04  expires: never       usage: SC  
        card-no: FFFE 5E0E868D
        trust: ultimate      validity: ultimate
   ssb  ed25519/34E35A6897DFABFD
        created: 2023-07-04  expires: never       usage: A   
        card-no: FFFE 5E0E868D
   ssb  cv25519/D75708BAF0CD49C8
        created: 2023-07-04  expires: never       usage: E   
        card-no: FFFE 5E0E868D
   ssb  cv25519/C9310F81D77519BC
        created: 2023-07-04  expires: never       usage: R   
   [ultimate] (1). Main Key <main@example.com>


Select the subkey to revoke with ``key N``.
The selected subkey is marked with an asterisk::
   
   gpg> key 2
   
   sec  ed25519/7963A4CD00C947CE
        created: 2023-07-04  expires: never       usage: SC  
        card-no: FFFE 5E0E868D
        trust: ultimate      validity: ultimate
   ssb  ed25519/34E35A6897DFABFD
        created: 2023-07-04  expires: never       usage: A   
        card-no: FFFE 5E0E868D
   ssb  cv25519/D75708BAF0CD49C8
        created: 2023-07-04  expires: never       usage: E   
        card-no: FFFE 5E0E868D
   ssb* cv25519/C9310F81D77519BC
        created: 2023-07-04  expires: never       usage: R   
   [ultimate] (1). Main Key <main@example.com>

Revoke the subkey with ``revkey`` and then save the changes with ``save``::

   gpg> revkey
   Do you really want to revoke this subkey? (y/N) y
   Please select the reason for the revocation:     
     0 = No reason specified
     1 = Key has been compromised
     2 = Key is superseded
     3 = Key is no longer used
     Q = Cancel
   Your decision? 0
   Enter an optional description; end it with an empty line:
   > 
   Reason for revocation: No reason specified
   (No description given)
   Is this okay? (y/N) y

   
   sec  ed25519/7963A4CD00C947CE
        created: 2023-07-04  expires: never       usage: SC  
        card-no: FFFE 5E0E868D
        trust: ultimate      validity: ultimate
   ssb  ed25519/34E35A6897DFABFD
        created: 2023-07-04  expires: never       usage: A   
        card-no: FFFE 5E0E868D
   ssb  cv25519/D75708BAF0CD49C8
        created: 2023-07-04  expires: never       usage: E   
        card-no: FFFE 5E0E868D
   ssb  cv25519/C9310F81D77519BC
        created: 2023-07-04  revoked: 2023-07-04  usage: R   
   [ultimate] (1). Main Key <main@example.com>

   gpg> save

Now distribute the updated public key.

.. note::

   The revocation will only become effective once the sender has updated the public key with the revoked ADSK.
   Messages that have already been encrypted can still be decrypted with the ADSK even if it is revoked.
