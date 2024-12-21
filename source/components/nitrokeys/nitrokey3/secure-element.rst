SE050 Secure Element
====================

.. contents:: :local:

The Secure Element is a tamper-resistant secure element designed by NXP Semiconductors that provides advanced security features. 
It offers hardware-based security functions including cryptographic operations, secure key storage, and protection against physical and logical attacks. 
The SE050 Secure Element is certified to Common Criteria EAL 6+ security level and includes features like RSA, ECC, AES, and SHA algorithms, making it ideal for the Nitrokey 3.
It usage is optional and provides faster performance and some additional features.

There are several apps on the Nitrokey 3 of which current only OpenPGPCard (opcard) and PIV (piv) are using it. PIV depends on the Secure Element and does not run without it being enabled.
Passwords (secrets) and FIDO2 (fido-authenticator) are not making use of it.

Activation and Deactivation
---------------------------
The Secure Element is enabled by default if no key is already saved on the device. This is automatically the case after reset of the opcard or the whole device. Activating the Secure Element for the opcard app will delete all current keys.

To check whether the Secure Element is activated run

* nitropy nk3 get-config opcard.use_se050_backend

To enable the Secure Element 

* nitropy nk3 set-config opcard.use_se050_backend true

To disable the Secure Element 

* nitropy nk3 set-config opcard.use_se050_backend false

Additional Features
-------------------

The following features are exclusively usable with the Secure Element being enabled:

Secure key storage: 

* RSA4096
* RSA3072


The following Elliptic Curve algorithms can only be used with the SE50 enabled:

* NIST P-384
* NIST P-521 (secp256r1/prime256v1, secp384r1/prime384v1, secp521r1/prime521v1)
* brainpoolp256r1
* brainpoolp384r1
* brainpoolp512r1
* SECP256K1 (Test release)

TODO: 
    maybe + a link to the product page or data-sheet
    table for comparison



