Nitrokey 3 FAQ
==================

**Q:** Which Operating Systems are supported?
   Windows, Linux, and Mac OS X. Also some support for Android and iOS.

**Q:** What can I use the Nitrokey for?
   See the `frontpage`_ for an overview of supported use cases.

**Q:** How can I check if my Nitrokey 3 is working?
   On `WebAuthn.io`_ you can check various high-level functionalities, while
   `webautn.bin.coffee`_ provides good developer level details (technical)
   details. 

**Q:** What happens if I lose my device?
   When securing accounts using FIDO (two-factor authentication and
   passwordless login), you should configure another factor in your account as
   a backup. Depending on the service this backup factor can be a phone number,
   an app or even a second Nitrokey FIDO2. If you lose a device, you
   can still log in with the second Nitrokey (or with another second
   factor).

**Q:** How large is the storage capacity?
   The Nitrokey 3 doesn't contain storage capability for ordinary data (it can
   only store cryptographic keys and certificates).

**Q:** When will the OpenPGPCard firmware be available?
   This is very hard to predict at this point. We are aiming for mid of 2022,
   but this is a very rough estimation with lots of uncertainties.

**Q:** Why does the Nitrokey 3 not show up in gnupg/Nitrokey App/nitropy ?
   We are currently working on integrating the Nitrokey 3 within at least 
   ``nitropy``, Nitrokey App and GnuPG will likely be only available once
   the OpenPGPCard firmware update is available.

**Q:** How can I set the PIN for my Nitrokey 3 ?
   You can configure and do basic settings for your Nitrokey 3 using Chrome(ium)
   just visit: `chrome://settings/securityKeys`_ (clicking the link will not work
   for security reasons, please copy&paste it)



.. include:: ../shared-faqs/hyperlinks.rst 

