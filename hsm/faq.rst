Nitrokey HSM FAQ
================


.. include:: ../shared-faqs/nitrokeys.rst 

**Q:** What are the default PINs?
   * **User PIN:** "123456"
   * **Administrator PIN:** "12345678"
   * **SO-PIN** (Nitrokey HSM only): "3537363231383830"
   
   We strongly recommend to change these PINs/password to user-chosen values
   before using the Nitrokey.
  

.. include:: ../shared-faqs/pins.rst 


**Q:** What is the SO PIN for?
  The SO PIN is used in the Nitrokey HSM only and is something like a
  "master" PIN with special properties. Please read this instructions carefully
  to understand the SO PIN of the Nitrokey HSM.
   
**Q:** How many data objects (DF, EF) can be stored?
    76 KB EEPROM total, max. 150 x ECC-521 keys, max. 300 x
    ECC/AES-256 keys, max. 19 x RSA-4096 keys, max. 38 x RSA-2048 keys

**Q:** How many keys can I store? 
    Nitrokey HSM can store 20 RSA-2048 and 31 ECC-256 key pairs.

**Q:** How fast is encryption and signing?
    * Key generation on-card: RSA 2048: 2 per minute
    * Key generation on-card: ECC 256: 10 per minute.
    * Signature creation with off-card hash: RSA 2048; 100 per minute
    * Signature creation with off-card hash: ECDSA 256: 360 per minute
    * Signature creation with on-card SHA-256 and 1 kb data: RSA 2048; 68 per minute
    * Signature creation with on-card SHA-256 and 1 kb data: ECDSA 256: 125 per minute


.. include:: ../shared-faqs/algos.rst 


**Q:** How good is the Random Number Generator (RNG)?
    Nitrokey HSM uses the TRNG of JCOP 2.4.1r3 which has a quality of DRNG.2
    (according to AIS 31 of the BSI).

**Q:** Which API can I use?
    OpenSC: Comprehensive instructions exist for OpenSC framework. There is
    nitrotool as a more comfortable frontend to OpenSC.  
    
    GPGSM (from GnuPG): Nitrokey HSM is supported since GnuPG 2.1.  Embedded
    Systems: For systems with minimal memory footprint a read/only PKCS#11
    module is provided by the sc-hsm-embedded project.  This PKCS#11 module is
    useful for deployments where key generation at the user's workplace is not
    required. The PKCS#11 module also supports major electronic signature cards
    available in the German market.  
    
    OpenSCDP: The SmartCard-HSM is fully integrated with
    OpenSCDP, the open smart card development platform. See the public support
    scripts for details. To import existing keys you can use its SCSH or
    NitroKeyWrapper.


**Q:** Is the Nitrokey Pro Common Criteria or FIPS certified?
    The security controler's hardware and operating system are
    Common Criteria certified (`Security Target`_; `HSM2 Report`_; See `here`_,
    click "ICs, Smart Cards and Smart Card-Related Devices and Systems" and
    search for "NXP JCOP 3 P60").


.. include:: ../shared-faqs/hyperlinks.rst 
