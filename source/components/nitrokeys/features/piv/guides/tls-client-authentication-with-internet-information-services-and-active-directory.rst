TLS Client Authentication with Windows Internet Information Services (IIS) and Active Directory
-----------------------------------------------------------------------------------------------

.. product-table:: nk3

This guide describes the configuration of Windows Internet Information Services (IIS) for TLS client authentication that maps users to Active Directory accounts.

It shows the configuration as an example with the *Default Web Site* of IIS.
The configuration can also be used for other sites, including or excluding the default site, but the configuration of TLS support is server-wide.

Prerequisits
============

- Successful setup of smart card client logon, refer to chapter `Client logon with Active Directory <client_logon_with_active_directory.html>`__.
  Users must have a valid authentication certificate on a Nitrokey.
- Windows Server (web server)

  - Joined to an Active Directory domain.
  - DNS record or hostname must be possible to resolve through DNS for the clients.
  - TLS certificate for the DNS record.
    Client computers must trust this TLS certificate.

Installation
============

1. Open the *Server Manager*.
2. In the menubar on the top click **Manage → Add Roles and Features**.
3. Follow the wizard to the step **Server Roles**.
4. Select the role **Web Server (IIS)** from the list of available roles.
5. Follow the wizard to the step **Roles Services** under **Web Server Role (IIS)**.
6. From the list of role services select **Web Server → Security → Client Certificate Mapping Authentication**.
7. Follow the wizard to the installation.
   Installation must be finished before you can start configuring it.
    
Configuration
=============

1. Open the *Internet Information Services (IIS) Manager* (``InetMgr.exe``).
2. Select and expand the web server you want to configure in the **Connections** tree view on the left.
3. From the middle pane open **Authentication**.
   Select **Active Directory Client Certificate Authentication** and enable it with a click on **Enable** in the **Actions** pane on the right.
4. Expand the **Sites** under the web server and select the site you want to configure.
5. In the **Actions** pane on the right click **Bindings...**.
6. Click **Add...** which brings up the bindings editor.
   Set the type to **https** and the hostname according to the DNS record and the TLS certificate's Subject Alternative Name (SAN) attribute.
   Activate the checkbox **Disable TLS 1.3 over TCP**.
   In the field **SSL certificate** select the respective certificate.
   Confirm the configuration with a click on **OK**.

   .. tip::
      To understand the requirement to disable TLS 1.3 and for a configuration instructions on how to use it with enabled TLS 1.3, refer to this `Microsoft Support blog post <https://techcommunity.microsoft.com/blog/iis-support-blog/windows-server-2022-iis-web-site-tls-1-3-does-not-work-with-client-certificate-a/4129738>`__.

7. From the middle pane open **SSL Settings**.
   Activate the checkbox **Require SSL** and the radio button under **Client certificates** is set to **Require**.
   Confirm the configuration with a click on **Apply** in the **Actions** pane on the right.
8. From the middle pane open **Authentication**.
   Make sure that all other authentication methods are deactivated for the site.
   The *Active Directory Client Certificate Authentication* will be never visible in this list.

   .. important::
      If any other type of authentication is enabled, the client certificate mapping won't work.

The site is now configured for TLS client authentication using Active Directory user account mapping.

