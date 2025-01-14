FIDO2 on Android / NitroPhone
*****************************

.. Note::
    For more information about FIDO2, FIDO2 U2F and Passkeys, check our `blog article  <https://www.nitrokey.com/blog/2022/fido2-webauthn-passkeys-2022-and-2023>`_.

In order to use FIDO2 on GrapheneOS you need to install the Google Play services via GrapheneOS App Store.

.. Note::
    You don't have to grant Play services the network permission in order for FIDO2 to work.

.. important::
   Play services do not support PIN functionality over NFC.

Multi-Factor Authentication With FIDO2, FIDO U2F
################################################

Registration and sign-in works seamlessly with USB and NFC, in Vanadium and in apps. No further steps are required.

FIDO2 Passkeys
##############

**If no third-party autofill service is enabled:**

Signing in with passkeys and Vanadium should work without having to change any settings.

**If a third-party autofill service is enabled:**

Disable Vanadium's support for passkeys with password managers by changing an experimental setting:

1. In the address bar, type: ``chrome://flags`` and press enter.
2. In the search bar, type "passkeys".
3. A setting called "Android Credential Management for passkeys" will appear. Change this setting to "Disabled".
4. Select "Relaunch".

In order to test if FIDO2 works on your Android / NitroPhone you can use `WebAuthn.io  <https://webauthn.io/>`_.
