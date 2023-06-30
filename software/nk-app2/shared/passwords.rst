Passwords
=========
.. _passwords:

For now only OTPs are supported by the password manager. 

Passwords supports both HMAC-based One-Time Passwords (HOTP) and Time-based One-Time Passwords (TOTP).

For a list of websites supporting OTP have a look at `dongleauth.com <https://www.dongleauth.com/>`__.

Usage Information
------------------

Entries are divided into two categories: unprotected (shown as an open lock) and protected (shown as a closed lock). Unprotected entries can be accessed directly. Protected entries can only be accessed with the PIN. 

You can choose to create a protected entry by checking the "Protect with PIN" box when adding a new entry.

You also have the option to require user presence in the form of a required touch on the Nitrokey 3 to access the entry by checking the "Require User Presence" box.