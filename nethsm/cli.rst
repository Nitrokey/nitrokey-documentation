.. highlight:: none

Accessing a NetHSM using the nitropy command line tool
=====================================================

.. contents:: :local:

This tutorial demonstrates how to access the NetHMS via `nitropy <https://github.com/Nitrokey/pynitrokey>`_ command line tool, which you need to download and install.

.. include:: tutorial.rst
   :start-after: .. start:: setup
   :end-before: .. end

.. note::

   If you use a NetHSM demo instance with a self-signed certificate, for
   example using the Docker image, you will have to use the ``--no-verify-tls``
   option for ``nitropy`` to skip the certificate check.
   
.. note::

	 First set the value of $NETHSM_HOST to the IP address or URL of your NetHSM.
	 Our demo server can be reached at https://nethsmdemo.nitrokey.com/
  

Request Host Information
------------------------

.. code:: bash

    $ nitropy nethsm --host $NETHSM_HOST info
    
::
 
    Host:    localhost:8443
    Vendor:  Nitrokey GmbH
    Product: NetHSM
   
Request Device Status
---------------------

.. code:: bash

    $ nitropy nethsm --host $NETHSM_HOST state
    
::
    
    NetHSM localhost:8443 is Unprovisioned

::

Provision
---------

A new NetHSM needs to be provisioned first with passphrases and the current time. The Admin Passphrase is the Administrator’s passphrase, which is the super user of the NetHSM. The Unlock Passphrase is used to encrypt NetHSM’s confidential data store.

.. note::

  The NetHSM demo instance at nethsmdemo.nitrokey.com is already provisioned.

::

   $ nitropy nethsm --host $NETHSM_HOST provision --admin-passphrase adminPassphrase --unlock-passphrase unlockPassphrase
   
::
   
   NetHSM localhost:8443 provisioned

.. include:: _tutorial.rst
   :start-after: .. start:: boot-mode
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase get-config --unattended-boot
    
::
    
    Configuration for NetHSM localhost:8443:
        Unattended boot: off

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-on
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase set-unattended-boot on
   
::
   
   Updated the unattended boot configuration for NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-off
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase set-unattended-boot on

::

   Updated the unattended boot configuration for NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: user-management
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: roles
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: add-user
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase add-user --user-id operator --real-name "Jane User" --role operator --passphrase opPassphrase
   
::
   
   User operator added to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: key-management
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: generate-key
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase generate-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 --mechanism RSA_Decryption_PKCS1 --length 2048 --key-id myFirstKey
   
::

   Key myFirstKey generated on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: import-key
   :end-before: .. end

::
   
   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase add-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 --mechanism RSA_Decryption_PKCS1 --key-id mySecondKey --public-exponent AQAB --prime-p "AOnWFZ+JrI/xOXJU04uYCZOiPVUWd6CSbVseEYrYQYxc7dVroePshz29tc+VEOUP5T0O8lXMEkjFAwjW6C9QTAsPyl6jwyOQluMRIkdN4/7BAg3HAMuGd7VmkGyYrnZWW54sLWp1JD6XJG33kF+9OSar9ETPoVyBgK5punfiUFEL" \
       --prime-q "ANT1kWDdP9hZoFKT49dwdM/S+3ZDnxQa7kZk9p+JKU5RaU9e8pS2GOJljHwkES1FH6CUGeIaUi81tRKe2XZhe/163sEyMcxkaaRbBbTc1v6ZDKILFKKt4eX7LAQfhL/iFlgi6pcyUM8QDrm1QeFgGz11ChM0JuQw1WwkX06lg8iv"
       
::
       
   Key mySecondKey added to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: list-keys
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase list-keys
   
::   
      
   Keys on NetHSM localhost:8443:

   Key ID          Algorithm       Mechanisms                                      Operations
   ----------      ---------       ----------------------------------------------  ----------
   myFirstKey      RSA             RSA_Decryption_PKCS1, RSA_Signature_PSS_SHA256  0         
   mySecondKey     RSA             RSA_Decryption_PKCS1, RSA_Signature_PSS_SHA256  0

.. include:: _tutorial.rst
   :start-after: .. start:: get-key
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase get-key myFirstKey
   
::
   
   Key myFirstKey on NetHSM localhost:8443:
   Algorithm:       RSA
   Mechanisms:      RSA_Signature_PSS_SHA256
   Operations:      0
   Modulus:         xYDMGEK3CO5vK0ge0pJQEJHBPA/5M42F/kyN7BV+03HEH23NLXWyszYn7MWvxG4uebZfz+6n7auOYePb0FADVvxQvdX4VPcNzBOEgMqfpplEzf5RzmMmFDBgAcGMS5XkbyVS3XR+7bqej5L6qZtGmFn4hG22Ziu5ZdQxyyqos8Go1ogFBz+vQ4WzmDOGEU82quQSxiPT3K71KKVSS4zTL6oz9izuHzOqnLhuGnbtAe5AFBXE2fJIuXMzw36d0OyJ+rdmkh65EXXLo7Qt3VyP7JPIW+JIM2iU26v6suwUCbjFfrDURS8xEftKAe1hkBWJpNHLZhUse7dpvmtlmRyhxw==
   Public exponent: AQAB

.. include:: _tutorial.rst
   :start-after: .. start:: get-key-file
   :end-before: .. end

::

  $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase get-key myFirstKey --public-key > public.pem

We can inspect the key with openssl and use it for encryption or signature verification (as described in the next section):

::

	$ openssl rsa -in public.pem -pubin -text
	
::

	RSA Public-Key: (2048 bit)
	Modulus:
		  00:c3:56:f5:09:cc:a9:3e:ca:16:2e:fb:d2:8b:9d:
		  a9:33:5a:87:8f:3f:7a:bb:8a:3d:62:9b:5d:56:84:
		  95:97:bb:97:f0:77:e2:c8:59:f2:b5:c6:b7:f5:b3:
		  76:69:a3:e8:f6:b7:35:f4:3c:52:6d:3c:a0:b6:a1:
		  e4:1a:32:05:1d:51:68:21:7d:fc:53:69:ec:bc:0b:
		  a0:db:63:b2:0e:47:00:03:4d:98:1f:ab:c0:7b:2e:
		  3c:8f:b6:36:ff:f0:db:80:26:f0:a6:af:30:2f:7b:
		  16:fd:5c:db:0f:2c:54:8a:26:2b:db:3d:78:49:4b:
		  7b:d1:60:ea:a7:f0:b4:5e:fc:33:ff:57:f8:83:fd:
		  12:64:8f:29:d1:94:96:9a:15:18:5d:04:ca:1c:29:
		  44:ad:42:31:c5:80:38:4c:eb:3b:b8:7e:17:27:5c:
		  69:a8:88:44:ea:d1:82:64:fe:51:31:47:97:a7:a9:
		  87:c3:13:c9:00:7a:b9:fb:6f:cc:66:4c:07:d7:68:
		  fa:78:68:9a:e7:87:1e:94:c6:27:92:5f:f2:7d:11:
		  44:11:b5:39:35:59:2c:cd:f9:4f:59:e3:56:93:1f:
		  94:20:fd:6b:23:0d:15:e6:4e:bb:84:a8:a5:0d:9f:
		  1c:90:ab:a8:10:04:50:12:c1:80:02:94:85:78:df:
		  d6:b3
	Exponent: 65537 (0x10001)
	writing RSA key
	-----BEGIN PUBLIC KEY-----
	MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw1b1CcypPsoWLvvSi52p
	M1qHjz96u4o9YptdVoSVl7uX8HfiyFnytca39bN2aaPo9rc19DxSbTygtqHkGjIF
	HVFoIX38U2nsvAug22OyDkcAA02YH6vAey48j7Y2//DbgCbwpq8wL3sW/VzbDyxU
	iiYr2z14SUt70WDqp/C0Xvwz/1f4g/0SZI8p0ZSWmhUYXQTKHClErUIxxYA4TOs7
	uH4XJ1xpqIhE6tGCZP5RMUeXp6mHwxPJAHq5+2/MZkwH12j6eGia54celMYnkl/y
	fRFEEbU5NVkszflPWeNWkx+UIP1rIw0V5k67hKilDZ8ckKuoEARQEsGAApSFeN/W
	swIDAQAB
	-----END PUBLIC KEY-----

::

    $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase get-key myFirstKey --public-key > public.pem

::

We can inspect the key with openssl and use it for encryption or signature verification (as described in the next section):

::

	$ openssl rsa -in public.pem -pubin -text
	
::

	RSA Public-Key: (2048 bit)
	Modulus:
		  00:c3:56:f5:09:cc:a9:3e:ca:16:2e:fb:d2:8b:9d:
		  a9:33:5a:87:8f:3f:7a:bb:8a:3d:62:9b:5d:56:84:
		  95:97:bb:97:f0:77:e2:c8:59:f2:b5:c6:b7:f5:b3:
		  76:69:a3:e8:f6:b7:35:f4:3c:52:6d:3c:a0:b6:a1:
		  e4:1a:32:05:1d:51:68:21:7d:fc:53:69:ec:bc:0b:
		  a0:db:63:b2:0e:47:00:03:4d:98:1f:ab:c0:7b:2e:
		  3c:8f:b6:36:ff:f0:db:80:26:f0:a6:af:30:2f:7b:
		  16:fd:5c:db:0f:2c:54:8a:26:2b:db:3d:78:49:4b:
		  7b:d1:60:ea:a7:f0:b4:5e:fc:33:ff:57:f8:83:fd:
		  12:64:8f:29:d1:94:96:9a:15:18:5d:04:ca:1c:29:
		  44:ad:42:31:c5:80:38:4c:eb:3b:b8:7e:17:27:5c:
		  69:a8:88:44:ea:d1:82:64:fe:51:31:47:97:a7:a9:
		  87:c3:13:c9:00:7a:b9:fb:6f:cc:66:4c:07:d7:68:
		  fa:78:68:9a:e7:87:1e:94:c6:27:92:5f:f2:7d:11:
		  44:11:b5:39:35:59:2c:cd:f9:4f:59:e3:56:93:1f:
		  94:20:fd:6b:23:0d:15:e6:4e:bb:84:a8:a5:0d:9f:
		  1c:90:ab:a8:10:04:50:12:c1:80:02:94:85:78:df:
		  d6:b3
	Exponent: 65537 (0x10001)
	writing RSA key
	-----BEGIN PUBLIC KEY-----
	MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw1b1CcypPsoWLvvSi52p
	M1qHjz96u4o9YptdVoSVl7uX8HfiyFnytca39bN2aaPo9rc19DxSbTygtqHkGjIF
	HVFoIX38U2nsvAug22OyDkcAA02YH6vAey48j7Y2//DbgCbwpq8wL3sW/VzbDyxU
	iiYr2z14SUt70WDqp/C0Xvwz/1f4g/0SZI8p0ZSWmhUYXQTKHClErUIxxYA4TOs7
	uH4XJ1xpqIhE6tGCZP5RMUeXp6mHwxPJAHq5+2/MZkwH12j6eGia54celMYnkl/y
	fRFEEbU5NVkszflPWeNWkx+UIP1rIw0V5k67hKilDZ8ckKuoEARQEsGAApSFeN/W
	swIDAQAB
	-----END PUBLIC KEY-----
	
::

Key Certificates
----------------

It is possible to set and query certificates for the keys stored on a NetHSM instance:

::

    $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase  set-certificate myFirstKey --mime-type application/x-pem-file /tmp/cert.pem
    
::
        
    Updated the certificate for key myFirstKey on NetHSM localhost:8443

::

    $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase get-certificate myFirstKey > /tmp/cert.pem

::

    $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase  delete-certificate myFirstKey
  
::
    
    Deleted certificate for key myFirstKey on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: key-csr
   :end-before: .. end

::
   
   $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase csr --key-id myFirstKey --country DE --state-or-province BE --locality Berlin --organization ACME --organizational-unit IT --common-name example.com --email-address it@example.com


.. include:: _tutorial.rst
   :start-after: .. start:: key-operations
   :end-before: .. end

Decryption
----------

We can encrypt data for the key stored on the NetHSM using openssl. (public.pem is the public key file that we created in the Show Key Details section.)

::

	$ echo 'NetHSM rulez!' | openssl rsautl -encrypt -inkey public.pem -pubin | base64 > data.crypt

::

    $ nitropy nethsm -h $NETHSM_HOST -u operator -p opPassphrase decrypt -k myFirstKey -d "$(cat data.crypt)" -m PKCS1 | base64 -d
 
:: 

    NetHSM rulez!

::

Similarily, we can sign data using the key on the NetHSM. For RSA and ECDSA, we have to calculate a digest first:

::

	$ echo 'NetHSM rulez!' > data

::

	$ openssl dgst -sha256 -binary data | base64 > data.digest#

::

Then we can create a signature from this digest using the NetHSM:

::

    $ nitropy nethsm -h $NETHSM_HOST -u operator -p opPassphrase sign -k myFirstKey -m PSS_SHA256 -d "$(cat data.digest)" | base64 -d > data.sig

::

And then use openssl to verify the signature:

::

	$ openssl dgst -sha256 -verify public.pem -signature data.sig -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 data
    
::

	Verified OK

::

Backups
-------

It is possible to crate a backup of the NetHSM that captures both the configuration and the stored keys. In order to create a backup, you first have to set a backup passphrase that is used to encrypt the backup file:

::

	$ nitropy nethsm -h $NETHSM_HOST -u admin -p adminPassphrase set-backup-passphrase --passphrase backupencryptionkey

::

	Updated the backup passphrase for NetHSM localhost:8443

::

Now you have to create a user with the R-Backup role:

::

	$ nitropy nethsm -h $NETHSM_HOST -u admin -p adminPassphrase add-user --user-id backup --real-name "Backup User" --role backup --passphrase backupPassphrase
		  
::

	User backup added to NetHSM localhost:8443

::

Then can you generate the backup and write it to a file:

::

	$ nitropy nethsm -h $NETHSM_HOST -u backup -p backupPassphrase backup /tmp/nethsm-backup

::
    
	Backup for localhost:8443 written to /tmp/backup

::

This backup file can be restored on an unprovisioned NetHSM instance:

::

	$ nitropy nethsm -h $NETHSM_HOST restore --backup-passphrase backupencryptionkey /tmp/nethsm-backup

::

	Backup restored on NetHSM localhost:8443

::

   $ nitropy nethsm -h $NETHSM_HOST -u admin -p adminPassphrase set-backup-passphrase --passphrase backupencryptionkey
       
::
       
   Updated the backup passphrase for NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: backup-user
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST -u admin -p adminPassphrase add-user --user-id backup --real-name "Backup User" --role backup --passphrase backupPassphrase
       
::
       
   User backup added to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: backup_
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST -u backup -p backupPassphrase backup /tmp/nethsm-backup
       
::
       
   Backup for localhost:8443 written to /tmp/backup

.. include:: _tutorial.rst
   :start-after: .. start:: restore
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST restore --backup-passphrase backupencryptionkey /tmp/nethsm-backup
   
::
   
   Backup restored on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: update
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase update /tmp/nethsm-update.img.cpio
   
::
   
   Image /tmp/nethsm-update.img.cpio uploaded to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: commit-update
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase commit-update
   
::
   
   Update successfully committed on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: cancel-update
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase cancel-update

::
   
   Update successfully cancelled on NetHSM localhost:8443
