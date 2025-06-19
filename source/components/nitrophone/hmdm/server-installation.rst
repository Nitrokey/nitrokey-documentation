Server Installation
###################

The recommended operating system for the installation is Ubuntu 22.04 LTS.
The instructions below use this operating system.

The installation files for Headwind MDM (HMDM) can be downloaded from the official `website <https://h-mdm.com/download/>`__.

Install Web Panel
+++++++++++++++++

1. Copy the archive for installation to the server with ``scp hmdm-<VERSION>-install-ubuntu.zip <user>@<hostname>:~``,
   while replacing ``<user>``, ``<hostname>``, and ``<VERSION>`` with the respective values.
2. Login to the server.
3. Extract the archive with ``unzip hmdm-<VERSION>-install-ubuntu.zip``, while replacing ``<VERSION>`` with the respective value.
   Afterwards, change to the directory with the extracted files with ``cd hmdm-install/``.
4. Update repository data and install dependencies with ``apt update && apt install -y aapt tomcat9 postgresql vim certbot unzip net-tools iptables``.
   Iptables is required by the installer to set firewall rules to redirect the ports *80* and *443* to the default Tomcat ports *8080* and *8443*.
5. Create role and database in Postgres.
   Make sure the database password does not contain any characters interpreted by the shell, such as ``@`` or ``&``.
   In the example below replace ``supersafepassword`` with your own password.

   .. code-block::

      root@mdm:~# su - postgres
      postgres@mdm:~$ psql
      psql (14.9 (Ubuntu 14.9-0ubuntu0.22.04.1))
      Type "help" for help.

      postgres=# CREATE USER hmdm WITH PASSWORD 'supersafepassword';
      CREATE ROLE
      postgres=# CREATE DATABASE hmdm WITH OWNER=hmdm;
      CREATE DATABASE
      postgres=# \q
      postgres@mdm:~$ exit

6. Install HMDM with ``./hmdm_install.sh``.
   The defaults of the binary installer are safe defaults.

   * When the installer asks for the PostgreSQL database, PostgreSQL user, and PostgreSQL password enter the respective values set in step 5.
   * When the installer asks for a domain name enter a fully-qualified domain name.
   * After the installation of the web panel the installer will ask if it should fetch and setup a certificate renewal process for CA using Certbot.
     In case you instruct the installer to retrieve a Lets Encrypt certificate, deny the installer request for sharing the mail address with the EFF.
     Certbot can automatically update the Tomcat configuration to use the Lets Encrypt certificate.
     This is recommended if this is a newly installed system and there are no other applications running on the same system.
     If you decided against using a Lets Encrypt certificate make sure Tomcat has access to a valid certificate.
   * The installer will ask if to redirect the ports *80* and *443* to the Tomcat service.
     This is recommended if HMDM should be reachable on HTTPS without explicitly specifying another port.
     If not redirected, the Tomcat server is reachable on the default ports *8080* and *8443*.
   * The installer will ask if it should move required APKs from ``h-mdm.com`` to your server.
     This can be confirmed to avoid more external requests.
   * When the installation has finished, the installer will display information about how to reach the HMDM web panel.

7. Make a backup of your configuration file with ``cp /var/lib/tomcat9/conf/Catalina/localhost/ROOT.xml /var/lib/tomcat9/conf/Catalina/localhost/ROOT.xml~``.
8. Open the website of HMDM and enter the activation code for this installation.
   Afterwards, login and set a new password.

Activate Multi-Tenant Mode (optional)
*************************************

1. Login to the server.
2. Change to the *Postgres* user account, running the database service, with ``su postgres``.
3. Open a connection to the Postgres service and select the *hmdm* database with ``psql hmdm``.
4. In the Postgres shell *psql>* run the following statements one after another.

   .. code-block::

      UPDATE customers SET master=true WHERE id=1;
      UPDATE users SET userroleid=1 WHERE id=1;

   Now the multi-tenancy for the admin user is activated.
   To manage the different tenants the web interface is used.

5. Login to the web interface with the admin user.
6. From the user menu in the top right corner, select *Master Panel*.
   The same menu works to go back to the *Main Panel*.
7. On the page the admin user can add an organization and manage shared applications.

Email Sending Functionality (optional)
**************************************

The settings and credentials for email sending functionality can be entered during software installation.
This chapter describes how to do this if it wasn't done during installation.

1. Login to the server.
2. Change to directory ``/var/lib/tomcat9/conf/Catalina/localhost/`` with ``cd /var/lib/tomcat9/conf/Catalina/localhost/``.
3. Open the file ``ROOT.xml`` in an editor.
4. Towards the end of the file you can find the following configuration keys.

   .. code-block::

      <Parameter name="smtp.host" value="mail.example.net"/>
      <Parameter name="smtp.port" value="465"/>
      <Parameter name="smtp.ssl" value="1"/>
      <Parameter name="smtp.starttls" value="0"/>
      <Parameter name="smtp.username" value="noreply@example.net"/>
      <Parameter name="smtp.password" value="supersafepassword"/>
      <Parameter name="smtp.from" value="noreply@example.net"/>
      <!-- Uncomment this line if you get 'Could not convert socket to TLS' -->
      <!-- <Parameter name="smtp.ssl.protocols"value="TLSv1.2"/> -->

5. After changing the configuration, make again a backup of your configuration file with ``cp /var/lib/tomcat9/conf/Catalina/localhost/ROOT.xml /var/lib/tomcat9/conf/Catalina/localhost/ROOT.xml~``.

Manage Web Panel
++++++++++++++++

Create a New User Account
*************************

1. Login to the web panel as an administrator.
2. Open the *Master Panel* from the menu in the top right corner.
3. Change to the *Organizations* menu and click the *Add* button to add a new user.
   Fill in the respective form fields and confirm the creation with the *Save* button.

Please note that the new user won't be automatically notified about the account.
They can use the *Lost password?* feature on the login screen to reset the password for their account.

