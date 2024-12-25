SE05x Secure Element
====================

.. contents:: :local:

The Secure Element is a tamper-resistant secure element designed by NXP Semiconductors that provides advanced security features. 
It offers hardware-based security functions including cryptographic operations, secure key storage, and protection against physical and logical attacks. 
The SE05X Secure Element is certified to Common Criteria EAL 6+ security level and includes features like RSA, ECC, AES, and SHA algorithms, making it ideal for the Nitrokey 3.
It usage is optional and provides faster performance and some additional features.

Currently only OpenPGP Card and PIV are using the Secure Element. PIV depends on the Secure Element and does not run without it being enabled and OpenPGP Card can be configured to use the Secure Element or not. Passwords and FIDO2 are not making use of it.

You can read more information about the Secure Element itself here `SE050 <https://www.nxp.com/products/SE050>`__.

Activation and Deactivation
---------------------------
The Secure Element is enabled by default if no key in OpenPGP Card and PIV is already saved on the device. 
This is automatically the case after reset of the OpenPGP Card or the whole device. Manually activating the Secure Element for the OpenPGP Card will delete all current keys.

To check whether the Secure Element is activated run:

* nitropy nk3 get-config opcard.use_se050_backend

To enable the Secure Element:

* nitropy nk3 set-config opcard.use_se050_backend true

To disable the Secure Element: 

* nitropy nk3 set-config opcard.use_se050_backend false

Additional Features
-------------------

+-----------------------------------------+---------------------+------------------------+
| Algorithm                               | With Secure Element | Without Secure Element |
+=========================================+=====================+========================+
| RSA 2048 bit                            | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| RSA 3072 bit                            | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| RSA 4096 bit                            | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| ECC 256-521 bit                         | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| AES 128/256 bit                         | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| SHA 256/384/512 bit                     | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| NIST P-256 (secp256r1/prime256v1)       | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| NIST P-384 (secp384r1/prime384v1)       | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| NIST P-521 (secp521r1/prime521v1)       | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| Ed25519/Curve25519                      | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| brainpoolP256r1                         | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| brainpoolP384r1                         | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| brainpoolP512r1                         | ✓                   | ⨯                      |
+-----------------------------------------+---------------------+------------------------+
| HOTP (RFC 4226)                         | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| TOTP (RFC 6238)                         | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+
| Physical random number generator (TRNG) | ✓                   | ✓                      |
+-----------------------------------------+---------------------+------------------------+

