
.. include:: ./product_platform_heading.rst

.. contents:: :local:

How to Setup The Login
''''''''''''''''''''''

You have two options: `pam_p11 <https://github.com/OpenSC/pam_pkcs11>`__ or `Poldi <https://wiki.ubuntuusers.de/Archiv/Authentifizierung_OpenPGP_SmartCard/>`__.

The solution with pam_p11 is more difficult to achieve and is based on S/MIME certificates. Please have a look at `the documentation <https://opensc.github.io/pam_pkcs11/doc/pam_pkcs11.html>`__ for more information.

Poldi 0.4.1 works flawlessly with Nitrokey for PAM authentication with RSA keys (see Troubleshooting for information on ECC keys). Besides the installation of poldi (e.g. ``sudo apt-get install libpam-poldi`` on Ubuntu) the following steps are needed to get it working.

It is necessary to already have keys generated on the Nitrokey, as the authentication key is used by PAM.

1. At first you need to find out the "Application ID" of your Nitrokey. 
   You can use ``gpg --card-status | grep Application`` to find out what's yours. It looks like ``D00600012401020000000000xxxxxxxx`` or similiar. 
2. Now you have to add a line to /etc/poldi/localdb/users which contains the following information

   <YourApplicationID> <YourUsername>

   This could look like 'D00600012401020000000000xxxxxxxx nitrokeyuser'. Now dump the public key from the Nitrokey into poldi local db:

``sudo sh -c 'gpg-connect-agent "/datafile /etc/poldi/localdb/keys/<YourApplicationID>" "SCD READKEY --advanced OPENPGP.3" /bye'``

Please be aware that you have to insert your Application ID in the line above with the one of your stick!

Then you have to configure PAM. Just add "auth sufficient pam_poldi.so" to pam configuration files according to your needs:

    * /etc/pam.d/common-auth for graphical user login
    * /etc/pam.d/login for console login
    * /etc/pam.d/sudo for sudo authentication
    * /etc/pam.d/gnome-screensaver for login back from a locked screen, 
    * etc.

.. note:: Pam is dangerous to play around with, so make sure you have a way of accessing the machine if you break authentication completely. Remember that booting into rescue mode from Grub requires a root password, so keep that or a live CD which can read your filesystems to hand.

Here you find `further instructions <https://wiki.ubuntuusers.de/Archiv/Authentifizierung_OpenPGP_SmartCard>`__ (in German, partially outdated).

Troubleshooting
'''''''''''''''

If you get an error similar to 'ERR 100663414 Invalid ID <SCD>' you should try instead

``poldi-ctrl -k > <YourApplicationID>; sudo mv <YourApplicationID> /etc/poldi/localdb/keys``

Please be aware that you have to insert your Application ID in the line above with the one of your stick!

ECC Keys
''''''''
Unfortunately, poldi has no support for ECC keys yet. But there is a `patch for ECC keys used with Nitrokey Start <https://dev.gnupg.org/T4009>`__. This is already included in the master branch of the poldi development repository and thus will be released in a newer version eventually. In the meantime the only option is to build poldi from source.
