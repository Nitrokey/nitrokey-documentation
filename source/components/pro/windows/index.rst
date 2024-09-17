Nitrokey Pro, Windows
=====================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

Getting Started
---------------

1. Connect your Nitrokey to your computer and confirm all dialogs so
   that the USB smart card device driver gets installed almost
   automatically. Windows may fail to install an additional device
   driver for the smart card. Its safe to ignore this warning.
2. Download and start the `Nitrokey
   App <https://www.nitrokey.com/download>`__.
3. Go to “Menu” -> “Configure” to change the User PIN (default: 123456)
   and Admin PIN (default: 12345678) to your own choices.

.. figure:: ./images/App-change-pin.png
   :alt: img


Your Nitrokey is now ready to use.

.. note::
   For many use cases described, it is necessary to have either OpenPGP or S/MIME keys installed on the device (see below).

Key Creation with OpenPGP or S/MIME
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two widely used standards for email encryption. While
OpenPGP/GnuPG is popular among individuals, S/MIME/x.509 is mostly used
by enterprises. If you are in doubt which one to choose, you should use
OpenPGP.

To learn more about how to use OpenPGP for email encryption with the Nitrokey,
please refer to chapter `OpenPGP Email Encryption <openpgp.html>`_.

To learn more about how to use S/MIME for email encryption with the Nitrokey,
please refer to chapter `S/MIME Email Encryption <smime.html>`_.
