Set PINs
========

The Nitrokey 3 has distinct PINs for each feature.

- FIDO2
- Password and OTP secrets
- OpenPGP card (User PIN, Admin PIN, and optional Reset Code)
- PIV

Passwords and OTP secrets
-------------------------

The PIN for passwords and OTP secrets can be set with the `Nitropy <../../software/nitropy/index.html>`__ utility.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``nitropy nk3 secrets set-pin`` and follow the instructions.
