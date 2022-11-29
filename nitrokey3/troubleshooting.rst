Troubleshooting
===============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:

Here you will find a collection of common issues.


Nitrokey is Not Detected on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the Nitrokey is not detected, proceed as follows:

1. Copy this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__
   to ``/etc/udev/rules.d/``.
2. Restart udev via ``sudo service udev restart``.

 

Google and Microsoft Services
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently there seems to be a bug we hope to fix soon which affects the Nitrokey 3 working with some Google and Microsoft Services per FIDO2.

Timeout Bug
^^^^^^^^^^^

There is a bug with the Nitrokey being recognized by the system, where a timeout occurs before the connection succeeds. 

NFC is Not Working
^^^^^^^^^^^^^^^^^^
Please make sure FIDO2 is working correctly. Otherwise NFC won't work either.

Also check if you are using the right spot on your smartphone. 
Find the right spot using: `nfc.fail`_. 

The backside of the Nitrokey has to be held against the smartphone. For the USB-A version it might be helpful to lift the side with the USB connector slightly to reduce the distance to the end part of the stick. 

If you have a phone cover, try to find the right spot first without it. Retry afterwards with the cover.

The search of the optimal spot sometimes took up to 20-30 sec. In our experience holding the Nitrokey in an horizontal orientation yields better results.If you still encounter issues please write a mail to our support. For optimal help please include the shipping/order number and your smartphone model. 

Update Via update.nitrokey.com Does Not Work
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently the web updater doesn't support the Nitrokey 3. However you can get the latest firmware using these `instructions <firmware-update.html>`_. 


.. _nfc.fail: https://nfc.fail/
