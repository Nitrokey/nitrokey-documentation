TLS Client Authentication with Internet Information Services (IIS)
------------------------------------------------------------------

.. product-table:: nk3

This guide describes the configuration of Windows Internet Information Services (IIS) for TLS client authentication that maps users to local user accounts.

It shows the configuration as an example with the *Default Web Site* of IIS.
The configuration can also be used for other sites, including or excluding the default site.

Prerequisits
============

- Nitrokey 3 with PIV client authentication certificate.
- Windows Server (web server)

  - DNS record
  - TLS certificate for the DNS record.
    Client computers must trust this TLS certificate.

Installation
============

1. Open the *Server Manager*.
2. In the menubar on the top click **Manage → Add Roles and Features**.
3. Follow the wizard to the step **Server Roles**.
4. Select the role **Web Server (IIS)** from the list of available roles.
5. Follow the wizard to the step **Roles Services** under **Web Server Role (IIS)**.
6. From the list of role services select **Web Server → Security → IIS Client Certificate Mapping Authentication**.
7. Follow the wizard to the installation.
   Installation must be finished before you can start configuring it.

Configuration
=============

1. Open the *Internet Information Services (IIS) Manager* (``InetMgr.exe``).
2. Select and expand the web server you want to configure in the **Connections** tree view on the left.
3. From the middle pane open **Configuration Editor**.
   Open the section ``system.webServer/security/authentication/iisClientCertificateMappingAuthentication`` and unlock it with a click on **Unlock Section** in the **Actions** pane on the right.
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
   The **IIS Client Certificate Mapping Authentication** will be never visible in this list.
   Navigate back to the root of the site.

   .. important::
      If any other type of authentication is enabled, the client certificate mapping will not work.

9. From the middle pane open **Configuration Editor**.
   Open the section ``system.webServer/security/authentication/iisClientCertificateMappingAuthentication`` from ``ApplicationHost.config <location path='Default web site'/>``.
   Set the key ``enabled`` to ``True`` and make sure that one or both of the keys ``manyToOneCertificateMappingsEnabled`` and ``oneToOneCertificateMappingsEnabled`` are enabled.
10. The user mappings must be written to the keys ``manyToOneMappings`` or ``oneToOneMappings``.
    The respective key to use depends on desired mapping to be used.
    You can find information about the mapping and more detailed configuration explanations on `Microsoft Learn <https://learn.microsoft.com/en-us/iis/configuration/system.webserver/security/authentication/iisclientcertificatemappingauthentication/>`__.

    To change a key, click on the **...** button at the end of the value text field.
    This will open the *Collection Editor*.
    For creating a new mapping click on **Add** in the **Actions** pane on the right.

    A. **Many to One mapping**

       Fill in the fields as shown in the table below.

       +--------------------+-------------------------------+
       | Key                | Value                         |
       +====================+===============================+
       | ``enabled``        | ``True``                      |
       +--------------------+-------------------------------+
       | ``name``           | ``<name-for-the-collection>`` |
       +--------------------+-------------------------------+
       | ``password``       | ``<user-password>``           |
       +--------------------+-------------------------------+
       | ``permissionMode`` | ``Allow``                     |
       +--------------------+-------------------------------+
       | ``userName``       | ``<username>``                |
       +--------------------+-------------------------------+

       The ``name`` field is used as an identifier of the collection and the ``userName`` and ``password`` require the username and password of the local user you want to map to.
       The ``rules`` field must contain the description of allowed or denied certificates.
       To change the rules key, click on the **...** button at the end of the value text field.
       This will open a new window of the *Collection Editor*.
       For creating new rule, click on **Add** in the **Actions** pane on the right.

       Fill in the fields as shown in the table below.

       +--------------------------+--------------------------------------------------------+
       | Key                      | Value                                                  |
       +==========================+========================================================+
       | ``certificateField``     | ``Subject``                                            |
       +--------------------------+--------------------------------------------------------+
       | ``certificateSubField``  | ``O``                                                  |
       +--------------------------+--------------------------------------------------------+
       | ``compareCaseSensitive`` | ``True``                                               |
       +--------------------------+--------------------------------------------------------+
       | ``matchCriteria``        | ``<criteria-value-of-o-field-in-certificate-subject>`` |
       +--------------------------+--------------------------------------------------------+

       Close the *Collection Editor* windows.
       
    B. **One to One mapping**

       Fill in the fields as in the tablebelow.
       
       +-----------------+----------------------------------+
       | Key             | Value                            |
       +=================+==================================+
       | ``certificate`` | ``<base64-encoded-certificate>`` |
       +-----------------+----------------------------------+
       | ``enabled``     | ``True``                         |
       +-----------------+----------------------------------+
       | ``password``    | ``<user-password>``              |
       +-----------------+----------------------------------+
       | ``userName``    | ``<username>``                   |
       +-----------------+----------------------------------+

       The Base64 encoded certificate for the ``certificate`` field can be obtained from the Nitrokey with `Nitropy <../../../../software/nitropy/index.html>`__ and the command ``nitropy nk3 piv --experimental read-certificate --format PEM --key 9A``.
       The fields ``userName`` and ``password`` require the username and password of the local user you want to map to.

       Close the *Collection Editor* window.

    Confirm the configuration with a click on **Apply** in the **Actions** pane on the right.

The site is now configured for TLS client authentication using local user account mapping.

