Accessing a NetHSM with the nitropy command line tool
=====================================================

.. contents:: :local:

This tutorial demonstrates how to access the NetHMS via `nitropy <https://github.com/Nitrokey/pynitrokey>`__ command line tool, which you need to download and install.

First, let’s see what we have here:

::

    $ nitropy nethsm --host localhost:8443 info
    Host:    localhost:8443
    Vendor:  Nitrokey GmbH
    Product: NetHSM

.. tip::

   If you use a self-signed certificate for the NetHSM demo instance,
   you have to set the ``--no-verify-tls`` option for `nitropy`, for example::

       $ nitropy nethsm --host localhost:8443 --no-verify-tls info

See what the device’s status is:

::

    $ nitropy nethsm --host localhost:8443 state
    NetHSM localhost:8443 is Unprovisioned

Initialization
--------------

A new NetHSM needs to be provisioned first with passphrases and the
current time. The *Admin Passphrase* is the *Administrator*’s
passphrase, which is the super user of the NetHSM. The *Unlock
Passphrase* is used to encrypt NetHSM’s confidential data store.

::

   $ nitropy nethsm --host localhost:8443 provision \
       --admin-passphrase adminPassphrase --unlock-passphrase unlockPassphrase
   NetHSM localhost:8443 provisioned

NetHSM can be used in *Attended Boot* mode and *Unattended Boot* mode.

-  In *Attended Boot* mode the *Unlock Passphrase* needs to be entered
   during each start which is used to encrypt the data store. For
   security reasons this mode is recommended.
-  In *Unattended Boot* mode no Unlock Passphrase is required, therefore
   the NetHSM can start unattended and the data store is stored
   unencrypted. Use this mode if your availability requirements can’t be
   fulfilled with *Attended Boot* mode.

Retrieve the current mode:

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       get-config --unattended-boot
    Configuration for NetHSM localhost:8443:
        Unattended boot: off

Switch to *Unattended Boot* mode:

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       set-unattended-boot on
   Updated the unattended boot configuration for NetHSM localhost:8443

Or switch back to *Attended Boot* mode:

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       set-unattended-boot on
   Updated the unattended boot configuration for NetHSM localhost:8443

Roles
-----

Separation of duties can be implemented by using the available Roles.
Each user account configured on the NetHSM has one of the following
Roles assigned to it. Following is a high-level description of the
operations allowed by individual Roles, for endpoint-specific details
please refer to the REST API documentation.

-  *R-Administrator* A user account with this Role has access to all
   operations provided by the REST API, with the exception of key usage
   operations, i.e. message signing and decryption.
-  *R-Operator* A user account with this Role has access to all key
   usage op- erations, a read-only subset of key management operations
   and user management operations allowing changes to their own account
   only.
-  *R-Metrics* A user account with this Role has access to read-only
   metrics operations only.
-  *R-Backup* A user account with this Role has access to the operations
   required to initiate a system backup only.

Note: In a future release another Role will be implemented which is allowed to /keys/ POST, /keys/generate POST, /keys/{KeyID} PUT & DELETE, /keys/{KeyID}/cert PUT & DELETE in addition to what R-Operator is allowed to do.

Create a User
-------------

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       add-user --user-id operator --real-name "Jane User" --role operator \
       --passphrase opPassphrase
   User operator added to NetHSM nethsmdemo.nitrokey.com

Generate Keys
-------------

::

   $ nitropy nethsm --host localhost:8443 --username admin --password adminPassphrase \
       generate-key --algorithm RSA --mechanism RSA_Signature_PSS_SHA256 \
       --length 2048 --key-id myFirstKey
   Key myFirstKey generated on NetHSM localhost:8443

List Keys
---------

::

   $ nitropy nethsm --host localhost:8443 --username operator --password opPassphrase \
       list-keys
   Keys on NetHSM localhost:8443:

   Key ID          Algorithm       Mechanisms                      Operations
   ----------      ---------       ------------------------        ----------
   myFirstKey      RSA             RSA_Signature_PSS_SHA256        0         

Show Key Details
----------------

::

   $ nitropy nethsm --host localhost:8443 --username operator --password opPassphrase \
       get-key myFirstKey
   Key myFirstKey on NetHSM localhost:8443:
   Algorithm:       RSA
   Mechanisms:      RSA_Signature_PSS_SHA256
   Operations:      0
   Modulus:         xYDMGEK3CO5vK0ge0pJQEJHBPA/5M42F/kyN7BV+03HEH23NLXWyszYn7MWvxG4uebZfz+6n7auOYePb0FADVvxQvdX4VPcNzBOEgMqfpplEzf5RzmMmFDBgAcGMS5XkbyVS3XR+7bqej5L6qZtGmFn4hG22Ziu5ZdQxyyqos8Go1ogFBz+vQ4WzmDOGEU82quQSxiPT3K71KKVSS4zTL6oz9izuHzOqnLhuGnbtAe5AFBXE2fJIuXMzw36d0OyJ+rdmkh65EXXLo7Qt3VyP7JPIW+JIM2iU26v6suwUCbjFfrDURS8xEftKAe1hkBWJpNHLZhUse7dpvmtlmRyhxw==
   Public exponent: AQAB

Decryption
----------

::

    $ nitropy nethsm --host localhost:8443 --username admin --password adminadmin \
        generate-key -a RSA -m RSA_Decryption_PKCS1 -l 2048 -k testkey
    $ curl --insecure -u operator:operatoroperator -X GET \
        https://localhost:8443/api/v1/keys/testkey3/public.pem -o _public.pem
    $ echo 'NetHSM rulez!' | openssl rsautl -encrypt -inkey _public.pem -pubin \
        -out _data.crypt
    $ base64 _data.crypt > _data.crypt.base64
    $ nitropy nethsm -h localhost:8443 -u operator -p operatoroperator \
        decrypt -k testkey3 -d "$(cat _data.crypt.base64)" -m PKCS1 > _data.decrypt.base64
    $ base64 -d _data.decrypt.base64
    NetHSM rulez!
