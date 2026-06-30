Windows Active Directory Certificate Services (ADCS) with PKI Proxy
-------------------------------------------------------------------

This document describes the configuration of Windows Active Directory Certificate Services (ADCS) with PKI Proxy and NetHSM.

Prerequisites
=============

* NetHSM

  * Provisioned
  * Administrative access

* PKI Proxy server

  * NetHSM PKCS#11 module installed and configured to use the NetHSM

* CA server (Windows Server)

  * ADCS role installed, but not configured
  * PKI Proxy client tools installed
  * Client tools are not required if this server is also running the PKI Proxy server, as it includes the client tools.
  * Pynitrokey installed

Root CA Key and Certificate
===========================

The following table lists the key algorithms and key lengths, together with the hash algorithms the Windows ADCS can use with NetHSM.

+---------------+------------+---------------------------------------------+
| Key Algorithm | Key Length | Hash Algorithm                              |
+---------------+------------+---------------------------------------------+
| RSA           | 1024       | MD2, MD4, MD5, SHA1, SHA256, SHA384, SHA512 |
|               +------------+---------------------------------------------+
|               | 2048       | MD2, MD4, MD5, SHA1, SHA256, SHA384, SHA512 |
|               +------------+---------------------------------------------+
|               | 4096       | MD2, MD4, MD5, SHA1, SHA256, SHA384, SHA512 |
+---------------+------------+---------------------------------------------+
| ECDSA         | P256       | SHA1, SHA256, SHA385, SHA512                |
|               +------------+---------------------------------------------+
|               | P384       | SHA1, SHA256, SHA385, SHA512                |
|               +------------+---------------------------------------------+
|               | P521       | SHA1, SHA256, SHA385, SHA512                |
+---------------+------------+---------------------------------------------+

.. important::
   Please follow the best practices for selecting a secure key algorithm, length, and hash algorithm.

A key and certificate can be either newly generated or an existing one can be migrated.
Please refer to the sub-chapters below to learn more about the approach for your specific situation.

Generate a new Root CA Key and Certificate on Windows
+++++++++++++++++++++++++++++++++++++++++++++++++++++

The following instructions create a new key and certificate for use in a *Root CA* in ADCS.

.. tip::
   It is usually easier to generate a key and certificate with the ADCS configuration wizard and then follow `Migrate existing Key and Certificate <pkiproxy-windows-ca.html#migrate-existing-key-and-certificate>`__.

In this case, a request template is used to generate a key with explicit CA extensions.
The specific values need to be adjusted to your environment.

The request template needs to be saved to a file with the name ``RootCA.inf`` and the content as follows.

.. tabs::
   .. tab:: RSA

      This template will generate an RSA key with a key length of 4096 bits.
      You need to replace ``<CA-NAME>`` with the name of your CA.

      .. code-block:: ini

         [Version]
         Signature="$Windows NT$"

         [NewRequest]
         Subject = "CN=<CA-NAME>"
         KeySpec = 1
         KeyLength = 4096
         Exportable = TRUE
         MachineKeySet = TRUE
         SMIME = FALSE
         PrivateKeyArchive = FALSE
         UserProtected = FALSE
         UseExistingKeySet = FALSE
         ProviderName = "Microsoft Software Key Storage Provider"
         ProviderType = 0
         RequestType = Cert
         KeyUsage = 0x86

         [Extensions]
         ; Key Usage: keyCertSign (0x04) + cRLSign (0x02) => 0x06
         2.5.29.15 = "{critical}86"

         ; Basic Constraints: CA = TRUE, path length optional
         2.5.29.19 = "{critical}{text}CA=TRUE"

         ; CA Version (V0.0)
         1.3.6.1.4.1.311.21.1 = "{hex}02 01 00"

         [RequestAttributes]
         ; Empty for self-signed request

Generate the key and certificate from the certificate template.

.. code-block:: pwsh-session

   certreq -new RootCA.inf RootCA.req

The certificate has been added to the local machine certificate store.
Export the certificate to a PFX file, replacing ``<THUMBPRINT>`` with the respective value from the output of the previous command.

.. code-block:: pwsh-session

   $password = Read-Host -AsSecureString "Password"
   Export-PfxCertificate -Cert Cert:\LocalMachine\My\<THUMBPRINT> -FilePath RootCA.pfx -Password $password

The password value is used to encrypt the PKCS#12 archive (PFX file).
You can continue with the chapter `NetHSM Configuration <pkiproxy-windows-ca.html#nethsm-configuration>`__.

Migrate existing Key and Certificate
++++++++++++++++++++++++++++++++++++

To migrate an existing key and certificate, they must be exported from the certificate store on the ADCS, and the resulting archive imported to the NetHSM.

.. important::
   Before you make changes to a production certificate authority, it's recommended to create a backup of it.
   Please refer to `this <https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/component-updates/ca-backup-and-restore-windows-powershell-cmdlets>`__ page to learn more.

1. Open ``certlm.msc``.
2. Navigate to **Certificates - Local Computer → Personal → Certificates**.
3. Select the certificate in the list on the right.
4. In the menubar on the top, navigate to **Action → All Tasks → Export...**.
   This will start the *Certificate Export Wizard*.
5. Confirm the introduction of the assistant with **Next**.
6. Check the radio button next to **Yes, export the private key** and confirm with **Next**.
   If the radio button is not available, the key is marked as non-exportable.
   In this case, this guide is not applicable for the intended use case.
7. Include all certificates in the certification path if possible
8. Check the radio button next to **Yes, export the private key** and confirm with **Next**.
9. Check the radio button next to **Personal Information Exchange - PKCS #12 (.PFX)**.
   Ensure you check the following options:

   * Include all certificates in the certification path if possible
   * Export all extended properties
   * Enable certificate privacy

   Confirm the selection with **Next**.
10. Check the radio button next to **Password**.
    Enter a password in the password text fields.
    From the dropdown next to **Encryption**, choose **AES256-SHA256**.

    .. important::
       The encryption method *AES256-SHA256* is only supported from Windows Server 2019 and Windows 11.
       For usage on older versions keep the default *TripleDES-SHA1*.

    Confirm the selection with **Next**.
11. Choose a storage location and file name and confirm with **Next**.

    .. important::
       The exported key and certificate should be stored in a safe location, where only authorized users can access it.

12. Confirm the export with **Finish**.
13. Make sure the certificate is still selected in the list on the right.
14. In the menubar on the top, navigate to **Action → All Tasks → Delete**.
    Confirm the deletion of the private key and certificate with **Yes**.

You can continue with the chapter `NetHSM Configuration <pkiproxy-windows-ca.html#nethsm-configuration>`__.

NetHSM Configuration
====================

The key and certificate from the previous chapter need to be imported to the NetHSM.
With `nitropy <../software/nitropy/index.html>`__ we can import the PKCS#12 archive directly to the NetHSM.

Import the PKCS#12 archive as follows, while replacing ``<KEY-ID>``, ``<MECHANISM>`` and ``<PKCS12-ARCHIVE>`` with the respective values.

.. code:: pwsh-session

   nitropy nethsm import-pkcs12 -k <KEY-ID> -m <MECHANISM> -p <password> <PKCS12-ARCHIVE>

For RSA keys, the mechanism must be ``rsa_signature_pkcs1`` and for ECDSA keys, ``ecdsa_signature``.

You can now verify that the certificate is available on the NetHSM.

.. code:: pwsh

   nitropy nethsm list-keys

The key will be listed with the given key ID from the previous command.

PKI Proxy Server Configuration
==============================

On the PKI Proxy Server, you must share the just added certificate from the NetHSM.
Please follow the steps in `Publish Certificates from the NetHSM <pkiproxy.html#publish-certificates-from-the-nethsm>`__ to learn more.

Windows ADCS Configuration
==========================

PKI Proxy Client Tools Configuration
++++++++++++++++++++++++++++++++++++

In the following, we make the key and certificate available in the Windows local machine certificate store.

1. Open the **PKI Proxy Certificate Manager**.
2. Click the **Add...** button.
3. Fill the required fields.

   * Location, e.g., ``https://localhost:9266``
   * Authentication
   * User
   * Secret Key/Password/SPN
   * Certificate Store: ``LOCALMACHINE\My``

   Confirm the configuration with the **OK** button.
   This will bring you back to the previous window.
4. The list under **Certificate Management** in the **PKI Proxy Certificate Manager** should now show the just added certificate.

You can now verify that the certificate is available in the local machine certificate store.

1. Open the **Run** dialog, either by right clicking on the Windows **Start Menu** and choosing **Run** or pressing **Windows Key + R** on your keyboard.
2. In the **Run** dialog, enter ``certlm.msc`` and confirm by pressing **Enter** on your keyboard or by clicking **OK**.
3. In the appearing certificate manager, navigate in the tree structure on the left to **Certificates - Local Computer → Personal → Certificates**.
4. The published certificate is now listed on the right.

Windows ADCS Configuration
++++++++++++++++++++++++++

1. Open the **Server Manager** from the **Start menu** or by pressing **Windows Key + R** on your keyboard and enter ``ServerManager.exe``.
2. In the menu bar on the top right, click on the flag icon and choose **Configure Active Directory Certificate Services on the destination server** from the post-deployment notifications.
   This will start the *AD CS Configuration* wizard.
3. In the wizard, set the settings below according to the stage.

   * Role Services

     Check the radio button next to **Certification Authority**.
   * Setup Type

     Select **Enterprise CA** or **Standalone CA** depending on your environment.
   * CA Type

     Select **Root CA**
   * Private Key

     Check the radio button next to **Use existing private key**.
     Under this option, check the radio button next to **Select a certificate and use its associated private keys**.

     * Existing Certificate

       In the list of **Certificates** select the certificate you want to use.
       Make sure the checkbox next to **Allow administrator interaction when the private key is accessed by the CA.** is not activated.
       This isn't necessary as the PKI Proxy KSP doesn't require any additional authentication for using the private key.

4. After the configuration wizard has finished, open the **Certification Authority** from the **Start menu** or by pressing **Windows Key + R** on your keyboard and entering ``certsrv.msc``.
   You can verify that the certificate authority service started correctly when you see a green dot with a white checkmark icon on the name of the certification authority.

.. important::
   The availability of the certification authority depends on the availability of the private key and certificate.
   If they aren't available, the certification authority service might fail to start or will stop unexpectedly.
   In case of an error, check the *Windows Event Log* for more information.
   