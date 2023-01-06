S/MIME Email Encryption
=======================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

Prerequisites
-------------

There are two widely used standards for email encryption.

-  OpenPGP/GnuPG is popular among individuals,

-  S/MIME/X.509 is mostly used by enterprises.

The Nitrokey HSM 2 currently supports the S/MIME/X.509 standard. This page describes the usage of S/MIME email encryption.

You need to purchase a S/MIME certificate (e.g. at `CERTUM <https://www.certum.eu/en/cert_offer_cert_id/>`__) or may already got one by your company. Furthermore, you need to install `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__ on your System. While GNU/Linux users usually can install OpenSC over the package manager (e.g. ``sudo apt install opensc`` on Ubuntu), macOS and Windows users can download the installation files from the `OpenSC <https://github.com/OpenSC/OpenSC/releases>`__ page.

Import Existing Key and Certificate
-----------------------------------

The following instructions are based on the `wiki of OpenSC <https://github.com/OpenSC/OpenSC/wiki/OpenPGP-card>`__. We will assume, that you already got a key-certificate pair as a .p12 file. Please have a look at the wiki page, if you got a separate key and certificate file.

To open the Windows command line please push the Windows-key and R-key. Now type ‘cmd.exe’ in the text field and hit enter. To open a Terminal on macOS or GNU/Linux please use the application search (e.g. spotlight on macOS).

To make these commands as simple as possible, the .p12 file needs to be in your home folder. On Windows this is usually ``C:\Users\yourusername`` and on macOS and GNU/Linux system it will be ``/home/yourusername``. If you do not store the .p12 file there, you have to adapt the path in the commands below. Please plug in the Nitrokey before submitting the commands.

Assuming that your key-certificate file reads ‘myprivate.p12’ the commands for Windows looks like this:

.. code-block:: bash

   "C:\Program Files\OpenSC Project\OpenSC\tools\pkcs15-init" --delete-objects privkey,pubkey --id 3 --store-private-key myprivate.p12 --format pkcs12 --auth-id 3 --verify-pin
   "C:\Program Files\OpenSC Project\OpenSC\tools\pkcs15-init" --delete-objects privkey,pubkey --id 2 --store-private-key myprivate.p12 --format pkcs12 --auth-id 3 --verify-pin

and on macOS and GNU/Linux it will be

.. code-block:: bash

   $ pkcs15-init --delete-objects privkey,pubkey --id 3 --store-private-key myprivate.p12 --format pkcs12 --auth-id 3 --verify-pin
   $ pkcs15-init --delete-objects privkey,pubkey --id 2 --store-private-key myprivate.p12 --format pkcs12 --auth-id 3 --verify-pin

The two commands copy the key-certificate pair to the slot 2 (needed for decrypting emails) and slot 3 (needed for signing). The output looks on both systems something like this:

.. figure:: /pro/images/smime/1.png
   :alt: img1



Please note that there will be error messages that can be safely ignored (see output example above). You now have the key-certificate pair loaded on the Nitrokey.

Usage
-----

You can find further information about the usage on these pages:

-  for using `S/MIME encryption on
   Thunderbird <smime-thunderbird.html>`_

-  for using `S/MIME encryption on
   Outlook <smime-outlook.html>`_

-  for using
   `Evolution <https://help.gnome.org/users/evolution/stable/mail-encryption.html.en>`__,
   an email client for the Gnome Desktop on Linux systems
