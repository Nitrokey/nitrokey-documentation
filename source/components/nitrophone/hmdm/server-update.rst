Server Update
-------------

This document describes the update of an Headwind MDM (HMDM) server installation.
Before you perform the update on the server, make sure your mobile devices run a compatible version of the HMDM launcher app.

.. important::
   An incompatible launcher app version can cause a loose of communication between the server and the mobile devices.
   To prevent this, update the launcher app on the mobile devices first.
   Please refer to chapter `Verify Update on Mobile Devices <launcher-app-update.html#Verify Update on Mobile Devices>`__ to learn more.

The installation files you can request from our support team.
In case of an update only the WAR file for the application server is required.

1. Log on to the console of the HMDM server.

2. Create a directory for backups of the HMDM server configuration and application.

   .. code-block::

      mkdir /root/hmdm_backup_$(date --iso-8601)

   .. important::
      You can use any directory to backup the files, just make sure to not use the configuration or application directories of the application server, e.g. ``/var/lib/tomcat9/*``.

3. Create a backup of the HMDM database.

   .. code-block::

      pg_dump -h 127.0.0.1 -U hmdm -W hmdm > /root/hmdm_backup_$(date --iso-8601)/db.sql

4. Create a backup of the HMDM server configuration.

   .. code-block::

      cp /var/lib/tomcat9/conf/Catalina/localhost/ROOT.xml /root/hmdm_backup_$(date --iso-8601)/ROOT.xml

5. Create a backup of the HMDM application.

   .. code-block::

      cp /var/lib/tomcat9/webapps/ROOT.war /root/hmdm_backup_$(date --iso-8601)/ROOT.war

6. Copy the received application archive to the the application server's webapps directory ``/var/lib/tomcat9/webapps/ROOT.war``.

7. Restart the application server with ``systemctl restart tomcat9.service``.

8. Check the web panel of the HMDM server for full functionality.
   If you encounter an HTTP error 404, restore the HMDM configuration file from the backup and restart the application server again.

