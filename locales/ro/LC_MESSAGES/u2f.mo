��    d      <              \     ]     y     �  3   �  7   �          9     R  	   r  5   |  G   �  �   �  ]   �  {   	     �	     �	     �	    �	  
   �
     �
            6   -  +   d  �   �  
   ,  �   7  b    �   q  �   :  A  �  �   (  �   �  �   <  �   �  N   �  i   #     �     �  �   �  �   Y     8     J     g     �  �   �  �   1  Z     �   w  D     )   R  �   |  �   >  P   �     :  �   F     2  )   ?  L   i  �   �  ;   C  ;     �   �  2   c  >   �    �  d   �   �   X!  �   �!  �  �"    Y$  Q   w%  �   �%  �   �&  �   j'  =  �'  �   0)  M   �)     D*     T*  /   t*  (   �*  :   �*     +  C   +  &   R+  �   y+  o   *,  �   �,  ~   *-  �   �-  -   8.  C  f.  1  �/  �   �0  �   �1    �2  }   �3  �   4  �  �4     �6     �6     �6  3   �6  7   (7     `7     z7     �7  	   �7  5   �7  G   �7  �   ;8  ]   �8  {   I9     �9     �9      :    :  
    ;     +;     I;     `;  6   n;  +   �;  �   �;  
   m<  �   x<  b  O=  �   �>  �   {?  A  '@  �   iB  �   �B  �   }C  �   8D  N   E  i   dE     �E     �E  �   �E  �   �F     yG     �G     �G     �G  �   �G  �   rH  Z   ]I  �   �I  D   NJ  )   �J  �   �J  �   K  P   *L     {L  �   �L     sM  )   �M  L   �M  �   �M  ;   �N  ;   �N  �   �N  2   �O  >   �O    P  d   4Q  �   �Q  �   <R  �  S    �T  Q   �U  �   
V  �   �V  �   �W  =  3X  �   qY  M   7Z     �Z     �Z  /   �Z  (   �Z  :   [     I[  C   O[  &   �[  �   �[  o   k\  �   �\  ~   k]  �   �]  -   y^  C  �^  1  �_  �   a  �   �a    �b  }   �c  �   Rd   (Nitrokey FIDO U2F - Linux) (Nitrokey FIDO U2F - Windows) (Nitrokey FIDO U2F - macOS) 1. Create a backup user and give it root privileges 2. Set up the ``rules`` to recognize the Nitrokey FIDO2 3. Install ``libpam-u2f`` 4. Prepare the Directory 5. Generate the U2F config file 6. Backup 7. Modify the Pluggable Authentication Module ``PAM`` After copying the file, restart udev via ``sudo service udev restart``. After the PAM module modification, you will be able to test your configuration right away, but it is recommended to reboot your computer, and unplug/replug the Nitrokey FIDO2. Alternatively you can build ``libpam-u2f`` from `Git <https://github.com/phoeagon/pam-u2f>`_. Alternatively you can just modify the ``/etc/pam.d/sudo`` file if you wish to use FIDO U2F when using the ``sudo`` command. And add the following lines: And plug your Nitrokey FIDO2. And restart ``udev`` service By modifying ``/etc/pam.d/common-auth`` file, you will be able to use you Nitrokey FIDO for 2nd factor authentication for graphic login and ``sudo``. Note: ``common-auth`` should be modified by adding the additional configuration line at the end of the file. CLI method Choose your operating system: Click for more options Control flags Create ``.config/Nitrokey/`` under your home directory Desktop Login and Linux User Authentication For individual user configuration you should point to the home directory in the next step, or not include the ``authfile`` option in the PAM configuration. GUI method If ``required`` or ``requisite`` is set, the failure of U2F authentication will cause a failure of the overall authentication. Failure will occur when the configured Nitrokey FIDO is not plugged, lost or destroyed. If the Nitrokey is not accepted immediately, you may need to copy this file `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_ to ``etc/udev/rules.d/``. In very rare cases, the system will need the `older version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`_ of this file. If you need more information about Control Flags in the ``PAM`` configuration line, you may see the last section of this guide to understand the difference, and the implications of using each of them. If you often forget to insert the key, ``prompt`` option make ``pam_u2f`` print ``Insert your U2F device, then press ENTER.`` and give you a chance to insert the Nitrokey. If you want to login to you computer using `Nitrokey Pro 2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`_ `Nitrokey Storage 2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`_ and `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`_ you can visit the instructions for Windows available `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:windows>`_, and for Linux `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:linux>`_. If you wish to use FIDO U2F authentication solely for Gnome’s graphic login, you might prefer to modify the\ ``/etc/pam.d/gdm-password`` If you would like to be prompted to touch the Nitrokey, ``cue`` option will make ``pam_u2f`` print ``Please touch the device.`` message. In case you prefer to setup U2F for a single user, and are locked out of your user session, you would still be able to login with the ``<backup_user>``, and proceed with the maintenance. In step 7 we have used the ``sufficient`` control flag to determine the behavior of the PAM module when the Nitrokey is plugged or not. However it is possible to change this behavior by using the following control flags: In the left corner click on ``Unlock`` and that would prompt for your password In the lower left corner click on ``Show Applications`` and type settings in the search bar as following: Instructions Introduction It is recommended to first test the instructions with a single user. For this purpose the previous command takes the ``-u`` option, to specify a user, like in the example below: Log in to the website and enable two-factor authentication in your account settings. (In most cases you will find a link to the documentation of the supported web service at `dongleauth.com <https://www.dongleauth.com/>`_) Nitrokey FIDO U2F Nitrokey FIDO U2F with Linux Nitrokey FIDO U2F with Windows Nitrokey FIDO U2F with macOS Nitrokey FIDO2 configured following `these instructions <https://www.nitrokey.com/documentation/installation#p:nitrokey-fido-u2f&os:linux>`_. Note, the output will be much longer, but sensitive parts have been removed here. For better security, and once the config file generated, we will move the ``.config/Nitrokey`` directory under the ``etc/`` directory with this command: On Ubuntu 20.04 it is possible to download directly ``libpam-u2f`` from the official repos Once done with the preparation, we can start to configure the computer to use the Nitrokey FIDO2 for 2nd factor authentication at login and ``sudo``. Once we modified the ``common-auth``, we can save and exit the file. Once you finish Step 4 you should be done Once you have properly tested the instructions in this guide (and set up a backup), it is recommended to use either the ``required`` or the ``requisite`` control flag instead of ``sufficient``. Once you run the command above, you will need to touch the key while it flashes. Once done, ``pamu2fcfg`` will append its output the ``u2f_keys`` in the following format: Open one of the `websites that support FIDO U2F <https://www.dongleauth.com/>`_. PAM modules Register your Nitrokey FIDO U2F in the account settings by touching the button to activate the Nitrokey FIDO U2F. After you have successfully configured the device, you must activate the Nitrokey FIDO U2F this way each time you log in. Requirements Scroll down in the right bar to ``Users`` Select ``Administrator`` and enter the user name and password of your choice Since we are using Central Authentication Mapping, we need to tell ``pam_u2f`` the location of the file to use with the ``authfile`` option. The Nitrokey App can not be used for the Nitrokey FIDO U2F. The Nitrokey FIDO U2F can be used with any current browser. The Nitrokey FIDO U2F supports **two-factor authentication (2FA)**. With two-factor authentication (2FA), the Nitrokey FIDO U2F is checked in addition to the password. The Output should be something like the following: The file under ``.config/Nitrokey`` must be named ``u2f_keys`` The final step is configure the PAM module files under ``/etc/pam.d/``. In this guide we will modify the ``common-auth`` file as it handles the authentication settings which are common to all services, but other options are possible. You can modify the file with the following command: The first time you plug in the Nitrokey FIDO U2F Windows may need some time to configure the device. The flags ``required`` and ``requisite`` provide a tighter access control, and will make the Nitrokey FIDO2 necessary to login, and/or use the configured service. The following guide can potentially lock you out of your computer. You should be aware of these risks, as it is recommended to first use the instructions below on a secondary computer, or after a full backup. The secure access to such a central software is especially important and can now be realized with the Nitrokey. For this purpose, access is protected by two-factor authentication (2FA) and critical users are given a Nitrokey. From now on the Nitrokey will be checked during user login in addition to the user password. Phishing attacks are thus foiled and your critical company data is protected. The two-factor authentication can be carried out using one-time passwords (TOTP, RFC 6238) and FIDO U2F, thus enabling Nitrokey Pro, Nitrokey Storage and Nitrokey FIDO U2F to be used. It is also possible to configure authentication centrally and to activate it only for selected users. There are several PAM modules files that can be modified according to your needs: This guide will walk you through the configuration of Linux to use FIDO Universal 2nd Factor, i.e. FIDO U2F with ``libpam-u2f`` and `Nitrokey FIDO2 <https://shop.nitrokey.com/shop/product/nk-fi2-nitrokey-fido2-55>`_. This solution was developed together with our partner `initOS <https://www.initos.com/>`_, who are specialized in the development and customization of Odoo. If you are interested, please contact us. This step is optional, however it is advised to have a backup Nitrokey in the case of loss, theft or destruction of your Nitrokey FIDO. To generate the configuration file we will use the ``pamu2fcfg`` utility that comes with the ``libpam-u2f``. For convenience, we will directly write the output of the utility to the ``u2f_keys`` file under ``.config/Nitrokey``. First plug your Nitrokey FIDO2 (if you did not already), and enter the following command: To set up a backup key, repeat the procedure above, and use ``pamu2fcfg -n``. This will omit the ``<username>`` field, and the output can be appended to the line with your ``<username>`` like this: To verify that the library is properly installed enter the following command: Troubleshooting Two-Factor Authentication (2FA) Two-factor authentication for ERP software Odoo Ubuntu 20.04 with Gnome Display Manager. Under ``/etc/udev/rules.d`` download ``41-nitrokey.rules`` Usage Video: Two-Factor-Authentication with the Nitrokey FIDO U2F in Odoo You can do so by using these commands: You can test the configuration by typing ``sudo ls`` in the terminal. You should be prompted the message ``Please touch the device.`` and have a similar output on the terminal: You might lose access to your data after configuring `PAM modules <http://www.linux-pam.org/Linux-PAM-html/>`_. You will also lose the ability to use ``sudo`` if you set up Central Authentication Mapping *and* used the ``required`` or ``requisite`` flags. You will lose access to your computer if you mis-configured the PAM module *and* used the ``required`` or ``requisite`` flags. `Checkout <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`_ the various use cases and supported applications. `Contact <https://www.nitrokey.com/contact>`_ `Odoo <https://www.odoo.com/>`_ is a powerful ERP (Enterprise Resource Planning) software for companies of all sizes. Odoo is available as open source and contains modules for CRM, website/e-commerce, accounting, financial accounting, production, warehouse management, project management, document management, among others. ``bash nitrouser@nitrouser:~$ sudo ls $ sudo ls [sudo] password for <username>:  Please touch the device.`` You can also test your configuration by logging out of the user session and logging back. A similar screen should be displayed once you you unplug/replug yout Nitrokey FIDO2 and type your password: ``optional``: The success or failure of this module is only important if it is the only module in the stack associated with this service+type. The ``optional`` flag is considered to be safe to use for testing purposes. ``required``: This is the most critical flag. The module result must be successful for authentication to continue. This flag can lock you out of your computer if you do not have access to the Nitrokey. ``requisite``: Similar to ``required`` however, in the case where a specific module returns a failure, control is directly returned to the application, or to the superior PAM stack. This flag can also lock you out of your computer if you do not have access to the Nitrokey. ``sufficient``: The module result is ignored if it fails. The ``sufficient`` flag considered to be safe for testing purposes. `nouserok` will ensure that you can still login using the username and password, you might want to remove this at some point once the setup is working and you don't want regular username & password based logins. Project-Id-Version: Nitrokey Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-01-05 12:32+0100
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ro
Language-Team: ro <LL@li.org>
Plural-Forms: nplurals=3; plural=(n==1 ? 0 : (n==0 || (n%100 > 0 && n%100 < 20)) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (Nitrokey FIDO U2F - Linux) (Nitrokey FIDO U2F - Windows) (Nitrokey FIDO U2F - macOS) 1. Create a backup user and give it root privileges 2. Set up the ``rules`` to recognize the Nitrokey FIDO2 3. Install ``libpam-u2f`` 4. Prepare the Directory 5. Generate the U2F config file 6. Backup 7. Modify the Pluggable Authentication Module ``PAM`` After copying the file, restart udev via ``sudo service udev restart``. After the PAM module modification, you will be able to test your configuration right away, but it is recommended to reboot your computer, and unplug/replug the Nitrokey FIDO2. Alternatively you can build ``libpam-u2f`` from `Git <https://github.com/phoeagon/pam-u2f>`_. Alternatively you can just modify the ``/etc/pam.d/sudo`` file if you wish to use FIDO U2F when using the ``sudo`` command. And add the following lines: And plug your Nitrokey FIDO2. And restart ``udev`` service By modifying ``/etc/pam.d/common-auth`` file, you will be able to use you Nitrokey FIDO for 2nd factor authentication for graphic login and ``sudo``. Note: ``common-auth`` should be modified by adding the additional configuration line at the end of the file. CLI method Choose your operating system: Click for more options Control flags Create ``.config/Nitrokey/`` under your home directory Desktop Login and Linux User Authentication For individual user configuration you should point to the home directory in the next step, or not include the ``authfile`` option in the PAM configuration. GUI method If ``required`` or ``requisite`` is set, the failure of U2F authentication will cause a failure of the overall authentication. Failure will occur when the configured Nitrokey FIDO is not plugged, lost or destroyed. If the Nitrokey is not accepted immediately, you may need to copy this file `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_ to ``etc/udev/rules.d/``. In very rare cases, the system will need the `older version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`_ of this file. If you need more information about Control Flags in the ``PAM`` configuration line, you may see the last section of this guide to understand the difference, and the implications of using each of them. If you often forget to insert the key, ``prompt`` option make ``pam_u2f`` print ``Insert your U2F device, then press ENTER.`` and give you a chance to insert the Nitrokey. If you want to login to you computer using `Nitrokey Pro 2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`_ `Nitrokey Storage 2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`_ and `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`_ you can visit the instructions for Windows available `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:windows>`_, and for Linux `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:linux>`_. If you wish to use FIDO U2F authentication solely for Gnome’s graphic login, you might prefer to modify the\ ``/etc/pam.d/gdm-password`` If you would like to be prompted to touch the Nitrokey, ``cue`` option will make ``pam_u2f`` print ``Please touch the device.`` message. In case you prefer to setup U2F for a single user, and are locked out of your user session, you would still be able to login with the ``<backup_user>``, and proceed with the maintenance. In step 7 we have used the ``sufficient`` control flag to determine the behavior of the PAM module when the Nitrokey is plugged or not. However it is possible to change this behavior by using the following control flags: In the left corner click on ``Unlock`` and that would prompt for your password In the lower left corner click on ``Show Applications`` and type settings in the search bar as following: Instructions Introduction It is recommended to first test the instructions with a single user. For this purpose the previous command takes the ``-u`` option, to specify a user, like in the example below: Log in to the website and enable two-factor authentication in your account settings. (In most cases you will find a link to the documentation of the supported web service at `dongleauth.com <https://www.dongleauth.com/>`_) Nitrokey FIDO U2F Nitrokey FIDO U2F with Linux Nitrokey FIDO U2F with Windows Nitrokey FIDO U2F with macOS Nitrokey FIDO2 configured following `these instructions <https://www.nitrokey.com/documentation/installation#p:nitrokey-fido-u2f&os:linux>`_. Note, the output will be much longer, but sensitive parts have been removed here. For better security, and once the config file generated, we will move the ``.config/Nitrokey`` directory under the ``etc/`` directory with this command: On Ubuntu 20.04 it is possible to download directly ``libpam-u2f`` from the official repos Once done with the preparation, we can start to configure the computer to use the Nitrokey FIDO2 for 2nd factor authentication at login and ``sudo``. Once we modified the ``common-auth``, we can save and exit the file. Once you finish Step 4 you should be done Once you have properly tested the instructions in this guide (and set up a backup), it is recommended to use either the ``required`` or the ``requisite`` control flag instead of ``sufficient``. Once you run the command above, you will need to touch the key while it flashes. Once done, ``pamu2fcfg`` will append its output the ``u2f_keys`` in the following format: Open one of the `websites that support FIDO U2F <https://www.dongleauth.com/>`_. PAM modules Register your Nitrokey FIDO U2F in the account settings by touching the button to activate the Nitrokey FIDO U2F. After you have successfully configured the device, you must activate the Nitrokey FIDO U2F this way each time you log in. Requirements Scroll down in the right bar to ``Users`` Select ``Administrator`` and enter the user name and password of your choice Since we are using Central Authentication Mapping, we need to tell ``pam_u2f`` the location of the file to use with the ``authfile`` option. The Nitrokey App can not be used for the Nitrokey FIDO U2F. The Nitrokey FIDO U2F can be used with any current browser. The Nitrokey FIDO U2F supports **two-factor authentication (2FA)**. With two-factor authentication (2FA), the Nitrokey FIDO U2F is checked in addition to the password. The Output should be something like the following: The file under ``.config/Nitrokey`` must be named ``u2f_keys`` The final step is configure the PAM module files under ``/etc/pam.d/``. In this guide we will modify the ``common-auth`` file as it handles the authentication settings which are common to all services, but other options are possible. You can modify the file with the following command: The first time you plug in the Nitrokey FIDO U2F Windows may need some time to configure the device. The flags ``required`` and ``requisite`` provide a tighter access control, and will make the Nitrokey FIDO2 necessary to login, and/or use the configured service. The following guide can potentially lock you out of your computer. You should be aware of these risks, as it is recommended to first use the instructions below on a secondary computer, or after a full backup. The secure access to such a central software is especially important and can now be realized with the Nitrokey. For this purpose, access is protected by two-factor authentication (2FA) and critical users are given a Nitrokey. From now on the Nitrokey will be checked during user login in addition to the user password. Phishing attacks are thus foiled and your critical company data is protected. The two-factor authentication can be carried out using one-time passwords (TOTP, RFC 6238) and FIDO U2F, thus enabling Nitrokey Pro, Nitrokey Storage and Nitrokey FIDO U2F to be used. It is also possible to configure authentication centrally and to activate it only for selected users. There are several PAM modules files that can be modified according to your needs: This guide will walk you through the configuration of Linux to use FIDO Universal 2nd Factor, i.e. FIDO U2F with ``libpam-u2f`` and `Nitrokey FIDO2 <https://shop.nitrokey.com/shop/product/nk-fi2-nitrokey-fido2-55>`_. This solution was developed together with our partner `initOS <https://www.initos.com/>`_, who are specialized in the development and customization of Odoo. If you are interested, please contact us. This step is optional, however it is advised to have a backup Nitrokey in the case of loss, theft or destruction of your Nitrokey FIDO. To generate the configuration file we will use the ``pamu2fcfg`` utility that comes with the ``libpam-u2f``. For convenience, we will directly write the output of the utility to the ``u2f_keys`` file under ``.config/Nitrokey``. First plug your Nitrokey FIDO2 (if you did not already), and enter the following command: To set up a backup key, repeat the procedure above, and use ``pamu2fcfg -n``. This will omit the ``<username>`` field, and the output can be appended to the line with your ``<username>`` like this: To verify that the library is properly installed enter the following command: Troubleshooting Two-Factor Authentication (2FA) Two-factor authentication for ERP software Odoo Ubuntu 20.04 with Gnome Display Manager. Under ``/etc/udev/rules.d`` download ``41-nitrokey.rules`` Usage Video: Two-Factor-Authentication with the Nitrokey FIDO U2F in Odoo You can do so by using these commands: You can test the configuration by typing ``sudo ls`` in the terminal. You should be prompted the message ``Please touch the device.`` and have a similar output on the terminal: You might lose access to your data after configuring `PAM modules <http://www.linux-pam.org/Linux-PAM-html/>`_. You will also lose the ability to use ``sudo`` if you set up Central Authentication Mapping *and* used the ``required`` or ``requisite`` flags. You will lose access to your computer if you mis-configured the PAM module *and* used the ``required`` or ``requisite`` flags. `Checkout <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`_ the various use cases and supported applications. `Contact <https://www.nitrokey.com/contact>`_ `Odoo <https://www.odoo.com/>`_ is a powerful ERP (Enterprise Resource Planning) software for companies of all sizes. Odoo is available as open source and contains modules for CRM, website/e-commerce, accounting, financial accounting, production, warehouse management, project management, document management, among others. ``bash nitrouser@nitrouser:~$ sudo ls $ sudo ls [sudo] password for <username>:  Please touch the device.`` You can also test your configuration by logging out of the user session and logging back. A similar screen should be displayed once you you unplug/replug yout Nitrokey FIDO2 and type your password: ``optional``: The success or failure of this module is only important if it is the only module in the stack associated with this service+type. The ``optional`` flag is considered to be safe to use for testing purposes. ``required``: This is the most critical flag. The module result must be successful for authentication to continue. This flag can lock you out of your computer if you do not have access to the Nitrokey. ``requisite``: Similar to ``required`` however, in the case where a specific module returns a failure, control is directly returned to the application, or to the superior PAM stack. This flag can also lock you out of your computer if you do not have access to the Nitrokey. ``sufficient``: The module result is ignored if it fails. The ``sufficient`` flag considered to be safe for testing purposes. `nouserok` will ensure that you can still login using the username and password, you might want to remove this at some point once the setup is working and you don't want regular username & password based logins. 