MacOS Login with local user
==================================

.. product-table:: nk3

This document explains how to use the PIV smart card of a Nitrokey 3 for local user logon on MacOS. It is available as of firmware version 1.8 and higher.

Prerequisites
-------------

The following setup was used at the time of writing this guide:

- MacOS 15.6 (Sequoia)
- nitropy 0.10.0
- Nitrokey 3 with PIV smart card.

Configure smartcard logon for local use
------------------------------------------------------------

It is assumed that the PIV applet on the Nitrokey is factory-reset. However, overwriting keys and certs should also work.

It is easier to use ``nitropy nk3 piv`` commands when PIN, PUK and management key are not changed in the first place, because then default values apply. So we assume that you did not change them yet. In case you already did you must provide them where necessary.

1. Generate a key and a certificate in PIV slot 9a:

   .. code-block:: bash

   nitropy nk3 piv --experimental generate-key --key 9a --algo nistp256 --subject-name "CN=Foo Bar" --subject-alt-name-upn "foo@bar.com"

2. Generate a key and a certificate in PIV slot 9d:

   .. code-block:: bash

   nitropy nk3 piv --experimental generate-key --key 9d --algo nistp256 --subject-name "CN=Foo Bar" --subject-alt-name-upn "foo@bar.com"

3. Verify that the Nitrokey now has certificates in slots 9a and 9d:

   .. code-block:: bash

   nitropy nk3 piv --experimental list-certificates

4. Verify that the Nitrokey is recognized by the system and that identities are found:

   .. code-block:: bash

   sc_auth identities

This should print something like this:

::

   SmartCard: com.apple.pivtoken:<nitrokey serial number>
   Paired identities which are used for authentication:
   someId	<username> - Zertifikat zur PIV-Authentifizierung (<CN>)

5. Now unplug the Nitrokey and plug it in again. The operating system should recognize the Nitrokey as a PIV smartcard and suggest to pair with the user that is currently logged in.
6. Confirm, you may need to enter the PIV PIN for some initial signing and you may also need to enter you password to allow the PIV certificate to be imported into MacOS keychain.
7. Verify that the PIV identity is successfully paired with the local MacOS user:

   .. code-block:: bash

   sc_auth list

This should print something like this:

::

   Hash: someId

8. Done. You should now be able to log into your Mac with your Nitrokey by using the PIV PIN.
