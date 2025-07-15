Overview
########


The Nitrokey 3 is a very versatile platform which allows us to constantly
improve and add functionalities. This overview represents the current
state and furthermore adds various technical details on how the different
features are realized.

.. list-table::
   :width: 100%
   :header-rows: 1

   * - **Feature**
     - **Description**
     - **Transport(s)**
     - **Secure element support**


   * - `FIDO2`_
     - Increase (Web-)security using 2FA and passwordless logins; ssh logins
     - USB, NFC
     - no

   * - `U2F`_
     - Predecessor of FIDO2 mainly used for Two-Factor Authentication
     - USB, NFC
     - no

   * - `OpenPGP Card`_
     - Asymmetric cryptography; keep your private key(s) secure; email encryption
     - USB
     - yes

   * - `S/MIME`_
     - Asymmetric cryptography; keep your private key(s) secure; email encryption
     - USB
     - yes

   * - `Password Safe`_
     - (One-Time-)Passwords securely stored on your Nitrokey 3
     - USB
     - no

   * - Admin App
     - Administration functions used by `pynitrokey`_ and `Nitrokey App 2`_
     - USB
     - no

.. note::
   Secure element support for OpenPGP Card is available since stable firmware v1.7.0. Any new 
   devices will have this automatically activated. For devices already in use, the
   user has to `manually switch <secure-element.html>`__ as described in the FAQ.


On top of the stable firmware for the Nitrokey 3, we also provide a `Test Firmware`_, which
comes with additional functionalities, which are not (yet) included into the stable firmware.

**Using the Test Firmware is not recommended for production environments, there might be 
incompatibilities between test and stable firmware upgrades - please use with caution. Especially
data migrations from test to stable firmwares will not be implemented.**
   
.. list-table::
   :width: 100%
   :header-rows: 1

   * - **Feature**
     - **Description**
     - **Transport(s)**
     - **Secure element support**

   * - `PIV`_
     - Asymmetric cryptography; more business focussed smartcard realization
     - USB
     - no

   * - `WebSmartCard`_
     - Provides smartcard-functionalities through the web & FIDO2
     - USB
     - no


.. _FIDO2: ../features/fido2/index.html
.. _U2F: ../features/u2f/index.html
.. _OpenPGP Card: ../features/openpgp-card/index.html
.. _Password Safe: ../features/password-safe/index.html
.. _PIV: ../features/piv/index.html
.. _WebSmartCard: https://github.com/Nitrokey/nitrokey-websmartcard
.. _S/MIME: ../features/openpgp-card/smime/index.html

.. _pynitrokey: ../../software/nitropy/index.html
.. _Nitrokey App 2: ../../software/nk-app2/index.html

.. _Test Firmware: firmware-update.html#firmware-release-types

