Windows KSP and PKCS#11 with PKI Proxy
--------------------------------------

This document explains the usage of PKI Proxy with NetHSM.
PKI Proxy enables the usage of NetHSM through the native Microsoft Windows APIs.
For this purpose, PKI Proxy includes a KSP (Key Storage Provider) that enables its use via the CNG (Cryptography API: Next Generation) interface.
Additionally it provides PKCS#11 access to the NetHSM, but this should only be used if your setup requires it.
Possible requirements are that you need the additional authentication features of PKI Proxy, or you don't want to expose the NetHSM to clients directly, i.e. PKI Proxy acts as a gateway.
In all other cases use the `NetHSM PKCS#11 driver <pkcs11-setup.html>`__ directly.

The deployment of NetHSM with PKI Proxy looks like this.

.. figure:: ./images/nethsm-pki-proxy.svg
   :scale: 100
   :alt: Connection between NetHSM and PKI Proxy Server, Client and exposed client interfaces.

The NetHSM provides the REST API which is used by the NetHSM PKCS#11 driver.
PKI Proxy uses this driver to connect to the NetHSM and access its keys and certificates.
Clients to the PKI Proxy use the REST API of the PKI Proxy server to access the keys and certificates.
Applications on the client can either use the native Windows API or a PKCS#11 driver.
The communication between the NetHSM and PKI Proxy server and PKI Proxy clients is encrypted.

Possible use cases of this setup are:

- Code signing
- Document signing

.. tip::
   Please also refer to the official `PKI Proxy documentation <https://cdn.nsoftware.com/help/PK1/app/default.htm>`__ for more information.

Prerequisits
============

- NetHSM (hardware or containerized)
  - Provisioned
  - IP address of the NetHSM must be known, and the HTTPS port must be reachable.
- Windows machine
  - Nitrokey NetHSM PKCS#11 driver installed and configured (only required on the PKI Proxy Server).

.. important::
   On some machines the PKI Proxy Server can crash during the unload procedure of the NetHSM PKCS#11 module.
   This is a bug in a dependency of the module and tracked in `this <https://github.com/Nitrokey/nethsm-pkcs11/issues/327>`__ GitHub issue.
   If you encounter this bug, please set ``disable_thread_pool`` configuration option to ``true`` in your NetHSM PKCS#11 configuration file.
   Please refer to the `example configuration file <https://github.com/Nitrokey/nethsm-pkcs11/blob/main/p11nethsm.example.conf>`__ for a better understanding how to configure it.

PKI Proxy - Server
==================

The PKI Proxy server shares the keys and certificates from a NetHSM for different users.

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
3. Make sure the checkbox **Enable TLS** is checked and an apropriate certificate is used.
4. Change to the **Users** tab.
5. Create a new user by clicking on the **New...** button.
   Choose an authentication type which is supported by all clients.
6. In the menu bar of main window click the **Start** button to start the PKI Proxy service.

Publish Certificates from the NetHSM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the following we configure which certificates from the NetHSM are made available through PKI Proxy.

1. Make sure the PKI Proxy main window is open.
2. Change to the **Certificates** tab.
3. Click on the **New...** button.
   This will open the **Share Certificate** window.
4. Click on the **Select Certificate or Key...** button, in the **Certificate** frame of the window.
   This will open the **Select a Private Key** window.
5. Change to the **Security Key** tab.
6. Click the **Browse...** button and select the NetHSM PKCS#11 driver library file.
   The text field **PKCS#11 Library** now shows the path to the library file.
7. From the dropdown menu **Security Key (PKCS#11)** choose the slot which contains the certificate.
   The listed slots depend on your configuration of the PKCS#11 module.
8. Click the **Open** button.
9. The text list below **Certificates** now shows a list of the available certificates and generic keys on the NetHSM.
   Select the certificate or generic key you want to share with PKI Proxy.
10. Click on the **OK** button to confirm the selection.
    This will bring you back to the **Share Certificate** window.
    The window will now show the details of the selected certificate.

11. Click on the **Add...** button, in the **Access and Permissions** frame of the window.
    This will open the **Select user** window.
12. Select an existing user from the dropdown menu, or create a new one by choosing **Create New User...**.
    Click on the **OK** button to confirm the selection.
    If you choose to create a new user the **New User** window will be shown afterwards.
13. Back in the **Share Certificate** window make also sure to only allow the required operations for the certificate or generic key.
    This can be changed with the checkboxes at the bottom of the **Access and Permissions** frame.
14. Click on the **OK** button to publish the certificate.
    This will bring you back to the main window of PKI Proxy.
15. The text list below **Certificate Management** now shows the published certificate.

.. important::
   Make sure the mechanisms of the shared key on the NetHSM allow the intended usage in PKI Proxy.

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
