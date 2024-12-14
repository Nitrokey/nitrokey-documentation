Importing Keys And Certificates
===============================

.. product-table:: hsm

.. contents:: :local:

Generally the concept to import key-pairs and/or certificates
is the following:

* Create a DKEK (Device Key Encryption Key) share
* Initialize device and enable DKEK as "Device Encryption Scheme"
* Import DKEK share into device
* Import PKCS#12 container(s) into DKEK

This documentation covers only one specific use-case and should
serve as an example for the overall workflow. For further information
please read `this thread`_ and `this blog post`_.

.. Warning::

   This procedure will reset your Nitrokey HSM 2 device and
   all data on it will be deleted!

Preparation
-----------

* make sure all the keys you would like to import are available as PKCS#12
  containers (`.p12`) and you know the password, if needed

* be sure that nothing on the used Nitrokey HSM 2 is needed, it will be deleted
  during this procedure

* download the latest `Smart Card Shell`_ and unpack it into your work-directory

Importing Via The SCSH3 GUI
---------------------------

Inside the unpacked directory you will find ``scsh3gui``, which can be started 
using ``bash scsh3gui`` (for windows double-click on: ``scsh3gui.cmd``).

Once the SCSH3 Tool is open, you should see your Nitrokey HSM 2 inside the tree
view. Please follow these steps to import:

* Start key-manager (File -> Keymanager)

* Right-click "Smartcard-HSM" -> create DKEK share

  * Choose file location 

  * Choose DKEK share password

* Right-click "Smartcard-HSM" -> Initialize device

  * Enter SO-PIN

  * (optional) Enter label and enter URL/Host

  * Select authentication method: "User PIN"

  * Allow RESET RETRY COUNTER: "Resetting and unblocking PIN with SO-PIN not allowed"

  * Enter and confirm User PIN

  * "Select Device Key Encryption scheme" -> "DKEK shares"

  * Enter number of DKEK shares: 1

* Right-click DKEK set-up in progress -> "Import DKEK share"

  * Choose DKEK share file location

  * Password for DKEK share

* Right-click "SmartCard-HSM" -> "Import from PKCS#12"

  * Enter number of shares -> 1

  * Enter file location of DKEK share 

  * Enter Password for DKEK share

  * Select PKCS#12 container for import (Enter password, if set)
  
  * Select Key
  
  * Select Name to be used (This is the Label used for the key on the device)
  
  * Import more keys, if needed

Once this is done, you can check that the keys have been successfully imported using:


.. code-block:: bash

   pkcs15-tool -D

In the resulting output you will find the imported keys labeled by the name you chose previously.


.. _this thread: https://support.nitrokey.com/t/initialization-and-using-dkek/1973
.. _this blog post: https://www.smartcard-hsm.com/2014/09/25/Desaster_Recovery_for_your_SmartCard-HSM.html
.. _Smart Card Shell: https://www.openscdp.org/scsh3/download.html


