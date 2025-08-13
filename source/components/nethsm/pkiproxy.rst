PKI Proxy
---------

This document explains the usage of PKI Proxy with NetHSM.
PKI Proxy enables the usage of NetHSM with the Microsoft Windows CSP and KSP.
Additionally it provides PKCS#11 access to the NetHSM, but this can also be achieved with the NetHSM PKCS#11 driver alone.

The deployment of NetHSM with PKI Proxy looks like this.

NetHSM -- PKI Proxy -- Client (CSP, KSP, PKCS11)

The NetHSM provides the REST API which is used by NetHSM PKCS#11 driver.
PKI Proxy uses this driver to connect to the NetHSM and access its keys and certificates.
Clients to the PKI Proxy use either a CSP or KSP to access the keys and certificates through native Windows APIs or a PKCS#11 driver.
The communication between the NetHSM and PKI Proxy, and PKI Proxy and the clients is encrypted.

Prerequisits
============

- NetHSM (hardware or containerized)
  - Provisioned
  - IP address of the NetHSM must be known, and the HTTPS port must be reachable.
- Windows machine
  - Nitrokey NetHSM PKCS#11 driver installed and configured.

Installation
============

1. Download PKI Proxy installer from the `nsoftware website <https://www.nsoftware.com/pkiproxy/download>`__.
2. Open the installer and follow the installation wizard.

Configuration
=============

Open PKI Proxy by opening it from the Start Menu.
If you installed it to the default location you can also run it with the following command from the Run dialog or the PowerShell.
   
.. code-block:: shell-session

   C:\Program Files\PKI Proxy 2024\PKIProxy.exe

.. tip::
   PKI Proxy will minimize to the system tray, even if the main window is closed.

PKI Proxy
~~~~~~~~~

The instructions below configure the PKI Proxy.

1. Make sure the PKI Proxy main window is open.
2. Change to the **Settings** tab.
3. TODO TLS configuration
4. TODO User configuration
5. In the menu bar of main window click the *Start* button to start the PKI Proxy service.

Publish certificates from the NetHSM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the following we configure which certificates from the NetHSM are made available through PKI Proxy.

1. Make sure the PKI Proxy main window is open.
2. Change to the **Certificates** tab.
3. Click on the **New...** button.
   This will open the **Share Certificate** window.
4. Click on the **Select Certificate** button.
   This will open the **Select a Private Key** window.
5. Change to the **Security Key** tab.
6. Click the **Browse..** button and select the NetHSM PKCS#11 driver library file.
   The text field **PKCS#11 Library** now shows the path to the library file.
7. From the dropdown menu **Security Key (PKCS#11)** choose the slot which contains the certificate.
   The listed slots depend on your configuration of the PKCS#11 module.
8. Click the **Open** button.
9. The text list below **Certificates** now shows a list of the available certificates on the NetHSM.
   Select the certificate you want to use with PKI Proxy.
10. Click on the **OK** button to confirm the selection.
    This will bring you back to the **Share Certificate** window.
    The window will now show the details of the selected certificate.
11. TODO There are more options one can make. Decide how detailed we want to go in this document. User configuration is necessary for access to the certificate!
12. Click on the **OK** button to publish the certificate.
    This will bring you back to the main window of PKI Proxy.
13. The text list below **Certificate Management** now shows the published certificate.

