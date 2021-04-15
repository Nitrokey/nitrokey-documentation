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
   :start-after: .. start:: roles
   :end-before: .. end

.. include:: _tutorial.rst
   :start-after: .. start:: add-user
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       add-user --user-id operator --real-name "Jane User" --role operator \
       --passphrase opPassphrase
   User operator added to NetHSM nethsmdemo.nitrokey.com

.. include:: _tutorial.rst
   :start-after: .. start:: generate-key
   :end-before: .. end

::

   $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
       generate-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 \
       --mechanism RSA_Decryption_PKCS1 --length 2048 --key-id myFirstKey
   Key myFirstKey generated on NetHSM localhost:8443

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
   :start-after: .. start:: decrypt
   :end-before: .. end

::

    $ nitropy nethsm --host $NETHSM_HOST --username admin --password adminPassphrase \
        generate-key -a RSA -m RSA_Decryption_PKCS1 -l 2048 -k testkey
    $ curl -u operator:opPassphrase -X GET \
        https://$NETHSM_HOST/api/v1/keys/testkey3/public.pem -o _public.pem
    $ echo 'NetHSM rulez!' | openssl rsautl -encrypt -inkey _public.pem -pubin \
        -out _data.crypt
    $ base64 _data.crypt > _data.crypt.base64
    $ nitropy nethsm -h $NETHSM_HOST -u operator -p opPassphrase \
        decrypt -k testkey3 -d "$(cat _data.crypt.base64)" -m PKCS1 > _data.decrypt.base64
    $ base64 -d _data.decrypt.base64
    NetHSM rulez!
