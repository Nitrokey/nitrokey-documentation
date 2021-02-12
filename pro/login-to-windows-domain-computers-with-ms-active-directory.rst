Login to Windows Domain Computers With MS Active Directory
==========================================================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

1. Download and install the latest
   `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__.
2. Use a text editor to add the following settings to
   *C:\Program Files:\OpenSC Project\OpenSC\opensc.conf*.

.. code-block:: bash

   # Nitrokey Pro, OpenPGP Card
   card_atr 3B:DA:18:FF:81:B1:FE:75:1F:03:00:31:C5:73:C0:01:40:00:90:00:0C {
       type = 9002;
       driver = "openpgp";
       # name = "Nitrokey Pro";
       md_read_only = false;
       md_supports_X509_enrollment = true;
   }
        
   # Nitrokey HSM, SmartCard-HSM
   card_atr 3B:FE:18:00:00:81:31:FE:45:80:31:81:54:48:53:4D:31:73:80:21:40:81:07:FA {
       type = 26000;
       driver = "sc-hsm";
       # name = "Nitrokey HSM";
       md_read_only = false;
       md_supports_X509_enrollment = true;
   }

3. Open a command terminal and enter “regedit”. Use regedit to import
   `this
   file <https://www.nitrokey.com/sites/default/files/nk-hsm.reg>`__.
4. Now you can enroll Nitrokeys for your users managed in Microsoft
   Active Directory. You may either use Microsoft PKI,
   `gpgsm <https://www.gnupg.org/documentation/manuals/gnupg/Howto-Create-a-Server-Cert.html>`__,
   or `Smart
   Policy <http://www.mysmartlogon.com/products/smart-policy.html>`__.
   The following steps describe the usage of Smart Policy.
5. `Download <http://download.mysmartlogon.com/SmartPolicyv2/SmartPolicy%20-%20Stage%203.exe>`__
   and install Smart Policy.
6. Select “Read a smart card”

.. figure:: /pro/images/login-to-windows-domain-computers-with-ms-active-directory/1.png
   :alt: img1



7. Select the certificate, mapping, and user.

.. figure:: /pro/images/login-to-windows-domain-computers-with-ms-active-directory/2.png
   :alt: img2



8. Verify the device status via CRL.

.. figure:: /pro/images/login-to-windows-domain-computers-with-ms-active-directory/3.png
   :alt: img3



9. Choose a Group Policy Object (GPO).

.. figure:: /pro/images/login-to-windows-domain-computers-with-ms-active-directory/4.png
   :alt: img4



10. Confirm applying the mapping.

.. figure:: /pro/images/login-to-windows-domain-computers-with-ms-active-directory/5.png
   :alt: img5



From now on, when logging on to your Windows computer you need to connect the Nitrokey and enter your PIN.

.. figure:: /pro/images/login-to-windows-domain-computers-with-ms-active-directory/6.png
   :alt: img6


