Smart Card Shell
================

Installation
------------

Install dependencies on your computer. For a host running Debian 12,
you’ll need:

* A desktop environment (like ``gnome-shell``)
* A Java runtime ``openjdk-17-jre``

#. Visit the `Smart Card Shell project page <https://www.openscdp.org/scsh3/download.html>`__ and grab the file archive.
#. Extract it wherever you want.
#. Launch ``scsh3gui``.

Prepare Personal HSM
--------------------

Personal HSM will be used for authentication.

Initialize the Personal HSM
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug the device in. In the Smart Card Shell, click on File / Key Manager.

Our HSM should appear in the left pane, as well as in the text shell in
the middle of the window.

Note: if you encounter a “GPError” instead of seeing the HSM, restart
the program.

Right click on the device, then left click on “Initialize Device”. Fill
in the following:

::

   Enter Initialization Code (SO-PIN): <SO-PIN of 16 digits>
   Define a label: hsm_<personal id>
   Define a provisioning URL (Optional): <keep this empty>

   Select authentication mechanism: User PIN
   Allow RESET RETRY COUNTER: Resetting and unblocking PIN with SO-PIN not allowed
   Enter new User_PIN (leave empty to generate random PIN): <PIN of 6 digits>

::

   Select Device Key Encryption scheme:  No DKEK

::

   keep a profile on disk to save the PINs ?: No

Generate and Export Authentication Keys
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that our device has been initialized, we can generate the key pair
that will be used to authenticate the key custodian.

In the left pane, right click on the HSM, then left click on “Generate
ECC key”. Fill in the following:

::

   Curve: brainpoolP256r1 (beware! signature must not exceed 256 bits or authentication will fail)
   key label: key_<personal id>
   possible algorithms for ECC key: <empty>

Once the key pair has been generated, find the left pane again and:

#. Unfold the key object
#. Right click on the certificate and “export publick key”

We obtain a file whose extension is ``.pka``. We will later upload it to
the CA HSM as part of our authorized keys for our m-of-n authentication.

Repeat
~~~~~~

Unplug the device and repeat operations until all public keys have been
exported.

Prepare CA HSM
--------------

CA HSM will have very different settings than personal HSM.

Initialize the CA HSM
~~~~~~~~~~~~~~~~~~~~~

Plug in the device that will host your CA. In Smart Card Shell, click on
File / Key Manager.

In the left pane, right click on the HSM, then left click on “initialize
device”. Fill in the following:

::

   Initialization Code (SO-PIN): <SO-PIN>
   label: hsm_<ca_name>
   provisioning URL: <empty>

   authentication mechanism: Public Key Authentication
   total number of public keys: 5
   number of public keys required: 3
   allow replacing registered public keys: Yes

   device key encryption scheme:  DKEK Shares ( No DKEK | Randomly generated DKEK | DKEK Shares | Key domains )
   number of DKEK shares: 1
   keep a profile on disk to save the PINs ?: No

Our HSM has been initialized.

Register Authorized Keys
~~~~~~~~~~~~~~~~~~~~~~~~

In the left pane, right click on the number of missing keys, then left
click on “register public key”.

Click on “Browse”, set the filter to “all file types”, then pick one of
the ``.pka`` files. Click on “yes” to confirm.

Reiterate until all pubkeys have been added to the authorized keys.

Our HSM will now require 3 out of 5 key custodians to sign in before
letting us use our root CA.

Pubkey Authentication
~~~~~~~~~~~~~~~~~~~~~

Beware not to unplug the CA HSM during this procedure. It is ok (and
probably necessary, unless you have many USB ports) to un/plug personal
HSM one after the other.

While the CA HSM is still plugged in, plug one personal HSM in a free
port.

In the left pane, right click on the number of public keys
authenticated, then left click on “Authenticate with Public Key”.

A list of card readers is shown. Pick the one with position “01 00”. The
program will ask us for a key, and we should find it in the list under
the label “key\_”. Ask the key custodian to enter their PIN.

Once this is done, the counter is incremented by 1. Reiterate the
procedure until quorum is reached.

Generate DKEK
~~~~~~~~~~~~~

Device Key Encryption Key (DKEK) will allow us to backup our CA to a
second HSM, in order to avoid Single Point of Failures (SPOF). As it is
very sensitive, the DKEK will be protected by Shamirs’s Secret Sharing.
For convenience, we will split the DKEK with the same m-of-n scheme, and
distribute a part of the secret to each custodian. You might distribute
the secrets to very different people than the key custodians though, as
no personal HSM will not be involved here.

Left pane, right click on the HSM, left click on “Create DKEK share”.
Then fill in:

::

   DKEK Share Format: Create DKEK Share as File (n-of-m)
   File name for DKEK Share: hsm_<ca_name>_dkek.pbe
   total number of shares: 5
   number of shares required: 3

For each part, take care to write down the exact content and distribute
it to its custodian.

Import DKEK
~~~~~~~~~~~

The ``.pbe`` file we just obtained MUST be imported on all devices that
will contain the root CA, including the device used to generate the
file!

In the left pane, right click on “DKEK set-up in progress”, then left
click on “Import DKEK Share”. Fill in the following:

::

   DKEK Share Format: Import DKEK Share from File (n-of-m)
   file name containing DKEK share: <path/to/hsm_<ca_name>_dkek.pbe>
   number of shares to enter: 5
   enter prime: <prime>

Thanks to this, we will later be able to export our CA key pair in an
encrypted container, and reimport it on other HSM which share the same
DKEK.

Generate CA
-----------

Smart Card Shell does allow to generate key pair, but this step must be
done through PKIAAS.

`Build your PKI with PKIAAS <pkiaas>`__
