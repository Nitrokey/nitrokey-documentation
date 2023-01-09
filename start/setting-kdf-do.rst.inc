Setting KDF-DO
===================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

At the moment it is only possible to set the KDF-DO, when the Nitrokey Start is empty (just after a factory reset).

Overview
---------------

1. Run factory reset
2. Set up KDF-DO using GnuPG
3. Change Admin PIN (optional; without keys only Admin PIN change is possible)
4. Import / generate keys
5. Change User and Admin PIN


Setting KDF-DO using GnuPG
------------------------------------------

1. Run `gpg2 --card-edit`
2. `$ admin`
3. `$ kdf-setup`
4. Enter Admin PIN
5. Verify current state state by looking at the card details (`gpg2 --card-status`), where `KDF setting ......: on` should be visible, e.g.:

.. code-block:: bash

    Max. PIN lengths .: 127 127 127
    PIN retry counter : 3 3 3
    Signature counter : 0
    KDF setting ......: on
    Signature key ....: [none]


Tested with
------------------

*    gpg (GnuPG) 2.2.20 / 2.2.25
*    Nitrokey Start RTM.10
*    Curve 25519 keys
