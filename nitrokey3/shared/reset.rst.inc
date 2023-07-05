Factory Reset
=============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

Each functionality of the Nitrokey 3 can be reset individually. 

FIDO2
-----

The Factory Reset operation deletes all (and generates new) secret FIDO2 keys stored in the Nitrokey:

* nitropy tool: ``nitropy fido2 reset`` (execution requires Administrator rights)
* Google Chrome: `Manage security keys` via the direct link: `chrome://settings/securityKeys`

Passwords
---------

Static passwords and One-Time Passwords (OTP) can be reset with ``nitropy nk3 secrets reset``.

OpenPGP
-------

The OpenPGP Card can be reset with GnuPG: ``gpg --card-edit``, then ``admin`` and ``factory-reset``.

PIV Smartcard
-------

The PIV smartcard can be reset using: ``echo -n | pivy-tool write-cert <KEY REFERENCE>``


