Nitrokey 3 FAQ
==============

.. faq:: Which Operating Systems are supported?

   Windows, Linux and macOS. Also some support for Android and iOS.

.. faq:: What can I use the Nitrokey for?

   See the `overview <https://www.nitrokey.com/products/nitrokeys>`_  of supported use cases.

.. faq:: How can I check if my Nitrokey 3 is working?

   On `WebAuthn.io <https://webauthn.io>`__ you can check various high-level functionalities, while
   `webautn.bin.coffee <https://webauthn.bin.coffee>`__ provides good developer level details (technical)
   details.
   You can also `test <../../software/nitropy/all-platforms/test.html>`__ your Nitrokey.

.. faq:: Where is the right spot for NFC on my smartphone?

   This is different for every smartphone model, you should find your 
   brand's respective hardware description to find this out.

   For the NitroPhones you can find the information `here <https://support.google.com/pixelphone/answer/7157629>`_.

.. faq:: What happens if I lose my device?

   When securing accounts using FIDO (two-factor authentication and
   passwordless login), you should configure another factor in your account as
   a backup. Depending on the service this backup factor can be a phone number,
   an app or even a second Nitrokey FIDO2. If you lose a device, you
   can still log in with the second Nitrokey (or with another second
   factor).

.. faq:: What makes Nitrokey better than other security keys?

   - Nitrokeys are fully open source and open hardware, reducing vendor lock-in,
     enabling customizations, and 3rd party security audits for higher security.
   - Nitrokeys are made in Germany.
   - Nitrokeys have a standard-compliant USB plug which works reliably on any USB port with thousands of plug in cycles and prevent user confusion, thus reducing support requests.
   - Nitrokey is also available with an encrypted mass storage.
   - Nitrokeys support Measured Boot to secure your computer with tamper detection.
   - We are a German/European-based company, free of government pressure to implement backdoors.
   - We offer a large quantity of guides in our documentation as well as a free, fast and efficient email support in German, English and French.
   - We offer attractive volume discounts.
   - We offer customizations and fulfillment services for small quantities.

.. faq:: How large is the storage capacity?

   The Nitrokey 3 doesn't contain storage capability for ordinary data (it can
   only store cryptographic keys and certificates).

.. faq:: How many keys can my Nitrokey 3 store?

   With the OpenPGP Card feature you can store three key pairs. All keys use the same
   identity but are used for different purposes: authentication, encryption and signing.
   For FIDO2 depending on the other features usage, it can store up to 100 passkeys for the Nitrokey 3A Mini and up to 35 passkeys for the Nitrokey 3 NFC, also known as discoverable credentials and an unlimited number of non-discoverable credentials.
   The PIV feature can store up to 24 key pairs.

.. faq:: How many password can my Nitrokey 3 store?

   You can store up to 50 entries, one entry can contain login, password, comment and OTP.
   
.. faq:: Why does the Nitrokey 3 not show up in GnuPG?

   Make sure to install a firmware more recent than version 1.4.0.
   For more information, see the firmware-update page for your operating system.

.. faq:: Which version of OpenPGP smart card application do the Nitrokey 3 support?

   The Nitrokey 3 is compliant with the `OpenPGP smart card application <https://gnupg.org/ftp/specs/>`__ version 3.4.1.

.. faq:: Why does the Nitrokey 3 not show up in Nitrokey App?

   Nitrokey 3 does only show up and can be managed in "nitropy" and "Nitrokey App 2, not in Nitrokey App 1".

.. faq:: Which algorithms and maximum key length are supported?

   See the following table:

   +-----------------+-------------------+----------------------+-----+
   | Key Type        | OpenPGP (with SE) | OpenPGP (without SE) | PIV |
   +=================+===================+======================+=====+
   | Brainpool P-256 | ✓                 |                      |     |
   +-----------------+-------------------+----------------------+-----+
   | Brainpool P-384 | ✓                 |                      |     |
   +-----------------+-------------------+----------------------+-----+
   | Brainpool P-512 | ✓                 |                      |     |
   +-----------------+-------------------+----------------------+-----+
   | Curve25519      | ✓                 | ✓                    |     |
   +-----------------+-------------------+----------------------+-----+
   | NIST P-256      | ✓                 | ✓                    | ✓   |
   +-----------------+-------------------+----------------------+-----+
   | NIST P-384      | ✓                 |                      |     |
   +-----------------+-------------------+----------------------+-----+
   | NIST P-521      | ✓                 |                      |     |
   +-----------------+-------------------+----------------------+-----+
   | RSA-2048        | ✓                 | ✓                    | ✓   |
   +-----------------+-------------------+----------------------+-----+
   | RSA-3072        | ✓                 | ✓ (import)           |     |
   +-----------------+-------------------+----------------------+-----+
   | RSA-4096        | ✓                 | ✓ (import)           |     |
   +-----------------+-------------------+----------------------+-----+
   
   Since firmware release v1.7.0, OpenPGP uses a secure element (SE) by default.
   If the secure element is disabled, some key types can only be imported but not generated on the device.

.. faq:: How can I set the PIN for my Nitrokey 3?

   The Nitrokey 3 has distinct PINs for each feature.
   Please refer to the chapter `Set Pins <set-pins.html>`__.

.. faq:: Is the Nitrokey 3 Common Criteria or FIPS certified?

   The secure element (SE050M) is Common Criteria EAL 6+ security certified up to the OS 
   level.

   * `Certificate <https://commoncriteriaportal.org/files/epfiles/NSCIB-CC-23-0075446_2-Cert.pdf>`__
   * `Certification Report <https://commoncriteriaportal.org/files/epfiles/NSCIB-CC-0075446-CR2-1.pdf>`__
   * `Security Target <https://commoncriteriaportal.org/files/epfiles/NSCIB-CC-0075446_2-STLite.pdf>`__
   * `Java Card Protection Profile - Open Configuration <https://commoncriteriaportal.org/files/ppfiles/pp0099b_pdf.pdf>`__

.. faq:: How to use Nitrokey 3 with Azure Entra ID (Active Directory)?

   After `disabling Enforce Attestation <https://learn.microsoft.com/en-us/azure/active-directory/authentication/howto-authentication-passwordless-security-key#fido-security-key-optional-settings>`__ Nitrokey 3 is supported by Azure Entra ID out of the box.

.. faq:: How is the data on the Nitrokey 3 protected?

   All data on the Nitrokey 3 is protected from external attacks.

   * FIDO credentials are protected by the microcontroller's security mechanisms.
   * OpenPGP and PIV data is protected through PIN encryption and the microcontroller's security mechanisms.
     Additionally, if the `SE050 secure element <secure-element.html>`__ is used, the data is bound to it.
   * Password Safe data is protected by PIN encryption and the microcontroller's security mechanisms.

.. faq:: How can I use the SE050 Secure Element?

   Starting with version 1.7.0 the Secure Element should be automatically activated, if the OpenPGP Card
   was not used before. To check its activation state you can use: ``nitropy nk3 get-config opcard.use_se050_backend``.
   To activate it, if it isn't activated use: ``nitropy nk3 set-config opcard.use_se050_backend true`` or disable
   it accordingly by passing ``false``. **Changing the backend from one to the other will always wipe all your data 
   inside the OpenPGP Card**

   .. note::
      If you are updating from a test version firmware, we recommend factory resetting the device before
      using the Nitrokey 3 with the SE050 in production environments.
