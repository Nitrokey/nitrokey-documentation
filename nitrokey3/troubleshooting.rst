Troubleshooting
===============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:

Here you will find a collection of common issues.



Nitrokey is not detected on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the Nitrokey is not detected, proceed the following:

1. Copy this file
   `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_
   to ``/etc/udev/rules.d/``.
2. Restart udev via ``sudo service udev restart``.

 

Google and Microsoft Services
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently there seems to be a bug we hope to fix soon which affects the Nitrokey 3 working with some Google and Microsoft Services per FIDO2.

Timeout Bug
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

There is a bug  with the Key being recognized by the System but a Timeout occurs before the connection succeed. 

NFC is Not Working
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Please make sure FIDO2 is working correctly. Otherwise NFC won't work either.

Also check if you are using the right spot on your smartphone. 
Find the right spot using: `nfc.fail`_ 

The backside of the Nitrokey has to be held against the smartphone. For the USB-A Version it might be helpful to lift the side with the USB-Connector slightly to reduce the distance of the end part of the stick. 

Try to find the right spot without a phone cover first. Retry afterwards with the cover 



The search of the optimal spot sometimes took up to 20-30 sec. In our experience holding the Nitrokey in an horizontal orientation yields better results.If you still encounter issues please write a mail at our support. For optimal help please include the shipping/order number and your smartphone model. 





update.nitrokey.com does not work:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Currently there are no updates available. The first firmware updates will address bug fixes.

.. _nfc.fail: https://nfc.fail/
