Passwords
=========

Password entries may consist of:

* Login name (maximum length is 127 characters)
* Password (maximum length is 127 characters)
* Comment (for e.g. a website reference, maximum length is 127 characters)
* One-Time Passwords (HOTP and TOTP)
* Hash-Based Message Authentication Code (HMAC)
* Reverse HOTP

.. note::

   All fields are optional and can be edited and added at any time using the "Edit" button.

   You can store up to 50 passwords.

.. figure:: ./images/credential-example.png


Adding Credentials
******************

1. To add a new entry click on the "Add" button.
2. Enter your user name.
3. Enter the password or OTP secret
4. You can enter the web address to the field Comment.
5. If you want to store a regular password, leave "Password only" in the algorithm field. If you want to store a OTP or HMAC, choose the appropriate algorithm (see below) and copy the OTP secret or QR code that is given by the website (you want to login to) into the field next to it.

   .. figure:: ./images/TOTP-secret.png

   .. figure:: ./images/HOTP-secret.png

6. You can choose to add more security by checking the "Require PIN" or "Require Touch" boxes. Credentials with "Require PIN" (shown as a closed lock) can only be accessed by entering a device the PIN when clicking on "Show Protected Passwords". Unprotected credentials (shown as an open lock) can be accessed without entering a device PIN.

7. Once all desired fields are filled click on "Save".

.. note::

   You need first to set a device PIN before using "Require PIN". Otherwise it will show an error.
   The device PIN can be set or changed in the `settings <./pin.html#passwords>`__).

.. important::
   You are allowed only 8 attempts to enter a device PIN otherwise you will not be able to access or create new credentials and you will need to perform a factory reset in order to use this feature again.

Login
*****

Once your credential is stored you can login to your account with these steps:

1. Select on the left side your Nitrokey on which your credential is stored.
2. Click on the "Passwords" tab.
3. Click on your desired credential, if your credential is protected click on "Show Protected Passwords" first.
4. If it's a regular password, copy the username and the password into the login prompt. If it's a OTP credential, click the “OTP” icon to generate the OTP and enter the OTP code into the appropriate field in the login prompt. (For HOTP, press the button again to generate a new code.)

   .. figure:: ./images/TOTP-code.png

OTP Algorithms
**************

One-Time Passwords (OTPs) are used as multi-factor authentication (MFA) designed to make it much harder for hackers to access protected information such as online accounts.
With the Nitrokey App 2 and your Nitrokey you can use two different MFA:

* TOTP or Time-based One-Time Password is a two-factor authentication code that changes at regular time intervals (e.g. 60 seconds). This is the standard typically used by websites.
* HOTP or HMAC-based One-Time Password is a two factor authentication code that changes each time it's requested and validated. It is rarely used today.
* HMAC is primarily used with KeePassXC.
* Reverse HOTP is used to verify the authenticity of the device instead of authenticating you to a service.

.. note::

   Credentials of the type Reverse HOTP are listed and can be deleted in the "Passwords" tab, but they cannot be created with the Nitrokey App 2. The algorithm selection when adding a credential offers "Password only", "TOTP", "HOTP" and "HMAC" only.

.. note::

   For a list of websites supporting OTPs have a look at `dongleauth.com <https://www.dongleauth.com/>`__.

You can test TOTP with `this <https://authenticationtest.com/totpChallenge/>`__ website.

Export and Import
*****************

Stored credentials can be exported to a file and imported again, for example to move them to another Nitrokey.
Both buttons are located in the "Passwords" tab: "Export" and "Import".

Export
^^^^^^

1. Insert your Nitrokey and click on the "Passwords" tab.
2. Click on the "Export" button.
3. In the dialog, click on "Begin". You are asked for the device PIN, unless it has already been entered earlier in this session. While the operation is running, the status shows "Working... Press your Nitrokey if it blinks."
4. Choose where to save the file. It is stored in JSON format and named ``credential_export.json`` by default.
5. Copy the passphrase shown in the dialog with the button next to it and keep it in a safe place. It is generated automatically and is required to import the file later.

The dialog lists the results in three columns:

* **Successful** - credentials that have been exported
* **Not passwords** - credentials without a password (for example OTP only), which cannot be extracted from the device
* **Skipped** - credentials that are PIN protected while no PIN was supplied

.. important::

   The export is encrypted by default. The "Cleartext" option disables the encryption and stores all credentials unprotected in the file. Only use it for compatibility with other password managers.

Import
^^^^^^

1. Insert your Nitrokey and click on the "Passwords" tab.
2. Click on the "Import" button and select the previously exported file.
3. Enter the passphrase of the file (This is not needed for a file that was exported with the "Cleartext" option)
4. Click on "Begin". You are asked for the device PIN, unless it has already been entered earlier in this session. While the operation is running, the status shows "Working... Press your Nitrokey if it blinks."

The dialog lists the results in three columns:

* **Successful** - credentials that have been imported
* **Already exists** - credentials that were not imported because a credential with the same label already exists on the device
* **Skipped** - credentials that were skipped during the import
