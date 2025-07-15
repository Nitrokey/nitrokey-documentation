Getting Started
===============

.. contents:: :local:


1. 
    .. tabs::
        .. group-tab:: Linux
            To access the OpenPGP smart card of the Nitrokey, install the package
            libccid. On Debian/Ubuntu based Distributions type in terminal: 
            .. code-block:: bash
				
				$ sudo apt-get update && sudo apt-get install libccid

        .. group-tab:: MacOS
            Important: Once you plug in the Nitrokey, your computer will start
            the Keyboard Setup Assistant. **Don’t run through this assistant but
            exit it right away.**

        .. group-tab:: Windows
            Connect your Nitrokey to your computer and confirm all dialogs so that the USB smart card device driver gets installed almost automatically.

           .. note::

            Windows may fail to install an additional device driver for the smart card. Its safe to ignore this warning.

2. 
    .. tabs::
        .. group-tab:: Linux
            Download and start the `Nitrokey App <https://www.nitrokey.com/download>`__.

        .. group-tab:: MacOS
            Download and start the `Nitrokey App <https://www.nitrokey.com/download>`__. Perhaps you want to store
            it on the unencrypted partition of your Nitrokey Storage

        .. group-tab:: Windows
            Download and start the `Nitrokey App <https://www.nitrokey.com/download>`__. Perhaps you want to store it on the unencrypted partition of your Nitrokey Storage. There won’t open a window, but an icon appears in the system tray (see screenshot below). Please right-click on this icon to use all the options of the App.

            .. figure:: images/getting-started/Windows10-Systemtray.png
                :alt: img1

3. Open the About window from Nitrokey App’s menu and check if you have
   the `latest
   firmware <https://github.com/Nitrokey/nitrokey-storage-firmware/releases>`__
   installed. If it’s not the latest, please
   `update <firmware-update.html>`_.

4. Use the Nitrokey App to change the default User PIN (default: 123456)
   and Admin PIN (default: 12345678) to your own choices.

Your Nitrokey is now ready to use.

.. note::

   -  For some Versions of MacOS it is necessary to install custom `ccid
      driver <https://github.com/martinpaljak/osx-ccid-installer>`__
      (for information see
      `here <https://ludovicrousseau.blogspot.com/2016/04/os-x-el-capitan-and-ccid-driver-upgrades.html>`__),
      but in general MacOS should have the driver onboard.

   -  For many use cases described, it is necessary to have either
      OpenPGP or S/MIME keys installed on the device (see below).

Key Creation with OpenPGP or S/MIME
-----------------------------------

There are two widely used standards for email encryption. While
OpenPGP/GnuPG is popular among individuals, S/MIME/x.509 is mostly used
by enterprises. If you are in doubt which one to choose, you should use
OpenPGP.

To learn more about how to use OpenPGP for email encryption with the Nitrokey,
please refer to chapter `OpenPGP Email Encryption <../features/openpgp-card/index.html>`_.

To learn more about how to use S/MIME for email encryption with the Nitrokey,
please refer to chapter `S/MIME Email Encryption <../features/openpgp-card/smime/index.html>`_.

