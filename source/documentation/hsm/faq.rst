Nitrokey HSM FAQ
================


.. include:: ../shared-faqs/nitrokeys.rst.inc 


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
   access to the content of the Nitrokey. This is the PIN you will use a lot in
   every day use.
 
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
    76 KB EEPROM total, that can be used for 
    
    * max. 150 x ECC-521 keys or
    * max. 300 x ECC/AES-256 keys or 
    * max. 19 x RSA-4096 keys or
    * max. 38 x RSA-2048 keys

**Q:** How many keys can I store? 
    Nitrokey HSM can store 20 RSA-2048 and 31 ECC-256 key pairs.

**Q:** How fast is encryption and signing?
    * Key generation on-card: RSA 2048: 2 per minute
    * Key generation on-card: ECC 256: 10 per minute.
    * Signature creation with off-card hash: RSA 2048; 100 per minute
    * Signature creation with off-card hash: ECDSA 256: 360 per minute
    * Signature creation with on-card SHA-256 and 1 kb data: RSA 2048; 68 per minute
    * Signature creation with on-card SHA-256 and 1 kb data: ECDSA 256: 125 per minute

**Q:** How can I distinguish a Nitrokey HSM 1 from an Nitrokey HSM 2?
  Use ``opensc-tool --list-algorithms`` and compare with the table below. Please 
  also see `this thread`_ for the factsheets and more details.

.. include:: ../shared-faqs/algos.rst.inc 

**Q:** How can I use the True Random Number Generator (TRNG) of the Nitrokey HSM for my applications?
    Nitrokey HSM can be used with `Botan`_ and `TokenTools`_ by using OpenSC as a PKCS#11 driver.

    OpenSSL can't use Nitrokey HSM's RNG directly because engine-pkcs11 doesn't contain a mapping for OpenSSL to C_GenerateRandom.

**Q:** How good is the Random Number Generator?
    Nitrokey HSM uses the True Random Number Generator of JCOP 2.4.1r3 which has a quality of DRNG.2
    (according to `AIS 31`_ of the German Federal Office for Information Security, BSI).

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


**Q:** Is the Nitrokey HSM 2 Common Criteria or FIPS certified?
    The security controller (NXP JCOP 3 P60) is Common Criteria EAL 5+ certified up to the OS
    level (`Certificate <https://commoncriteriaportal.org/files/epfiles/NSCIB-certificate%2021-98209.pdf>`__, `Certification Report <https://commoncriteriaportal.org/files/epfiles/Certification%20Report%20NSCIB-CC-98209-CR5%20-%20version%203.0%20(2022-10-14).pdf>`__, `Security Target <https://commoncriteriaportal.org/files/epfiles/NSCIB-CC-98209_5-STLite.pdf>`__, `Java Card System Protection Profile Open Configuration, Version 3.0 <https://commoncriteriaportal.org/files/ppfiles/ANSSI-CC-profil_PP-2010-03en.pdf>`__).

**Q:** How to import an existing key into the Nitrokey HSM?
    First, `set up`_ your Nitrokey HSM to use key backup and restore. Then use Smart Card Shell for importing. If your key is stored in a Java key store you can use `NitroKeyWrapper`_  instead.

**Q:** How do I secure my Cloud Infrastructure/Kubernetes with Nitrokey HSM? 
    An approach to secure keys for Hashicorp Vault/Bank-Vault on a Nitrokey HSM can be found at `banzaicloud.com`_.

**Q:** Can I use Nitrokey HSM with cryptocurrencies?
    J.v.d.Bosch wrote a simple, free python `program`_ to secure the private key of a Bitcoin wallet in a HSM.
    `Tezos`_ has been `reported`_ to work with Nitrokey HSM.


.. _set up: https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#using-key-backup-and-restore
.. _Smart Card Shell: https://www.openscdp.org/scsh3/
.. _NitroKeyWrapper: https://git.bubu1.eu/Bubu/nitrokeywrapper
.. _this thread: https://support.nitrokey.com/t/comparison-between-nitrokey-hsm-2-and-hsm-1/2977
.. _banzaicloud.com: https://bank-vaults.dev/docs/operator/hsm/nitrokey-opensc/
.. _program : http://smartbtc.eu/index.html
.. _Tezos: https://tezos.com/
.. _reported: https://twitter.com/thomas_quinlan/status/1222492762760716288
.. _Botan: https://botan.randombit.net/
.. _TokenTools: https://github.com/infincia/TokenTools
.. _AIS 31: https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Zertifizierung/Interpretationen/AIS_31_pdf

.. include:: ../shared-faqs/hyperlinks.rst.inc 
