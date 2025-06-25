Frequently Asked Questions (FAQ)
================================

.. faq:: Is NetHSM FIPS or Common Criteria certified?

   Not yet but we are aiming for certifications in the future. Please contact us if you are interested in supporting these efforts.

.. faq:: Which protections against physical tampering are in place?

   NetHSM is sealed which allows to detect physical tampering. It contains a TPM which is protected against physical tampering. The TPM is the root of trust and securely stores cryptographic keys which are used to encrypt and decrypt further data and keys in the NetHSM. This protects against booting malicious firmware and software and decrypting data and keys being stored. The current NetHSM doesn't contain additional sensors to detect tampering.

.. faq:: Where can I learn more about NetHMS's security architecture and implementation?

   Start with the chapters Getting Started, Administration and Operations. Proceed with the following resources.

   * `Overall system design <https://github.com/Nitrokey/nethsm/blob/main/docs/system-design.md>`_
   * `Security assessment report <https://www.nitrokey.com/files/doc/Nitrokey_NetHSM_Security_Assessment_v1.0.pdf>`_
   * `Full source code <https://github.com/Nitrokey/nethsm/>`_
   * Physical random number generator (TRNG) of quality PTG.3 according to AIS-20: `hardware <https://github.com/Nitrokey/nitrokey-trng-rs232-hardware>`_, `firmware <https://github.com/Nitrokey/nitrokey-trng-rs232-firmware>`_

.. faq:: Roadmap: Which features are planned?

Work in progress:

   * Additional ECC: ECDH (X25519, NIST), secpXk (Koblitz) , Brainpool

We plan the following developments in the loose order. Changes to this prioritization based on customer requests are possible.

   * Productive usable software container
   * Direct, dynamic cluster capability, possibly support for external database
   * BIP32 key derivation function
   * Quorum: m-of-n access scheme and security domain management
   * Performance improvements
   * Remote attestation and cloud service
   * User authentication via mTLS certificates or FIDO
   * More user rights management (e.g. additional roles, groups)
   * Further separations and hardenings
   * FIPS and/or Common Criteria certifications
   * Post-quantum cryptography (PQC)
