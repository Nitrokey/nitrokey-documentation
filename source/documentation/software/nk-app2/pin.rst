PIN Settings for FIDO2 and OTP in the Nitrokey App 2
====================================================

These instructions describe how to set or change the PINs for FIDO2 and OTP in the `Nitrokey App 2 </software/nk-app2/>`__. 

.. important::

    - This function is not yet available in the current release of the `Nitrokey App 2 </software/nk-app2/>`__ version 2.3.0 
    - The function is expected to be available in the release of the `Nitrokey App 2 </software/nk-app2/>`__  version 2.3.1 

.. important::

    Each function FIDO2, OTP or OpenPGP Card is assigned a separate PIN, which is managed separately.

First Steps:
^^^^^^^^^^^^

1. Open the `Nitrokey App 2 </software/nk-app2/>`__.
2. Select the Nitrokey 3.
3. Select the ``SETTINGS`` tab.
4. On the left-hand side of the ``SETTINGS`` tab, a tree structure with various options is available. 


FIDO2 PIN Settings
^^^^^^^^^^^^^^^^^^

1. Select ``FIDO2``.
    * A branch with ``FIDO2 PIN SETTINGS`` opens below ``FIDO2``. The status of the FIDO2 PIN is now available on the left-hand side of the ``SETTINGS`` tab, including a short description.
2. Select ``FIDO2 PIN SETTINGS`` to set or change the PIN. 
    * Depending on the status of the Fido2 PIN, the input mask for setting or changing the PIN is now displayed. 
3. To set the FIDO2 PIN, enter the new PIN and repeat it in the provided boxes. To change the PIN, enter the current PIN in the box provided.
    * PIN length minimum 4 characters
    * If the repetition of the new PIN is not correct, it will not be accepted.
4. Select the ``SAVE`` button.
    * If the ``SAVE`` button is greyed out, the entries are not correct. 
    * When you hover over the ``SAVE`` button, a list of reasons is displayed.
    * The ``PIN_INVALID`` error message, when changing the PIN, indicates that the current PIN is incorrect. 

OTP PIN Settings
^^^^^^^^^^^^^^^^

1. Select ``OTP``.
    * A branch with ``OTP PIN SETTINGS`` opens below ``OTP``. The status of the OTP PIN is now available on the left-hand side of the ``SETTINGS`` tab, including a short description.
    * Information about the version, serial number and PIN attempt counter is also available.
2. Select ``OTP PIN SETTINGS`` to set or change the PIN. 
    * Depending on the status of the OTP PIN, the input mask for setting or changing the PIN is now displayed. 
3. To set the OTP PIN, enter the new PIN and repeat it in the provided boxes. To change the PIN, enter the current PIN in the box provided.
    * PIN length minimum 4 characters
    * If the repetition of the new PIN is not correct, it will not be accepted.
4. Select the ``SAVE`` button.
    * If the ``SAVE`` button is greyed out, the entries are not correct. 
    * When you hover over the ``SAVE`` button, a list of reasons is displayed.
    * The ``PIN_INVALID`` error message, when changing the PIN, indicates that the current PIN is incorrect. 
