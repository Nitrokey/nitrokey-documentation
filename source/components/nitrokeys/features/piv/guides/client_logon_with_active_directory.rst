Client Logon with Active Directory
==================================

.. product-table:: nk3

This document explains how to use the PIV application of a Nitrokey 3 for smartcard logon with Active Directory. It is available as of firmware version 1.8 and higher.

In the future, this manual provisioning may be automated through a Windows MiniDriver.

Prerequisites
-------------

The setup requires administrative access to the machines running Active Directory Directory Services (ADDS) and Active Directory Certificate Services (ADCS).
On the client machine only access to the respective user account used for logon is required.

* Windows server (supported versions are Windows Server 2016, 2019, 2022 in all editions)
   * ADDS role installed and configured.
   * ADCS role installed and *Enterprise-CA* with root certificate configured.
      * Each Domain Controller (DC) must have a *Domain Controller*, *Domain Controller Authentication*, and *Kerberos Authentication* certificate issued.
      * If you have clients leaving the company network, make sure the published full and delta certificate revocation lists (CRL) are retrievable from external networks.
* Windows client (supported versions are Windows 10, 11 in editions *Professional* and *Enterprise*)
   * Client must be a domain member of the Active Directory (AD) domain.
* Nitrokey 3 with PIV application.

Configure smartcard logon for use with Active Directory (AD)
------------------------------------------------------------

The smartcard logon requires a certificate template in the certificate authority (CA) of the the domain.
This template defines the values and constraints of the user certificates.
It is used to sign the Certificate Request (CSR) during provisioning of the Nitrokey.

1. Signing a certificate request for smartcard logon requires to create a certificate template in the certificate authority.

   .. tabs::
      .. tab:: MMC
         1. From the Command Line, PowerShell, or Run, type ``certtmpl.msc`` and press Enter.
         2. In the detail pane select the template **Smartcard Logon**.
         3. In the menu bar click **Actions → All Tasks → Duplicate Template**.
         4. Set the settings below on the template, according to the mentioned tab.

            **Compatibility**
               * Disable **Show resulting changes**
               * Set **Certificate Authority** and **Certificate recipient** to the oldest clients in the domain which are supposed to use smartcard logon.

                  .. important::
                     If you want to use Elliptic Curve (EC) keys your clients must be not older than Windows Server 2008 and Windows Vista.

            **General**
               * Set a **Template display name**.
               * Set the **Validity period** and **Renewal period**.

            **Request handling**
               * Set a purpose of **Signature and smartcard logon**.

            **Cryptography**
               * Set a provider category of **Key Storage Provider**.
               * Set a algorithm name and minimum key size.

                  .. important::
                     Microsoft recommends to use the RSA algorithm with a key length of ``2048`` Bit.
                     If you choose to use Eliptic Curve (EC) keys you need to make additional changes on your client computers.

            **Subject Name**
               * Set **Supply in the request**.
         5. Confirm the template creation with **OK**.

2. After the creation of a certificate template, the template must be issued to be used by the clients.

   .. tabs::
      .. tab:: MMC
         1. From the Command Line, PowerShell, or Run, type ``certmgr.msc`` and press Enter.
         2. In the navigation pane expand the Certificate Authority (CA) and navigate to **Certificate Templates**.
         3. In the menu bar click **Action → New → Certificate Template to Issue**.
         4. Select the certificate template you want to issue and confirm with **OK**.


Provision Nitrokey 3 for smartcard logon with Active Directory
--------------------------------------------------------------

The smartcard logon requires to provision a Nitrokey for an user in Active Directory.
The provisiong contains the private key and Certificate Singing Request (CSR) generation.
The certificate is then written to the Nitrokey.

.. warning::
   Before following the steps below make sure the Active Directory user account you want to use for smartcard logon exists.
   A creation time of the certificate before the creation time of the user account will lead to a failed logon.

.. important::
   If the PIV application on the Nitrokey was not used before, perform a initialization with ``nitropy nk3 piv --experimental init`` first.

1. Generate a private key and write the CSR to file with the command below.

   ::

      nitropy nk3 piv --experimental generate-key --key 9A --algo <algorithm> --subject-name <subject-name> --subject-alt-name-upn <subject-alternative-name> --path <file>

   The value of ``<algorithm>`` is the used algorithm with its key length, e.g. ``rsa2048``.
   The value of ``<subject-name>`` corresponds to the value of the ``distinguishedName`` attribute of the Active Directory user account.
   In most cases it is only necessary to include the common name part of the distinguished name, e.g. ``CN=John Doe``.
   The value of ``<subject-alternative-name>`` corresponds to the value of the ``userPrincipalName`` attribute of the Active Directory user account.

2. Sign the CSR with the certificate authority (CA) of the domain with the command below.

   ::

      certreq -attrib CertificateTemplate:<template-name> -submit <file>
   
   The value of ``<template-name>`` is the name of the certificate template for smartcard logon.
   The value of ``<file>`` is the certificate singing request file.

3. Write the signed certificate to the Nitrokey with the command below.

   ::

      nitropy nk3 piv --experimental write-certificate --key 9A --format PEM --path <file>

   The value of ``<file>`` is the certificate file.

4. Map the certificate with the Active Directory user account.
   Create the certificate mappings with the command below.

   ::

      nitropy nk3 piv --experimental get-windows-auth-mapping

   Choose one of the offered certificate mappings.

   .. tip::
      Microsoft recommends the use of the ``X509IssuerSerialNumber`` mapping.

   Write the choosen mapping to the ``altSecurityIdentities`` attribute of the Active Directory user object.
   You can use the *Active Directory Users and Computers* application or PowerShell for this operation.

   .. tabs::
      .. tab:: Active Directory Users and Computers
         1. From the Command Line, PowerShell, or Run, type ``dsa.msc`` and press Enter.
         2. In the menu bar click **View → Advanced Features**.
         3. Select the respective user object.
         4. In the menu bar click **Action → Properties**.
         5. Open the tab **Attribute Editor**.
         6. Select the attribute ``altSecurityIdentities``.
         7. Click on **Edit**.
         8. Insert the certificate mapping in the text field and click **Add**.
         9. Apply the change with a click on **OK**.

      .. tab:: PowerShell
         1. Open PowerShell.
         2. Add the value with ``Set-ADUser -Identity "<sAMAccountName>" -Add @{altSecurityIdentities="<certificate-mapping>"}``, replacing ``<sAMAccountName>`` with the value of the user logon name and ``<certificate-mapping>`` with the choosen certficate mapping from above.

   .. important::
      If the certificate mapping is not correctly set you will receive the error message ``Logon screen message: Your credentials could not be verified.`` when attempting to logon.
      Additionally, you will see the event message below in the Windows system event log.

      **Source**

      ::

         Kerberos-Key-Distribution-Center

      **Message**

      ::

         The Key Distribution Center (KDC) encountered a user certificate that was valid but could not be mapped to a user in a secure way (such as via explicit mapping, key trust mapping, or a SID). Such certificates should either be replaced or mapped directly to the user via explicit mapping. See https://go.microsoft.com/fwlink/?linkid=2189925 to learn more.

Revoke smartcard logon for use with Active Directory (AD)
---------------------------------------------------------

The issued user logon certificates are listed in the Active Directory Certificate Services (ADCS).
From ADCS the certificates can be revoked, which adds them to the configured Certificate Revocation List (CRL).
This is required in case of a lost or broken Nitrokey.

.. important::
   It is strongly advised to never leave unused user certificates without revoking them.

.. note::
   It is possible to temporarily revoke a certificate with the reason *Certificate Hold*.
   This revocation can be reverted and is hence not permanent.

.. tabs::
   .. tab:: MMC (certsrv.msc)
      1. From the Command Line, PowerShell, or Run, type ``certsrv.msc`` and press Enter.
      2. In the navigation pane expand the certificate authority (CA) and navigate to **Issued Certificates**.
      3. In the detail pane select the user certificate you want to revoke.
      4. In the menu bar click **Action → All Tasks → Revoke Certificate**.
      5. Specifiy a reason for the revocation, date and time, and confirm with **Yes**.
      6. In the navigation pane navigate to **Revoked Certificates**.
      7. In the menu bar click **Action → All Tasks → Publish**.
      8. Select the revocation list you want to publish and confirm with **OK**.

.. note::
   During each smartcard logon attempt Windows checks if the certificate presented by the smartcard is listed on a Certificate Revocation List (CRL).
   If the certificate is found on a CRL the logon is denied.
   Each CRL contains a validity to make them expire.
   Windows caches the fetched CRL and updates them if the CRL is about to expire.
   Hence a revocation is not immediate and depends on the expiration of the CRL the client has.


Import a user smartcard certificate to the personal certificate store
---------------------------------------------------------------------

The user certificate which is stored on the Nitrokey can be imported to the user's personal certificate store.
In certain situations this is a required procedure.

.. tabs::
   .. tab:: MMC (certmgr.msc)
      1. Make sure you are logged on to the user account the certificate corresponds to.
      2. From the Command Line, PowerShell, or Run, type ``certsrv.msc`` and press Enter.
      3. In the navigation pane expand the **Personal** key store and navigate to **Certificates**.
      4. In the menu bar click **Action → All Tasks → Import**.
      5. Follow the import wizard and provide the user certificate file when requested.
      6. After the import completed check the detail pane for the imported certificate.
         If the Nitrokey is connected, the properties of the certificate should show the message *You have a private key that corresponds to this certificate.* indicating that the private on the Nitrokey could be identified.

   .. tab:: PowerShell
      1. Make sure you are logged on to the user account the certificate corresponds to.
      2. Open PowerShell.
      3. Import the certificate with ``Import-Certificate -CertStoreLocation Cert:\CurrentUser\My -FilePath <path>``, replacing ``<file>`` with the certificate file path.
      4. After the import completed check for the certificate with ``Get-ChildItem Cert:\CurrentUser\My``.
