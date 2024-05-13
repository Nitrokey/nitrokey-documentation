Nitrokey 3 FAQ
==================

**Q:** Which Operating Systems are supported?
   Windows, Linux and macOS. Also some support for Android and iOS.

**Q:** What can I use the Nitrokey for?
   See the `frontpage`_ for an overview of supported use cases.

**Q:** How can I check if my Nitrokey 3 is working?
   On `WebAuthn.io`_ you can check various high-level functionalities, while
   `webautn.bin.coffee`_ provides good developer level details (technical)
   details.
   You can also `test`_ your Nitrokey.

**Q:** Where is the right spot for NFC on my smartphone?
   Use `nfc.fail`_ to find the right spot!

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

**Q:** Why does the Nitrokey 3 not show up in GnuPG
   Make sure to install a firmware more recent than version 1.4.0.
   For more information, see the firmware-update page for your operating system.

**Q:** Why does the Nitrokey 3 not show up in Nitrokey App?
   Nitrokey 3 does only show up and can be managed in "nitropy" and "Nitrokey App 2, not in Nitrokey App 1".

.. include:: ../shared-faqs/algos.rst.inc 

**Q:** How can I set the PIN for my Nitrokey 3?
   The Nitrokey 3 has distinct PINs for each feature.
   Please refer to the chapter of your respective operating system (`Linux <linux/set-pins.html>`__, `Mac OS <mac/set-pins.html>`__, `Windows <windows/set-pins.html>`__).

**Q:** Is the Nitrokey 3 Common Criteria or FIPS certified?
   The secure element is Common Criteria EAL 6+ security certification up to OS 
   level (See `here`_, click “ICs, Smart Cards and Smart Card-Related Devices and 
   ystems” and search for: "NXP JCOP 4 SE050M”).

**Q:** How to use Nitrokey 3 with Azure Entra ID (Active Directory)?
   After `disabling Enforce Attestation`_ Nitrokey 3 is supported by Azure Entra ID out of the box.

**Q:** How can I use the SE050 Secure Element?
  Starting with version 1.7.0 the Secure Element should be automatically activated, if the OpenPGP Card
  was not used before. To check its activation state you can use: ``nitropy nk3 get-config opcard.use_se050_backend``.
  To activate it, if it isn't activated use: ``nitropy nk3 set-config opcard.use_se050_backend true`` or disable
  it accordingly by passing ``false``.

  .. note:: If you are updating from a test version firmware, we recommend factory resetting the device before
            using the Nitrokey 3 with the SE050 in production environments.


.. include:: ../shared-faqs/hyperlinks.rst.inc 
.. _test: ../software/nitropy/all-platforms/test.html
