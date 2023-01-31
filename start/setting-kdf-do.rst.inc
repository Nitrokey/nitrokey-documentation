Setting KDF-DO
===================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

Introduction
---------------

KDF-DO stands for Key Derived Function - Data Object.
With this data object the card can inform clients that it supports derived keys. (For details see section 4.3.2 of the `OpenPGP Smart Card 3.4 specification <https://gnupg.org/ftp/specs/OpenPGP-smart-card-application-3.4.pdf>`__)
The benefit of using derived keys is, that instead of transmitting passwords in clear text only hashes are transmitted to the card and
therefore only hashes are stored on the card.
Since a derived key will be longer than the original password it will also be harder to successfully run a brute force attack.

.. note::

   At the moment it is only possible to set the KDF-DO, when the Nitrokey Start is empty (just after a factory reset).

Steps to Configure KDF-DO
-------------------------

1. Run factory reset
2. Set up KDF-DO using GnuPG
3. Change Admin PIN (optional; without keys only Admin PIN change is possible)
4. Import / generate keys
5. Change User and Admin PIN


Setting KDF-DO using GnuPG
---------------------------

1. Run ``gpg2 --card-edit``
2. ``$ admin``
3. ``$ kdf-setup``
4. Enter Admin PIN
5. Verify current state state by looking at the card details (``gpg2 --card-status``), where ``KDF setting ......: on`` should be visible, e.g.:

.. code-block:: bash

    Max. PIN lengths .: 127 127 127
    PIN retry counter : 3 3 3
    Signature counter : 0
    KDF setting ......: on
    Signature key ....: [none]


Tested with
------------

*    gpg (GnuPG) 2.2.20 / 2.2.25
*    Nitrokey Start RTM.10
*    Curve 25519 keys
