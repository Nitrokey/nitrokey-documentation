Windows KSP and PKCS#11 with PKI Proxy
--------------------------------------

This document explains the usage of PKI Proxy with HSM 2.
PKI Proxy enables the usage of HSM 2 through the native Microsoft Windows APIs.
For this purpose, PKI Proxy includes a KSP (Key Storage Provider) that enables its use via the CNG (Cryptography API: Next Generation) interface.
Additionally it provides PKCS#11 access to the HSM 2, but this should only be used if your setup requires it for example if you need the additional authentication features of PKI Proxy, or if you need to access it from a remote machine running an application that only supports PKCS#11.
In all other cases use the PKCS#11 driver from the `OpenSC project <https://github.com/OpenSC/OpenSC>`__ directly.

The deployment of HSM 2 with PKI Proxy looks like this.

.. figure:: ./images/hsm2-pki-proxy.svg
   :scale: 100
   :alt: Connection between HSM 2 and PKI Proxy Server, Client and exposed client interfaces.

The HSM 2 is connected via its USB interface to the PKI Proxy server.
PKI Proxy uses the OpenSC PKCS#11 driver to connect to the HSM 2 and access its keys and certificates.
Clients to the PKI Proxy use the REST API of the PKI Proxy server to access the keys and certificates.
Applications on the client can either use the native Windows API or a PKCS#11 driver.
PKI Proxy server and client can be executed on the same computer.

Possible use cases of this setup are:

* Code signing
* Document signing

.. tip::
   Please also refer to the official `PKI Proxy documentation <https://cdn.nsoftware.com/help/PK1/app/default.htm>`__ for more information.

Prerequisites
=============

* HSM 2

  * Initialized
  * Provisioned with keys and certificates

* Windows machine

  * OpenSC PKCS#11 driver installed (only required on the PKI Proxy Server).

PKI Proxy - Server
==================

The PKI Proxy server shares the keys and certificates from a HSM 2 for different users.

Installation
~~~~~~~~~~~~

1. Download the *PKI Proxy 2024* installer from the `/n software website <https://www.nsoftware.com/pkiproxy/download>`__.
2. Open the installer and follow the installation wizard.
3. Open PKI Proxy from the Start menu.
   If you installed it to the default location you can also run it with the following command from the *Run* dialog or the PowerShell.

   .. code-block:: shell-session

      C:\Program Files\PKI Proxy 2024\PKIProxy.exe

   .. note::
      PKI Proxy will minimize to the system tray, even if the main window is closed.

Service Configuration
~~~~~~~~~~~~~~~~~~~~~

The instructions below configure the PKI Proxy.

1. Open the PKI Proxy main window.
2. Change to the **Settings** tab.
3. Make sure the checkbox **Enable TLS** is checked and an appropriate certificate is used.
4. Change to the **Users** tab.
5. Create a new user by clicking on the **New...** button.
   Choose an authentication type which is supported by all clients.
6. In the menu bar of main window click the **Start** button to start the PKI Proxy service.

Publish Certificates from the HSM 2
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the following we configure which certificates from the HSM 2 are made available through PKI Proxy.

1. Make sure the PKI Proxy main window is open.
2. Change to the **Certificates** tab.
3. Click on the **New...** button.
   This will open the **Share Certificate** window.
4. Click on the **Select Certificate or Key...** button, in the **Certificate** frame of the window.
   This will open the **Select a Private Key** window.
5. Change to the **Security Key** tab.
6. Click the **Browse...** button and select the OpenSC PKCS#11 driver library file.
   The text field **PKCS#11 Library** now shows the path to the library file.
7. From the dropdown menu **Security Key (PKCS#11)** choose the slot which contains the certificate.
   The listed slots depend on your configuration of the HSM 2.
8. In the text field **PIN**, enter the PIN for your HSM 2.
9. Click the **Open** button.
10. The text list below **Certificates** now shows a list of the available certificates and generic keys on the HSM 2.
    Select the certificate or generic key you want to share with PKI Proxy.
11. Click on the **OK** button to confirm the selection.
    This will bring you back to the **Share Certificate** window.
    The window will now show the details of the selected certificate.
12. Click on the **Add...** button, in the **Access and Permissions** frame of the window.
    This will open the **Select user** window.
13. Select an existing user from the dropdown menu, or create a new one by choosing **Create New User...**.
    Click on the **OK** button to confirm the selection.
    If you choose to create a new user the **New User** window will be shown afterwards.
14. Back in the **Share Certificate** window make also sure to only allow the required operations for the certificate or generic key.
    This can be changed with the checkboxes at the bottom of the **Access and Permissions** frame.
15. Click on the **OK** button to publish the certificate.
    This will bring you back to the main window of PKI Proxy.
16. The text list below **Certificate Management** now shows the published certificate.

PKI Proxy - Client
==================

The PKI Proxy client tools provide different ways to access the shared keys and certificates from a PKI Proxy server.

.. tip::
   The PKI Proxy server contains the client tools.
   Hence, the machine which runs the server can also be a client to itself.

Installation
~~~~~~~~~~~~

1. Download the *PKI Proxy 2024 - Client Tools* from the `/n software website <https://www.nsoftware.com/pkiproxy/download>`__.
2. Open the installer and follow the installation wizard.

KSP (Key Storage Provider)
~~~~~~~~~~~~~~~~~~~~~~~~~~

PKI Proxy provides a KSP to interface with the PKI Proxy server.
The KSP enables the use of native Windows APIs with applications, through the CNG (Cryptography API: Next Generation) interface.
Please refer to the `PKI Proxy documentation <https://cdn.nsoftware.com/help/PK1/app/nsoftware.PKIProxy.htm#pg_runningksp>`__ for more information.

PKCS#11
~~~~~~~

PKI Proxy provides a PKCS#11 module to interface with the PKI Proxy server.
Please refer to the `PKI Proxy documentation <https://cdn.nsoftware.com/help/PK1/app/nsoftware.PKIProxy.htm#pg_runningpkcs11>`__ for more information.
