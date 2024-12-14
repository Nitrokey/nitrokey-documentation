TLS Setup With Apache2 
======================

.. product-table:: hsm

.. contents:: :local:

.. hint::

   The very same concept as descriped here can be used for many
   applications using openssl as crypto-backend. The concept
   mostly boils down to: replace (secret) key-file with PKCS#11
   URL referencing a key on a security token (Nitrokey)


Preparation
-----------

* ensure that the `apache2` version is at least 2.4.42 for proper ``mod_ssl`` support

* activate ``mod_ssl`` using ``a2enmod ssl``, if not already done

* additionally ``openssl`` is needed and ``libengine-pkcs11-openssl`` see :doc:`PKCS#11 URL<pkcs11-url>`




Configure Apache2 to Use a Security Key 
---------------------------------------

Basically the only thing to do is replace ``SSLCertificateFile`` with the proper PKCS#11 URL 
and delete any other references to keys or certificates. E.g., ``SSLCertificateKeyFile`` is not
needed anymore.

An example directive might look like this:

.. code-block:: bash

   SSLCertificateFile	"pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0123123;token=UserPIN%20%28SmartCard-HSM%29;id%01"

The proper PKCS#11 URL can be extracted as documented in :doc:`PKCS#11 URL Generation<pkcs11-url>`

Be sure to place the directive inside a `VirtualHost` configuration.

Provide PIN During Apache2 Startup
----------------------------------

Using the previously described method Apache2 will ask on every startup for the User-PIN,
thus basically declining batch startup. Apache2 provides another directive to provide the
PIN during startup.

.. code-block:: bash

   SSLPassPhraseDialog     "|/bin/echo 123456"

Apache2 expects an executable after ``|``, which will be executed during startup
and it's output (trailing newline is expected) will be used as PIN. Obviously arbitrary
complex PIN retrieval methods can be implemented using this approach. Although here
a trivial example has been chosen to just ``echo`` the PIN during startup. 

Further ``SSLPassPhraseDialog`` is a global directive, thus has to be placed in the global
configuration scope in Apache2.

.. Warning::

   This shown example is not a secure mechanism to pass your PIN, as it will be
   written in plain-text inside your configuration

See the `Apache2 mod_ssl documentation`_ for more details on this feature.

Complete Apache2 Config Example
-------------------------------
A complete Apache2 (``VirtualHost``) config snippet might look like this:

::

   <IfModule mod_ssl.c>
     SSLPassPhraseDialog     "|/bin/echo 123456"
     <VirtualHost _default_:443>
     	ServerAdmin webmaster@localhost
     
     	DocumentRoot /var/www/html
     
     	ErrorLog ${APACHE_LOG_DIR}/error.log
     	CustomLog ${APACHE_LOG_DIR}/access.log combined
     
     	SSLEngine on
     
     	SSLCertificateFile	"pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0105076;token=UserPIN%20%28SmartCard-HSM%29"
     
     	#SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
     
     	<FilesMatch "\.(cgi|shtml|phtml|php)$">
     			SSLOptions +StdEnvVars
     	</FilesMatch>
     	<Directory /usr/lib/cgi-bin>
     			SSLOptions +StdEnvVars
     	</Directory>
     
     </VirtualHost>
   </IfModule>


.. _Apache2 mod_ssl documentation: https://httpd.apache.org/docs/2.4/mod/mod_ssl.html


