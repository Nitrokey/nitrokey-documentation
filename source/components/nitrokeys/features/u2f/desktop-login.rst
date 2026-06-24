Desktop Login And Linux User Authentication
===========================================

.. product-table:: nk3 u2f fido2 passkey

.. contents:: :local:

Introduction
------------

This guide will walk you through the configuration of Linux to use FIDO Universal 2nd Factor, i.e. FIDO U2F with ``libpam-u2f`` and compatible Nitrokeys.
You will set up your Nitrokey as a second factor for authentication. This means you will need your usual login method (likely your password) and your Nitrokey to login.

If you want to use your Nitrokey as an alternative login method instead (password OR Nitrokey), see `Alternative Authentication Method <#alternative-authentication-method>`__ after completing the main guide.

If you want to login to you computer using `Nitrokey Pro
2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`__ `Nitrokey Storage
2 <https://www.nitrokey.com/files/doc/Nitrokey_Storage_factsheet.pdf>`__ and `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`__ you can visit the instructions available `here <../openpgp-card/desktop-login/pam.html>`_.

.. warning::

   The following guide can potentially lock you out of your computer.
   You should be aware of these risks, as it is recommended to first use
   the instructions below on a secondary computer, or after a full
   backup.

   You might lose access to your data after configuring `PAM
   modules <https://www.man7.org/linux/man-pages/man8/pam.8.html>`__.

Requirements
------------

-  Ubuntu 24.04 with Gnome Display Manager (GDM).

Instructions
------------

1. **Create a backup user and give it root privileges**

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      $ sudo adduser <backup_user>
      $ sudo usermod -aG sudo <backup_user>

   In case you prefer to setup U2F for a single user, and are locked out of your
   user session, you would still be able to login with the ``<backup_user>``, and
   proceed with the maintenance.

2. **Install** ``libpam-u2f``

   On Ubuntu 24.04 it is possible to download directly ``libpam-u2f`` from the official repos

   .. code-block:: bash

      $ sudo apt install libpam-u2f

   .. note::

      -  Alternatively you can build ``libpam-u2f`` from
         `Git <https://github.com/phoeagon/pam-u2f>`__.

      -  To verify that the library is properly installed enter the
         following command:

      .. code-block:: bash

         $ file /lib/x86_64-linux-gnu/security/pam_u2f.so

      The Output should be something like the following:

      .. rstcheck: ignore-next-code-block
      .. code-block:: bash

         /lib/x86_64-linux-gnu/security/pam_u2f.so: \ ELF 64-bit LSB shared object, x86-64, version 1 (SYSV),\ dynamically linked, BuildID[sha1]=1d55e1b11a97be2038c6a139579f6c0d91caedb1, stripped

3. **Generate the U2F config file**

   To generate the configuration file we will use the ``pamu2fcfg`` utility. First plug your Nitrokey (if you did not already), and enter the following command:

   .. code-block:: bash

      $ pamu2fcfg > ~/u2f_keys

   Once you run the command above, you will need to touch the device while it flashes. Once done, ``pamu2fcfg`` will append its output the ``u2f_keys`` file in the format:

   .. code-block:: bash

      <username>:KeyHandle,PublicKey,flags

   This will look something like the following:
   
   .. code-block:: bash

      nitrouser:fS6vQ9uWa0VizcczyZ/bvk5kcQJkIJOC/21/e7dXFe/fnONSL705EkeiUpZpL/3seAWL/qW4/mqb0/WtiZoP/NOLTRM4EEAg1ANLsfYgSzRd/AjsW3z8kJwgckbvwDUyB90ByR09XtBhuE41vMsEk6J+9CS0+ZuPSB0KXRG7z2yZpQLldjE/ijsdIdd8Ct2oXSiZ/zTb/t5kRafNJVkp=,Oo4U9XvIhI9r0WNnvoMwG5/pbgwYd4GMCYEinhWcsI2hKUebYj92JOxDsSa3zd2A9OB0ofXgB16FD2naev3YmLch==,es256,+presence

   Note, this output was not generated directly by ``pamu2fcfg`` and contains no sensitive information. It is purely meant to show the expected format and length of the output.

   .. tip::

      -  The file must be named ``u2f_keys``

      -  It is recommended to first test the instructions with a single
         user. Other users configuration will be added it section 7.
         
4. **Setting up a backup Nitrokey**

   This step is optional, however it is advised to have a second Nitrokey as backup in the case of loss, theft or destruction of your primary Nitrokey.

   To set up a backup key, repeat the procedure above, and use ``pamu2fcfg -n`` like this:

   .. code-block:: bash

      $ pamu2fcfg -n >> ~/u2f_keys

   This will omit the ``<username>`` field, and the output is appended to the line with your ``<username>``, this will look something like this:
   
   .. code-block:: bash

      <username>:Zx...mw,04...0a:xB...fw,es256,+presence:04...3f,es256,+presence
   
5. **Securing the config file**

   For better security, after the config file was generated, we will move the generated file ``~/u2f_keys`` to ``/etc/Nitrokey/`` and change the access permissions using these commands:

   .. code-block:: bash

      $ sudo mkdir /etc/Nitrokey
      $ sudo mv ~/u2f_keys /etc/Nitrokey/
      $ sudo chmod 644 /etc/Nitrokey/u2f_keys

6. **Modify the Pluggable Authentication Module** ``PAM``

   Configure the PAM module files under ``/etc/pam.d/``.
   This is a testing phase -  step 8 will enforce the configuration once you confirm it works.

   In this guide we will modify the ``common-auth`` file as it handles the authentication settings which are common to all services, other options are described in `PAM Modules <#pam-modules>`__.
   You can modify the file with the following command:

   .. code-block:: bash

      $ sudo editor /etc/pam.d/common-auth

   Add the following line at the **bottom** of the file:

   .. code-block:: bash

      #Nitrokey config
      auth    sufficient pam_u2f.so authfile=/etc/Nitrokey/u2f_keys cue [cue_prompt=Please touch the device.] prompt

   .. tip::

      -  We are using sufficient for testing and will change to required in Step 8.

      -  Since we are using Central Authentication Mapping, we need to tell
         ``pam_u2f`` the location of the file to use with the ``authfile``
         option.

      -  If you often forget to insert the key, ``prompt`` option makes
         ``pam_u2f`` print ``Insert your U2F device, then press ENTER.``
         and give you a chance to insert the Nitrokey.

      -  If you would like to be prompted to touch the Nitrokey, ``cue``
         option will make ``pam_u2f`` print ``Please touch the device.``
         message. You can change the message in ``[cue_prompt=Please touch the device.]``.

   .. note::
      
      **Why bottom placement?** PAM processes modules from top to bottom. Placing the U2F 
      configuration at the bottom ensures password authentication is checked first, creating 
      a second-factor workflow (password + U2F).
      
      For alternative authentication options (password OR Nitrokey) and detailed explanations 
      of how line position and control flags affect authentication, see 
      `Alternative Authentication Method <#alternative-authentication-method>`__.

   Once we modified the ``common-auth``, we can save and exit the file.

   You can test the configuration by typing ``sudo ls`` in the terminal. After typing in your password you should be prompted with the message ``Please touch the device.`` and have a similar output on the terminal:

   .. code-block:: bash

      nitrouser@nitrouser:~$ sudo ls
      [sudo] password for nitrouser:  Please touch the device.

   You can also test your configuration by logging out of the user session and logging back in. A similar screen should be displayed once you you unplug/re-plug your Nitrokey and type your password:

   .. figure:: images/desktop-login/u2f-fido-pam-2.png
      :alt: img6

7. **Setting up multiple users**

   After confirming that authentication using your Nitrokey did work, you can set up the U2F config file for the other users on your system.

   .. warning::

      Should you not set up all users in the U2F config file and continue with enforcing
      Nitrokey authentication in step 8, you will not be able to log in with any not configured user!

   To configure u2f for multiple users, ``pamu2fcfg`` takes
   the ``-u <username>`` option, the output can be appended to the ``u2f_keys`` file like this:

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash

      $ sudo pamu2fcfg -u <username> >> /etc/Nitrokey/u2f_keys

   To add a backup Nitrokey to this user, plug in your backup Nitrokey and do the same you did for the primary user:

   .. code-block:: bash

      $ sudo pamu2fcfg -n >> /etc/Nitrokey/u2f_keys

   After that repeat this process for all the users on your system.

8. **Enforcing Nitrokey second factor authentication**

   You may have noticed that authenticating with the Nitrokey was not enforced yet. After confirming that authentication using the Nitrokey does work, we can enforce 
   it by changing the ``sufficient`` flag to ``required``.

   .. warning::

      Before continuing with this step, make sure you have:

      -  Tested that authentication with the Nitrokey does indeed work,
         otherwise you can lose access to your computer.

      -  Set up a backup Nitrokey. Otherwise if you lose or break your Nitrokey,
         you will lose access to your computer!

      Proceed with care!

   To do so you need to edit the ``PAM`` configuration file:

   .. code-block:: bash

      $ sudo editor /etc/pam.d/common-auth

   In the line you added earlier at the bottom of the file change the word ``sufficient`` to ``required``. It should look like this:

   .. code-block:: bash

      #Nitrokey config
      auth    required pam_u2f.so authfile=/etc/Nitrokey/u2f_keys cue [cue_prompt=Please touch the device.] prompt

After completing the setup, it is recommended to reboot your computer and unplug/re-plug the Nitrokey.

Alternative Authentication Method
---------------------------------

If you prefer to use your Nitrokey as an alternative to your password (password OR Nitrokey), you can configure this instead:

**Configuration Steps:**

1. Move the PAM configuration line to the **top** of ``/etc/pam.d/common-auth`` (before other auth modules)
2. Keep the ``sufficient`` control flag

This allows authentication with either factor alone. Note that this provides less security than second-factor authentication.

**Understanding Authentication Modes**

The combination of line position and control flag determines your authentication mode:

.. list-table:: Authentication Modes
   :width: 100%
   :header-rows: 1

   * - Position
     - Control Flag
     - Authentication Mode
     - Use Case

   * - Bottom (after pam_unix)
     - ``sufficient``
     - Second factor (testing)
     - Safe testing phase

   * - Bottom (after pam_unix)
     - ``required``
     - Second factor (enforced)
     - Production security (main guide)

   * - Top (before pam_unix)
     - ``sufficient``
     - Alternative factor
     - Convenience (password OR key)

**How PAM Works:**

PAM processes modules sequentially from top to bottom. The control flag determines how 
success or failure affects the overall authentication:

- ``sufficient``: Success completes authentication; failure is ignored if other modules succeed
- ``required``: Success is mandatory; failure causes overall authentication failure

**What This Means For You:**

*Alternative authentication (top + sufficient):*

- You can log in with your password **OR** your Nitrokey alone
- If authentication with the Nitrokey succeeds, no password is required
- If the Nitrokey authentication fails or is skipped, the password will still work
- This is more convenient but less secure than second-factor authentication

*Security implications:*

- An attacker with your password can log in without your Nitrokey
- An attacker with physical access to your Nitrokey can log in without your password
- Use this only if convenience is more important than maximum security

For detailed explanations of control flags and their implications, see `Control Flags <#control-flags>`__.

PAM Modules
-----------

There are several PAM modules files that can be modified according to your needs:

-  By modifying ``/etc/pam.d/common-auth`` file, you will be able to use
   you Nitrokey for 2nd factor authentication for graphic login and
   ``sudo``.

-  If you wish to use FIDO U2F authentication solely for Gnome's graphic
   login, you might prefer to modify the ``/etc/pam.d/gdm-password``

-  Alternatively you can just modify the ``/etc/pam.d/sudo`` file if you
   wish to use FIDO U2F when using the ``sudo`` command.

Control Flags
-------------

The control flag determines how the PAM module behaves when authentication succeeds or fails. In step 6 we used the ``sufficient`` flag for testing, then changed to ``required`` for enforcement.

The available control flags are:

-  ``required``: The module result must be successful for authentication to continue. This is the most critical flag and can lock you out of your computer if you do not have access to the Nitrokey.

-  ``requisite``: Similar to ``required`` however, in the case where a specific module returns a failure, control is directly returned to the application, or to the superior PAM stack. This flag can also lock you out of your computer if you do not have access to the Nitrokey.

-  ``sufficient``: The module result is ignored if it fails. In case of success, control is directly returned to the application, or to the superior PAM stack. This means no other PAM modules will be executed. The ``sufficient`` flag is considered safe for testing purposes.

-  ``optional``: The success or failure of this module is only important if it is the only module in the stack associated with this service+type. The ``optional`` flag is considered safe to use for testing purposes.

.. warning::

   -  If ``required`` or ``requisite`` is set, the failure of U2F
      authentication will cause a failure of the overall authentication.
      Failure will occur when the configured Nitrokey is not
      plugged, lost or destroyed.

   -  You will lose access to your computer if you misconfigured the
      PAM module *and* used the ``required`` or ``requisite`` flags.

   -  You will also lose the ability to use ``sudo`` if you set up
      Central Authentication Mapping *and* used the ``required`` or
      ``requisite`` flags.

   -  You might also lose the ability to log in using Gnome Display manager
      if smart card login is enforced and you used the ``required`` or
      ``requisite`` flags. See Troubleshooting for further info.

Troubleshooting
---------------

Issues logging into user account using GDM
''''''''''''''''''''''''''''''''''''''''''

In some cases, for example if you have `opencs-pkcs11` installed, Gnome Display Manager (GDM) can
default to enforcing smart card login as soon as any smart card (like your Nitrokey) is plugged in, even if no smart card has ever been configured. 
This can prevent you from logging in to your user account using u2f. If you have set the ``sufficient`` control flag,
unplug all smart cards and log in using your password. To turn off smart card enforcing run the following command:

.. code-block:: bash

   $ sudo -u gdm env -u XDG_RUNTIME_DIR -u DISPLAY DCONF_PROFILE=gdm dbus-run-session gsettings set org.gnome.login-screen enable-smartcard-authentication false
