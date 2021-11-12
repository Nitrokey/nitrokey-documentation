Nitrokey HSM FAQ
================


.. include:: ../shared-faqs/nitrokeys.rst 


**Q:** What is the maximum length of the PIN?
   Nitrokey uses PINs instead of passwords. The main difference is that the
   hardware limits the amount of tries to three while a limit doesn't exist for
   passwords. Because of this, a short PIN is still secure and there is not need
   to choose a long and complex PIN.

   Nitrokey PINs can be up to 16 digits long and can consist
   of numbers, characters and special characters. Note: When using GnuPG or
   OpenSC, 32 character long PINs can be used but aren't supported by Nitrokey
   App.

**Q:** What is the User PIN for?
   The PIN is at least 6-digits long and is used to get
   access to the contect of the Nitrokey. This is the PIN you will use a lot in
   every day use
 
   The PIN can have up to 16 digits and other characters (e.g. alphabetic
   and special characters). But as the PIN is blocked as soon three wrong
   PIN attempts were done, it is sufficiently secure to only have a 6 digits
   PIN. 

**Q:** What is the SO PIN for?
  The SO PIN is used in the Nitrokey HSM only and is something like a
  "master" PIN with special properties. Please read this instructions carefully
  to understand the SO PIN of the Nitrokey HSM.

  The SO PIN has to be exactly 16 digits long.
   
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

**Q:** How can I distinguish a Nitrokey HSM1 from an Nitrokey HSM2?
  Use ``opensc-tool --list-algorithms`` and compare with the table below. Please 
  also see `this thread`_ for the factsheets and more details.

.. include:: ../shared-faqs/algos.rst 


**Q:** How good is the Random Number Generator (RNG)?
    Nitrokey HSM uses the TRNG of JCOP 2.4.1r3 which has a quality of DRNG.2
    (according to AIS 31 of the BSI).

**Q:** Which API can I use?
    OpenSC: Comprehensive instructions exist for OpenSC framework. There is
    nitrotool as a more comfortable frontend to OpenSC.  
    
    Embedded Systems: For systems with minimal memory footprint a read/only PKCS#11
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

.. _this thread: https://support.nitrokey.com/t/comparison-between-nitrokey-hsm-2-and-hsm-1/2977


.. include:: ../shared-faqs/hyperlinks.rst 
