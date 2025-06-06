
Troubleshooting
===============

General
-------

* On `WebAuthn.io`_ you can check various high-level functionalities, while `webautn.bin.coffee`_ provides good developer level details (technical) details.

* Check if the LED is working as `expected`_.

* You can test the Nitrokey Passkey using `nitropy`_ with  ``nitropy nkpk test``.

Windows
-------

To check whether the Nitrokey Passkey is correctly recognized, open the Device Manager and check for the Nitrokey Passkey appearing as a USB device.

macOS
-----

To check whether the Nitrokey Passkey is correctly recognized, open the System Report and check for the Nitrokey Passkey appearing as a USB device.
Otherwise you can use the commandline with the following command to check if your system recognizes the Nitrokey Passkey. 

.. code-block:: bash

   system_profiler SPUSBDataType | grep Nitrokey

Linux
-----

To check whether the Nitrokey Passkey is correctly recognized, check if it is shown with `lsusb`.

If the Nitrokey is not detected, proceed the following:

1. Copy this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__
   to ``/etc/udev/rules.d/``. In very rare cases, the system will need
   the `older
   version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`__
   of this file.
2. Restart udev via ``sudo service udev restart`` or ``udevadm control --reload-rules && udevadm trigger`` if you are using Fedora.


.. include:: ../../shared-faqs/hyperlinks.rst.inc 
.. _nitropy: ../../software/nitropy/index.html
.. _expected: ./led.html
