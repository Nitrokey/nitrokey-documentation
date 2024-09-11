OpenPGP Key Generation On-Device
================================

.. contents:: :local:

The following instructions explain the generation of OpenPGP keys directly on the Nitrokey. This is done by using the command line interface of GnuPG. Thus, you need to have GnuPG installed on your system. The newest GnuPG version for Windows can be found `here <https://www.gpg4win.org/>`__ and the newest version for MacOS can be found `here <https://gpgtools.org/>`__. Users of Linux systems please install GnuPG with help of the package manager.

.. note::

   These instructions are based on GnuPG version 2.2.6 or higher. Some
   Linux Distributions have an older version installed. In this case
   please choose a different method as listed
   `here <openpgp.html>`_
   or install a newer version if possible.

Key Generation
--------------

The following descriptions explain the basic key generation on-device via GnuPG’s command line interface. The default behaviour is to generate RSA keys of 2048 bit size. If you want to change the key algorithm and length, have a look at the next section first.

Open a command line and type ``gpg2 --card-edit``.

To open the Windows command line please push the Windows-key and R-key. Now type ‘cmd.exe’ in the text field and hit enter. To open a Terminal on macOS or GNU/Linux please use the application search (e.g. spotlight on macOS).

.. code-block:: bash

   > gpg2 --card-edit

   Reader ...........: 20A0:4108:0000320E0000000000000000:0
   Application ID ...: D27600012401020100050000320E0000
   Version ..........: 2.1
   Manufacturer .....: ZeitControl
   Serial number ....: 0000320E
   Name of cardholder: [not set]
   Language prefs ...: de
   Sex ..............: unspecified
   URL of public key : [not set]
   Login data .......: [not set]
   Signature PIN ....: forced
   Key attributes ...: rsa2048 rsa2048 rsa2048
   Max. PIN lengths .: 32 32 32
   PIN retry counter : 3 0 3
   Signature counter : 0
   Signature key ....: [none]
   Encryption key....: [none]
   Authentication key: [none]
   General key info..: [none]
    
   gpg/card>

Now you are in the interactive interface of GnuPG. Activate the admin commands with ``admin`` and use ``generate`` afterwards to start the generation of keys.

.. code-block:: bash

   gpg/card> admin                                                                                          
   Admin commands are allowed                                                                               
    
   gpg/card> generate                                                                                       
   Make off-card backup of encryption key? (Y/n) n                                                          
    
   Please note that the factory settings of the PINs are                                                    
      PIN = '123456'     Admin PIN = '12345678'                                                             
   You should change them using the command --change-pin                                                    
    
   Please specify how long the key should be valid.                                                         
            0 = key does not expire                                                                         
         <n>  = key expires in n days                                                                       
         <n>w = key expires in n weeks                                                                      
         <n>m = key expires in n months                                                                     
         <n>y = key expires in n years                                                                      
   Key is valid for? (0)                                                                                    
   Key does not expire at all                                                                               
   Is this correct? (y/N) y                                                                                 
    
   GnuPG needs to construct a user ID to identify your key.                                                 
    
   Real name: Jane Doe                                                                                      
   Email address: jane@example.com                                                                              
   Comment:                                                                                                 
   You selected this USER-ID:                                                                               
   "Jane Doe <jane@doecom>"                                                                            
    
   Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O                                                    
   gpg: key 817E149CA002B92F marked as ultimately trusted                                                   
   gpg: revocation certificate stored as '/home/nitrokey//.gnupg/openpgp-revocs.d/E62F445E8BB4B5085C031F5381
   7E149CA002B92F.rev'                                                                                      
   public and secret key created and signed.                                                                
    
    
   gpg/card>
   </jane@doe.com></n></n></n></n>

**Please do not create the suggested off-card backup.** This “backup”
does only save the encryption key, but not the signature and authentication keys. In case of a loss of the device, you will not be able to restore the whole key set. So on the one hand it is no full backup (use `these instructions <openpgp-keygen-backup.html>`_ instead, if you need one) and on the other hand you risk that someone else can get in possession of your encryption key. The advantage of generating keys on-device is to make sure that keys are stored securely. Therefore, we recommend to skip this half-backup.

Now you have a complete key set on your device which can be used for the `various applications <https://www.nitrokey.com/documentation/applications>`__ listed on our site. Type ``quit`` and hit enter to exit.

Change Key Attributes
---------------------

This section is about changing the key attributes. If you want to use the default values, you can proceed with the next section.

Open a command line and type ``gpg2 --card-edit --expert``.

.. code-block:: bash

   > gpg2 --card-edit --expert

   Reader ...........: 20A0:4108:0000320E0000000000000000:0
   Application ID ...: D27600012401020100050000320E0000
   Version ..........: 2.1
   Manufacturer .....: ZeitControl
   Serial number ....: 0000320E
   Name of cardholder: [not set]
   Language prefs ...: de
   Sex ..............: unspecified
   URL of public key : [not set]
   Login data .......: [not set]
   Signature PIN ....: forced
   Key attributes ...: rsa2048 rsa2048 rsa2048
   Max. PIN lengths .: 32 32 32
   PIN retry counter : 3 0 3
   Signature counter : 0
   Signature key ....: [none]
   Encryption key....: [none]
   Authentication key: [none]
   General key info..: [none]

Now you are in the interactive interface of GnuPG. As you can see in the
“Key attributes” field above, the default value rsa2048 is set. To change them, activate the admin commands with ``admin`` and use ``key-attr`` afterwards to change the attributes of the keys.

.. code-block:: bash

   gpg/card> admin
   Admin commands are allowed
    
   gpg/card> key-attr
   Changing card key attribute for: Signature key
   Please select what kind of key you want:
   &nbsp;&nbsp; (1) RSA
   &nbsp;&nbsp; (2) ECC
   Your selection? 1
   What keysize do you want? (2048) 4096
   The card will now be re-configured to generate a key of 4096 bits
   Changing card key attribute for: Encryption key
   Please select what kind of key you want:
   &nbsp;&nbsp; (1) RSA
   &nbsp;&nbsp; (2) ECC
   Your selection? 1
   What keysize do you want? (2048) 4096
   The card will now be re-configured to generate a key of 4096 bits
   Changing card key attribute for: Authentication key
   Please select what kind of key you want:
   &nbsp;&nbsp; (1) RSA
   &nbsp;&nbsp; (2) ECC
   Your selection? 1
   What keysize do you want? (2048) 4096
   The card will now be re-configured to generate a key of 4096 bits

You can choose the attribute for each key (that is, signature, encryption and authentication key). Most people will use the same attributes for every key. Type ``list`` to see the results (have look at the “Key attributes” field, which now reads rsa4096).

.. code-block:: bash

   gpg/card> list
    
   Reader ...........: 20A0:4108:0000320E0000000000000000:0
   Application ID ...: D27600012401020100050000320E0000
   Version ..........: 2.1
   Manufacturer .....: ZeitControl
   Serial number ....: 0000320E
   Name of cardholder: [not set]
   Language prefs ...: de
   Sex ..............: unspecified
   URL of public key : [not set]
   Login data .......: [not set]
   Signature PIN ....: forced
   Key attributes ...: rsa4096 rsa4096 rsa4096
   Max. PIN lengths .: 32 32 32
   PIN retry counter : 3 0 3
   Signature counter : 0
   Signature key ....: [none]
   Encryption key....: [none]
   Authentication key: [none]
   General key info..: [none]

Type ``quit`` and hit enter to exit or proceed directly with the previous section to actually generate the keys with the key attributes you just set.

The following table illustrates which algorithm can be used on which device.

================ ===== ============= =================
\                Start Pro + Storage Pro 2 + Storage 2
================ ===== ============= =================
rsa1024          ✓     ✓             
rsa2048          ✓     ✓             ✓
rsa3072                ✓             ✓
rsa4096                ✓             ✓
curve25519 (ECC) ✓                   
NIST (ECC)       ✓                   ✓
Brainpool (ECC)                      ✓
secp256k1        ✓                   
================ ===== ============= =================

Exporting Public Key and Keyserver Usage
----------------------------------------

Although you can start to use your Nitrokey right away after generating the keys on your system, you need to import your public key on every system, you want to use the Nitrokey on. So to be prepared you have two options: You either save the public key anywhere you like and use it on another system or you save the public key on a webpage/keyserver.

Generating a Public Key File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get a simple file of your public key, you can just use ``gpg2 --armor --export keyID > pubkey.asc``. Use either the fingerprint as “keyID” (look at ``gpg -K`` to get it) or just use your email address as an identifier.

You can carry this file with you or send it to anyone who you like. This file is not secret at all. If you want to use the Nitrokey on another system, you first import this public key via ``gpg2 --import pubkey.asc`` and then types ``gpg2 --card-status`` so that the system knows where to look for this key. That’s all.

Uploading the Public Key
~~~~~~~~~~~~~~~~~~~~~~~~

If you do not want to carry a public keyfile with you, you can upload it to keyserver. You can do this by typing ``gpg --keyserver search.keyserver.net --send-key keyID``. If you are using another machine you can just import it by using ``gpg --keyserver search.keyserver.net --recv-key keyID``.

Another possibility is to change the URL setting on your card. Start gpg
–card-edit again and first set the URL where the key is situated (e.g. on the keyserver or on your webpage etc.) via the ``url`` command. From now on you can import the key on another system by just using the ``fetch`` command within the ``gpg --card-edit`` environment.
