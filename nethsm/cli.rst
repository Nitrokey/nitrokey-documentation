Accessing a NetHSM with the nitropy command line tool
=====================================================

.. contents:: :local:

This tutorial demonstrates how to access the NetHMS via `nitropy <https://github.com/Nitrokey/pynitrokey>`__ command line tool, which you need to download and install.

.. include:: _tutorial.rst
   :start-after: .. start:: setup
   :end-before: .. end

.. note::

   If you use a NetHSM demo instance with a self-signed certificate, for
   example using the Docker image, you will have to use the ``--no-verify-tls``
   option for ``nitropy`` to skip the certificate check.

.. include:: _tutorial.rst
   :start-after: .. start:: info
   :end-before: .. end

::

    $ nitropy nethsm --host $NETHSM_HOST info
    Host:    localhost:8443
    Vendor:  Nitrokey GmbH
    Product: NetHSM

.. include:: _tutorial.rst
   :start-after: .. start:: state
   :end-before: .. end

::

    $ nitropy nethsm --host $NETHSM_HOST state
    NetHSM localhost:8443 is Unprovisioned

.. include:: _tutorial.rst
   :start-after: .. start:: provision
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST provision \
       --admin-passphrase adminPassphrase --unlock-passphrase unlockPassphrase
   NetHSM localhost:8443 provisioned

.. include:: _tutorial.rst
   :start-after: .. start:: boot-mode
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       get-config --unattended-boot
    Configuration for NetHSM localhost:8443:
        Unattended boot: off

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-on
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       set-unattended-boot on
   Updated the unattended boot configuration for NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: unattended-boot-off
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       set-unattended-boot on
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

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       add-user --user-id operator --real-name "Jane User" --role operator \
       --passphrase opPassphrase
   User operator added to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: key-management
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: generate-key
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       generate-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 \
       --mechanism RSA_Decryption_PKCS1 --length 2048 --key-id myFirstKey
   Key myFirstKey generated on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: import-key
   :end-before: .. end

::
   
   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       add-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 \
       --mechanism RSA_Decryption_PKCS1 --key-id mySecondKey --public-exponent AQAB \
       --prime-p "AOnWFZ+JrI/xOXJU04uYCZOiPVUWd6CSbVseEYrYQYxc7dVroePshz29tc+VEOUP5T0O8lXMEkjFAwjW6C9QTAsPyl6jwyOQluMRIkdN4/7BAg3HAMuGd7VmkGyYrnZWW54sLWp1JD6XJG33kF+9OSar9ETPoVyBgK5punfiUFEL" \
       --prime-q "ANT1kWDdP9hZoFKT49dwdM/S+3ZDnxQa7kZk9p+JKU5RaU9e8pS2GOJljHwkES1FH6CUGeIaUi81tRKe2XZhe/163sEyMcxkaaRbBbTc1v6ZDKILFKKt4eX7LAQfhL/iFlgi6pcyUM8QDrm1QeFgGz11ChM0JuQw1WwkX06lg8iv"
   Key mySecondKey added to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: list-keys
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase \
       list-keys
   Keys on NetHSM localhost:8443:

   Key ID          Algorithm       Mechanisms                                      Operations
   ----------      ---------       ----------------------------------------------  ----------
   myFirstKey      RSA             RSA_Decryption_PKCS1, RSA_Signature_PSS_SHA256  0         
   mySecondKey     RSA             RSA_Decryption_PKCS1, RSA_Signature_PSS_SHA256  0

.. include:: _tutorial.rst
   :start-after: .. start:: get-key
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase \
       get-key myFirstKey
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

    $ nitropy nethsm --host $NETHSM_HOST --username operator --password opPassphrase \
        get-key myFirstKey --public-key > public.pem

.. include:: _tutorial.rst
   :start-after: .. start:: inspect-key
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: key-operations
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: decrypt
   :end-before: .. end

::

    $ nitropy nethsm -h $NETHSM_HOST -u operator -p opPassphrase \
        decrypt -k myFirstKey -d "$(cat data.crypt)" -m PKCS1 | \
        base64 -d
    NetHSM rulez!

.. include:: _tutorial.rst
   :start-after: .. start:: sign
   :end-before: .. end

::

    $ nitropy nethsm -h $NETHSM_HOST -u operator -p opPassphrase \
        sign -k myFirstKey -m PSS_SHA256 -d "$(cat data.digest)" | \
        base64 -d > data.sig

.. include:: _tutorial.rst
   :start-after: .. start:: sign-verify
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: backup-passphrase
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST -u admin -p adminPassphrase \
       set-backup-passphrase --passphrase backupencryptionkey
   Updated the backup passphrase for NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: backup-user
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST -u admin -p adminPassphrase \
       add-user --user-id backup --real-name "Backup User" --role backup \
       --passphrase backupPassphrase
   User backup added to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: backup_
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST -u backup -p backupPassphrase \
       backup /tmp/nethsm-backup
   Backup for localhost:8443 written to /tmp/backup

.. include:: _tutorial.rst
   :start-after: .. start:: restore
   :end-before: .. end

::

   $ nitropy nethsm -h $NETHSM_HOST \
       restore --backup-passphrase backupencryptionkey /tmp/nethsm-backup
   Backup restored on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: update
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       update /tmp/nethsm-update.img.cpio
   Image /tmp/nethsm-update.img.cpio uploaded to NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: commit-update
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       commit-update
   Update successfully committed on NetHSM localhost:8443

.. include:: _tutorial.rst
   :start-after: .. start:: cancel-update
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       cancel-update
   Update successfully cancelled on NetHSM localhost:8443
