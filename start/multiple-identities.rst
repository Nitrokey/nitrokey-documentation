Multiple Identities
===================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

The multiple identites feature allows to use 3 virtual smart cards in place of one, giving bigger flexibility in the every day use, as well as separation between user identities (business, personal etc.) or even allowing usage of it for more than one user (PINs are separate).

All of the smart cards have separate data objects, meaning they all could have different keys, certificates stored, and PINs set. Identities do not intereact between each other.

The virtual smart cards are identifyable by the first digit of the serial number, which is replaced by identity number for second (“1”) and third one (“2”). Serial number is not changed for the first identity.

Usage
-----

To change the identity it suffices to send a custom CCID command. This could be achieved with ``pynitrokey`` tool:

1. `Install
   pynitrokey <https://github.com/Nitrokey/pynitrokey#installation>`__.

2. Connect your Nitrokey Start and verify that it got recognized.

.. code-block:: bash

   $ nitropy start list
       *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
       :: 'Nitrokey Start' keys:
       FSIJ-1.2.15-87042524: Nitrokey Nitrokey Start (RTM.10) 

3. Change the identity, by replacing ``<ID>`` with ``0``, ``1``, or
   ``2``.

.. code-block:: bash

   $ nitropy start set-identity <ID>
       *** Nitrokey tool for Nitrokey FIDO2 & Nitrokey Start
       Trying to set identity to <ID>
       device has reset, and should now have the new identity

Limitations
-----------

As of version RTM.10 there is only one limitation - the third identity can store a certificate not longer than 1024 bytes. The other two identities have standard limit of 2048 bytes per certificate.
