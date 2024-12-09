OpenPGP Key Generation With Backup
==================================

.. include:: index.rst
	:start-after: products-begin
	:end-before: products-end

.. contents:: :local:

The following instructions explain the generation of OpenPGP keys and how to copy them to the Nitrokey. This method has the advantage of providing a backup of the keys in case of losing or breaking the Nitrokey. The instructions are based on the command line interface of GnuPG. Thus, you need to have GnuPG installed on your system. The newest GnuPG version for Windows can be found `here <https://www.gpg4win.org/>`__ and the newest version for MacOS can be found `here <https://gpgtools.org/>`__. Users of Linux systems please install GnuPG with help of the package manager.

Key Generation
--------------

At first, you need to generate a key locally. You can decide, which key attributes to use and - most importantly - you can export the key and keep it somewhere save in case you need to restore the key.

Main Key and Encryption Subkey
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We can use the command ``gpg --full-generate-key --expert`` to start a guided key generation with all possible options. You can choose the key type (usually RSA (1) or ECC (9)), the length of the key and other attributes. The following output is just a simple example, you may choose other values.

::

   > gpg --full-generate-key --expert
   gpg (GnuPG) 2.2.10; Copyright (C) 2018 Free Software Foundation, Inc.
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.

   Please select what kind of key you want:
      (1) RSA and RSA (default)
      (2) DSA and Elgamal
      (3) DSA (sign only)
      (4) RSA (sign only)
      (7) DSA (set your own capabilities)
      (8) RSA (set your own capabilities)
      (9) ECC and ECC
     (10) ECC (sign only)
     (11) ECC (set your own capabilities)
     (13) Existing key
   Your selection? 1
   RSA keys may be between 1024 and 4096 bits long.
   What keysize do you want? (2048)
   Requested keysize is 2048 bits
   RSA keys may be between 1024 and 4096 bits long.
   What keysize do you want for the subkey? (2048)
   Requested keysize is 2048 bits
   Please specify how long the key should be valid.
            0 = key does not expire
           = key expires in n days
         w = key expires in n weeks
         m = key expires in n months
         y = key expires in n years
   Key is valid for? (0)
   Key does not expire at all
   Is this correct? (y/N) y
    
   GnuPG needs to construct a user ID to identify your key.
    
   Real name: Jane Doe
   Email address: jane@example.com
   Comment:
   You selected this USER-ID:
       "Jane Doe "
    
   Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
   We need to generate a lot of random bytes. It is a good idea to perform
   some other action (type on the keyboard, move the mouse, utilize the
   disks) during the prime generation; this gives the random number
   generator a better chance to gain enough entropy.
   We need to generate a lot of random bytes. It is a good idea to perform
   some other action (type on the keyboard, move the mouse, utilize the
   disks) during the prime generation; this gives the random number
   generator a better chance to gain enough entropy.
   gpg: key 0EFFB0704391497C marked as ultimately trusted
   gpg: revocation certificate stored as '/home/nitrokey//.gnupg/openpgp-revocs.d/9D12C91F6FC4CD6E10A1727A0EFFB0704391497C.rev'
   public and secret key created and signed.
    
   pub   rsa2048 2018-09-17 [SC]
         9D12C91F6FC4CD6E10A1727A0EFFB0704391497C
   uid                      Jane Doe 
   sub   rsa2048 2018-09-17 [E]

.. note::
     For information regarding the supported algorithms, please refer to the `faq <../faq.html>`_


Subkey for Authentication
-------------------------

You now have a main key with the capability to sign and certify (marked as [SC]) and a subkey for encryption (marked as [E]). It is necessary to have another subkey for use cases in which authentication is needed. This subkey is generated in the next step. Type in ``gpg --edit-key --expert keyID`` to start the process, whereas “keyID”
is either the id of the key or the email address used during key generation.

::

   > gpg --edit-key --expert jane@example.com
   gpg (GnuPG) 2.2.10; Copyright (C) 2018 Free Software Foundation, Inc.
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.
    
   Secret key is available.
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   [ultimate] (1). Jane Doe 
    
   gpg>

Now you are in the interactive mode of GnuPG and you can add a key by simply typing ``addkey``. You need to choose the key you want to use. It is crucial to choose “set your own capabilities”, because we want to have the “authenticate” capability which is not available otherwise. We toggle sign and encrypt by typing ``s`` and ``e`` and we activate authenticate by typing ``a``.

::

   gpg> addkey
   Please select what kind of key you want:
      (3) DSA (sign only)
      (4) RSA (sign only)
      (5) Elgamal (encrypt only)
      (6) RSA (encrypt only)
      (7) DSA (set your own capabilities)
      (8) RSA (set your own capabilities)
     (10) ECC (sign only)
     (11) ECC (set your own capabilities)
     (12) ECC (encrypt only)
     (13) Existing key
   Your selection? 8
    
   Possible actions for a RSA key: Sign Encrypt Authenticate
   Current allowed actions: Sign Encrypt
    
      (S) Toggle the sign capability
      (E) Toggle the encrypt capability
      (A) Toggle the authenticate capability
      (Q) Finished
    
   Your selection? s
    
   Possible actions for a RSA key: Sign Encrypt Authenticate
   Current allowed actions: Encrypt
    
      (S) Toggle the sign capability
      (E) Toggle the encrypt capability
      (A) Toggle the authenticate capability
      (Q) Finished
    
   Your selection? e
    
   Possible actions for a RSA key: Sign Encrypt Authenticate
   Current allowed actions:
    
      (S) Toggle the sign capability
      (E) Toggle the encrypt capability
      (A) Toggle the authenticate capability
      (Q) Finished
    
   Your selection? a
    
   Possible actions for a RSA key: Sign Encrypt Authenticate
   Current allowed actions: Authenticate
    
      (S) Toggle the sign capability
      (E) Toggle the encrypt capability
      (A) Toggle the authenticate capability
      (Q) Finished
    
   Your selection? q

We quit with ``q``. Afterwards we need to answer the same questions as before. Finally, we have a ready-to-go key set which we can import to our device.

::

   RSA keys may be between 1024 and 4096 bits long.
   What keysize do you want? (2048)
   Requested keysize is 2048 bits
   Please specify how long the key should be valid.
            0 = key does not expire
           = key expires in n days
         w = key expires in n weeks
         m = key expires in n months
         y = key expires in n years
   Key is valid for? (0)
   Key does not expire at all
   Is this correct? (y/N) y
   Really create? (y/N) y
   We need to generate a lot of random bytes. It is a good idea to perform
   some other action (type on the keyboard, move the mouse, utilize the
   disks) during the prime generation; this gives the random number
   generator a better chance to gain enough entropy.
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb  rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 
    
   gpg> quit
   Save changes? (y/N) y

Now is good time to backup your key. Please keep this backup very secure. It is best practice to never have this key on a regular computer which has connection to the internet, so that the key never gets compromised. You can create a backup with something like:

.. code-block:: bash

   > gpg --export-secret-keys jane@example.com > sec-key.asc

Key Import
----------

You have a main key and two subkeys which can be imported to your Nitrokey. Before proceeding please make sure that you really have a backup of the key, if you need one. The ``keytocard`` command used in the next steps will **delete** your key from your disk!

We start the process by accessing the interactive interface of GnuPG again with ``gpg --edit-key --expert keyID``, whereas ``keyID`` is either the id of the key or the email address used during key generation.

::

   > gpg --edit-key --expert jane@example.com
   gpg (GnuPG) 2.2.10; Copyright (C) 2018 Free Software Foundation, Inc.
   This is free software: you are free to change and redistribute it.
   There is NO WARRANTY, to the extent permitted by law.
    
   Secret key is available.
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb  rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 
    
   gpg> keytocard
   Really move the primary key? (y/N) y
   Please select where to store the key:
      (1) Signature key
      (3) Authentication key
   Your selection? 1
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb  rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 

We just imported the main key to the card. Now we proceed with the two subkeys. We type ``key 1`` to select the encryption subkey and type in ``keytocard`` again and select the slot to use.

::

   gpg> key 1
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb* rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb  rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 

   gpg> keytocard
   Please select where to store the key:
      (2) Encryption key
   Your selection? 2
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb* rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb  rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 

Now we deselect the first key with ``key 1`` and select the second subkey with ``key 2`` and move it as well with ``keytocard``. Afterwards we quit and save the changes.

::

   gpg> key 1
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb  rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 
    
   gpg> key 2
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb* rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 
    
   gpg> keytocard
   Please select where to store the key:
      (3) Authentication key
   Your selection? 3
    
   sec  rsa2048/0EFFB0704391497C
        created: 2018-09-17  expires: never       usage: SC
        trust: ultimate      validity: ultimate
   ssb  rsa2048/A9A814C210F16700
        created: 2018-09-17  expires: never       usage: E
   ssb* rsa2048/61F186B8B0BBD5D5
        created: 2018-09-17  expires: never       usage: A
   [ultimate] (1). Jane Doe 
    
   gpg> quit
   Save changes? (y/N) y

Your keys are now moved to the Nitrokey and thus secured in hardware. Congratulations!

Exporting Public Key and Keyserver Usage
----------------------------------------

Although you can start to use your Nitrokey right away after generating the keys on your system, you need to import your public key on every system, you want to use the Nitrokey on. So to be prepared you have two options: You either save the public key anywhere you like and use it on another system or you save the public key on a webpage/keyserver.

Generating a Public Key File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get a simple file of your public key, you can just use ``gpg --armor --export keyID > pubkey.asc``. Use either the fingerprint as “keyID” (look at ``gpg -K`` to get it) or just use your email address as an identifier.

You can carry this file with you or send it to anyone who you like. This file is not secret at all. If you want to use the Nitrokey on another system, you first import this public key via ``gpg --import pubkey.asc``
and then types ``gpg --card-status`` so that the system knows where to look for this key. That’s all.

Uploading the Public Key
~~~~~~~~~~~~~~~~~~~~~~~~


If you don't want to carry a public key file, you can upload it to keyserver. For the common SKS federated keyservers, for example, keyserver.ubuntu.com. Type ``gpg --keyserver keyserver.ubuntu.com --send-key keyID``. If you are using another machine, you can just import it by using ``gpg --keyserver keyserver.ubuntu.com --recv-key keyID``.

You can also use openpgp.keys.org. The recommended way is to do this by ``gpg --export your_address@example.net``. If you are using another machine, you can just import it by using ``gpg --auto-key-locate hkps://keys.openpgp.org``.


Another possibility is to change the URL setting on your card. Start ``gpg --card-edit`` again and first set the URL where the key is situated (e.g. on the keyserver or on your webpage etc.) via the ``url``
command. From now on you can import the key on another system by just using the ``fetch`` command within the ``gpg --card-edit environment``.
