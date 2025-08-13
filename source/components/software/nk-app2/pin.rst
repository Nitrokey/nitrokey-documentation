PIN Managment
=============

To enhance security, PINs can be created to restrict access to FIDO2 features and Password Safe.
Click the “settings” tab to create, edit, or reset your PINs. 

Prerequisite
^^^^^^^^^^^^

- Nitrokey App 2 in version 2.3.1 or later.

.. important::

    Each function FIDO2, OTP or OpenPGP Card is assigned a separate PIN, which is managed separately.

First Steps:
^^^^^^^^^^^^

1. Open the Nitrokey App 2.
2. Select the Nitrokey 3.
3. Select the ``SETTINGS`` tab.
4. On the left-hand side of the ``SETTINGS`` tab, a tree structure with various options is available. 

FIDO2
^^^^^

FIDO2 is an authentication standard that enables secure and password-less access to online services.

.. figure:: ./images/FIDO2-menu.png

Click the “FIDO2” drop down menu to change your PIN or remove any previous set credentials with the factory reset option. 

.. Note::

    Factory reset for FIDO2 can only be done within 10 seconds of plugging in your device.

1. Select ``Pin Change`` to set or change the PIN. 
    * Depending on the status of the Fido2 PIN, the input mask for setting or changing the PIN is now displayed. 
2. To set the FIDO2 PIN, enter the new PIN and repeat it in the provided boxes. To change the PIN, enter the current PIN in the box provided.
    * PIN length minimum 4 characters
    * If the repetition of the new PIN is not correct, it will not be accepted.
3. Select the ``SAVE`` button.
    * If the ``SAVE`` button is greyed out, the entries are not correct. 
    * When you hover over the ``SAVE`` button, a list of reasons is displayed.
    * The ``PIN_INVALID`` error message, when changing the PIN, indicates that the current PIN is incorrect. 

Passwords
^^^^^^^^^

Store various credentials and OTPs within Passwords.

.. figure:: ./images/password-menu.png

Click the “Passwords” drop down menu to change your PIN or factory reset and remove all your credentials in Passwords.

.. Note:: 
    
    You will be asked to press your Nitrokey to confirm factory reset.

1. Select ``Passwords``.
    * A branch with ``Pin Change`` opens below ``Passwords``. The status of the OTP PIN is now available on the left-hand side of the ``SETTINGS`` tab, including a short description.
    * Information about the version, serial number and PIN attempt counter is also available.
2. Select ``Pin Change`` to set or change the PIN. 
    * Depending on the status of the OTP PIN, the input mask for setting or changing the PIN is now displayed. 
3. To set the OTP PIN, enter the new PIN and repeat it in the provided boxes. To change the PIN, enter the current PIN in the box provided.
    * PIN length minimum 4 characters
    * If the repetition of the new PIN is not correct, it will not be accepted.
4. Select the ``SAVE`` button.
    * If the ``SAVE`` button is greyed out, the entries are not correct. 
    * When you hover over the ``SAVE`` button, a list of reasons is displayed.
    * The ``PIN_INVALID`` error message, when changing the PIN, indicates that the current PIN is incorrect. 
