Nitrokey Storage, Linux
=======================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

1. To access the OpenPGP smart card of the Nitrokey, install the package
   libccid. On Debian/Ubuntu based Distributions type in terminal: *sudo
   apt-get update && sudo apt-get install libccid*

2. Download and start the `Nitrokey
   App <https://www.nitrokey.com/download>`__.

3. Open the About window from Nitrokey App’s menu and check if you have
   the `latest
   firmware <https://github.com/Nitrokey/nitrokey-storage-firmware/releases>`__
   installed. If it’s not the latest, please
   `update <firmware-update.html>`_.

4. Use the Nitrokey App to change the default User PIN (default: 123456)
   and Admin PIN (default: 12345678) to your own choices.

Your Nitrokey is now ready to use.

.. note::

   For many use cases described, it is necessary to have either OpenPGP
   or S/MIME keys installed on the device (see below).

Key Creation with OpenPGP or S/MIME
-----------------------------------

There are two widely used standards for email encryption. While
OpenPGP/GnuPG is popular among individuals, S/MIME/x.509 is mostly used
by enterprises. If you are in doubt which one to choose, you should use
OpenPGP.

To learn more about how to use OpenPGP for email encryption with the Nitrokey,
please refer to chapter `OpenPGP Email Encryption <openpgp.html>`_.

To learn more about how to use S/MIME for email encryption with the Nitrokey,
please refer to chapter `S/MIME Email Encryption <smime.html>`_.

