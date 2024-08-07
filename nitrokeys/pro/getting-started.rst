Getting Started
===============

.. contents:: :local:


1.

    .. tabs::
        .. tab:: Linux
            To access the OpenPGP smart card of the Nitrokey, install the package
            libccid. On Debian/Ubuntu based Distributions type in terminal: *sudo
            apt-get update && sudo apt-get install libccid*

            If your distribution has a rather old version of libccid (<1.4.21)
            you have to add the device information by yourself (for example if
            you are using Ubuntu 14.04 or older). In this case please follow
            these
            `instructions <https://www.nitrokey.com/documentation/frequently-asked-questions-faq#latest-device-driver-missing-on-older-linux-distribution>`__.
        .. tab:: MacOS
            Once you plug in the Nitrokey, your computer will start the Keyboard
            Setup Assistant. **Don’t run through this assistant but exit it right
            away.**
        .. tab:: Windows
            Connect your Nitrokey to your computer and confirm all dialogs so
            that the USB smart card device driver gets installed almost
            automatically. Windows may fail to install an additional device
            driver for the smart card. Its safe to ignore this warning.


2. Download and start the `Nitrokey
   App <https://www.nitrokey.com/download>`__. Follow the
   `instructions <../product-guides/change-pins/index.html>`_
   to change the default User PIN (default: 123456) and Admin PIN
   (default: 12345678) to your own choices.

.. figure:: ../product-guides/change-pins/images/change-pins/App-change-pin.png
   :alt: img


Your Nitrokey is now ready to use.

.. note::

   -  For some Versions of MacOS it is necessary to install custom `ccid
      driver <https://github.com/martinpaljak/osx-ccid-installer>`__
      (for information see
      `here <https://ludovicrousseau.blogspot.com/2016/04/os-x-el-capitan-and-ccid-driver-upgrades.html>`__),
      but in general MacOS should have the driver onboard.

   -  For many use cases described, it is necessary to have either
      OpenPGP or S/MIME keys installed on the device (see below).


.. tip::

   Note: For many use cases described, it is necessary to have either
   OpenPGP or S/MIME keys installed on the device (see below).


Key Creation with OpenPGP or S/MIME
-----------------------------------

There are two widely used standards for email encryption. While
OpenPGP/GnuPG is popular among individuals, S/MIME/x.509 is mostly used
by enterprises. If you are in doubt which one to choose, you should use
OpenPGP.

To learn more about how to use OpenPGP for email encryption with the Nitrokey,
please refer to chapter `OpenPGP Email Encryption <../features/openpgp/index.html>`_.

To learn more about how to use S/MIME for email encryption with the Nitrokey,
please refer to chapter `S/MIME Email Encryption <../features/smime/index.html>`_.
