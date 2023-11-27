Frequently Asked Questions (FAQ)
================================

Scalability: How to synchronize a cluster of multiple instances?
----------------------------------------------------------------

NetHSM is stateless, so that several NetHSM devices can be used to enable extremely high throughput and high availability. The PKCS#11 module supports round-robin schedule for a cluster of NetHSM instances. Multiple instances of NetHSM can be synchronized via encrypted backups. For this a separate system downloads and uploads backup files between the instances. This can be a scripted system utilizing pynitrokey. This separate system doesn't has access to the backup data in clear text because the backup files are encrypted.

Is NetHSM FIPS or Common Criteria certified?
--------------------------------------------

Not yet but we are aiming for certifications in the future. Please contact us if you are interested in supporting such efforts.

Which protections against physical tampering are in place?
----------------------------------------------------------

NetHSM contains a TPM which is protected against physical tampering. The TPM is the root of trust and securely stores cryptographic keys which are used to encrypt and decrypt further data and keys in the NetHSM. This protects against booting malicious firmware and software and decrypting data and keys being stored. The current NetHSM doesn't contain additional sensors to detect tampering.

Where can I learn more about NetHMS's security architecture and implementation?
-------------------------------------------------------------------------------

Start with the chapters Getting Started, Administration and Operations. Proceed with the following resources.

* `Overall system design <https://www.nitrokey.com/files/doc/nethsm-system-design.pdf>`_
* `Security assessment report <https://www.nitrokey.com/files/doc/Nitrokey_NetHSM_Security_Assessment_v1.0.pdf>`_
* `Full source code <https://github.com/Nitrokey/nethsm/>`_
* Physical random number generator (TRNG) of quality PTG.3 according to AIS-20: `hardware <https://github.com/Nitrokey/nitrokey-trng-rs232-hardware>`_, `firmware <https://github.com/Nitrokey/nitrokey-trng-rs232-firmware>`_

Roadmap: Which features are planned?
------------------------------------

We plan the following developments in the loose order. Changes to this prioritization based on customer
requests are possible.

* Non-exportable setting, affecting backups
* Performance improvements
* Quorum: m-of-n access scheme and security domain management
* Additional ECC: ECDH (X25519, NIST), secpXk (Koblitz) , Brainpool
* Direct, dynamic cluster capability, possibly support for external database
* Remote attestation and cloud service
* User authentication via mTLS certificates or FIDO
* More user rights management (e.g. additional roles, groups)
* Productive usable software container
* Further separations and hardenings
* FIPS and/or Common Criteria certifications
* Redundant power supplies
