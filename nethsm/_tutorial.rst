.. start:: info
First, let’s see what we have here:
.. end

GET /info

.. start:: state
See what the device’s status is:
.. end

GET /state

.. start:: provision
Initialization
--------------

A new NetHSM needs to be provisioned first with passphrases and the
current time. The *Admin Passphrase* is the *Administrator*’s
passphrase, which is the super user of the NetHSM. The *Unlock
Passphrase* is used to encrypt NetHSM’s confidential data store.
.. end

GET /provision

.. start:: boot-mode
NetHSM can be used in *Attended Boot* mode and *Unattended Boot* mode.

-  In *Attended Boot* mode the *Unlock Passphrase* needs to be entered
   during each start which is used to encrypt the data store. For
   security reasons this mode is recommended.
-  In *Unattended Boot* mode no Unlock Passphrase is required, therefore
   the NetHSM can start unattended and the data store is stored
   unencrypted. Use this mode if your availability requirements can’t be
   fulfilled with *Attended Boot* mode.

Retrieve the current mode:
.. end

GET /config/unattended-boot

.. start:: unattended-boot-on
Switch to *Unattended Boot* mode:
.. end

POST /config/unattended-boot on

.. start:: unattended-boot-off
Or switch back to *Attended Boot* mode:
.. end

POST /config/unattended-boot off

.. start:: roles
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
.. end

.. start:: add-user
Create a User
-------------
.. end

PUT /users/operator

.. start:: generate-key
Generate Keys
-------------
.. end

POST /keys/generate

.. start:: list-keys
List Keys
---------
.. end

GET /keys

.. start:: get-key
Show Key Details
----------------
.. end

GET /keys/myFirstKey

.. start:: decrypt
Decryption
----------
.. end

POST /keys/myFirstKey/decrypt
