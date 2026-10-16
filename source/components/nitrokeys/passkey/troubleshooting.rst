Troubleshooting
===============

General
-------

* On `WebAuthn.io <https://webauthn.io/>`_ you can check various high-level functionalities, while `webautn.bin.coffee <https://webauthn.bin.coffee/>`_ provides good developer level details (technical) details.

* Check if the LED is working as `expected <./led.html>`_.

* You can test the Nitrokey Passkey using `nitropy <../../software/nitropy/index.html>`_ with  ``nitropy nkpk test``.

Windows
-------

To check whether the Nitrokey Passkey is correctly recognized, open the Device Manager and check for the Nitrokey Passkey appearing as a USB device.

macOS
-----

To check whether the Nitrokey Passkey is correctly recognized, open the System Report and check for the Nitrokey Passkey appearing as a USB device.
Otherwise you can run the following command in the terminal to check if your system recognizes the Nitrokey Passkey.

.. code-block:: shell-session

   system_profiler SPUSBDataType | grep Nitrokey

Linux
-----

To check whether the Nitrokey Passkey is correctly recognized, check if it is shown with ``lsusb``.

If the Nitrokey is not detected, make sure that you have installed the Nitrokey udev rules, see :doc:`../../software/nitropy/linux/udev`.
