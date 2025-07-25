Nitrokey Passkey FAQ
====================

.. faq:: Which Operating Systems are supported?

   Windows, Linux, macOS and BSD. Also FIDO2 is supported on Android and iOS.

.. faq:: What can I use the Nitrokey Passkey for?

   Second or first factor authentication for services which support Webauthn/Passkey/FIDO2/FIDO U2F. 
   See the `overview <https://www.nitrokey.com/products/nitrokeys>`_  of supported use cases.

.. faq:: How can I check if my Nitrokey Passkey is working?

   On `WebAuthn.io <https://webauthn.io/>`_ you can check various high-level functionalities, while
   `webautn.bin.coffee <https://webauthn.bin.coffee/>`_ provides good developer level details (technical)
   details.
   You can also test your Nitrokey with `nitropy <../../software/nitropy/index.html>`_.

.. faq:: What happens if I lose my Nitrokey Passkey device?

   When securing accounts using FIDO2 (two-factor authentication and
   passwordless login), you should configure another factor in your account as
   a backup. Depending on the service this backup factor can be a phone number,
   an app or even a second Nitrokey Passkey. If you lose a Nitrokey Passkey, you
   can still log in with the second Nitrokey Passkey (or with another second
   factor).

.. faq:: How large is the storage capacity?

   The Nitrokey Passkey doesn't contain storage capability for ordinary data (it can
   only store cryptographic keys). It can hold over 100 passkeys resp. FIDO2 keys.

.. faq:: How to use Nitrokey Passkey with Azure Entra ID (Active Directory)?

   After `disabling Enforce Attestation <https://learn.microsoft.com/en-us/azure/active-directory/authentication/howto-authentication-passwordless-security-key#fido-security-key-optional-settings>`_ Nitrokey Passkey is supported by Azure Entra ID out of the box.

.. faq:: Why does the Nitrokey Passkey not show up in GnuPG?

   The Nitrokey Passkey has no support for OpenPGP. 

.. faq:: Why does the Nitrokey Passkey not show up in Nitrokey App?

   The Nitrokey Passkey is not supported by the Nitrokey App 1 and 2.

