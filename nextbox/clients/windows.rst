Connect your Mac Commputer
==========================

.. contents:: :local:

Connect using the Nextcloud App
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


1. Download the Nextcloud client application: https://nextcloud.com/install/

   .. figure:: /nextbox/images/win_app/1.png
      :alt: imgsp1
      :scale: 30 %


2. After installation, click "Log in to your Nextcloud". Afterwards please
   provide your Nextcloud's domain.


   .. figure:: /nextbox/images/win_app/2.png
      :alt: imgsp1
      :scale: 50 %


3. Provide your username and password and click "Log in".

   .. figure:: /nextbox/images/win_app/nextc-login.png
      :alt: imgsp1
      :scale: 30 %


   Inside the tray there will be a Nextcloud icon to open the Nextcloud application settings.

   .. figure:: /nextbox/images/win_app/4.png
      :alt: imgsp1
      :scale: 50 %


   Inside the file-explorer you can now find your Nextcloud instance files.

   .. figure:: /nextbox/images/win_app/5.png
      :alt: imgsp1
      :scale: 50 %


Connect using WebDAV
^^^^^^^^^^^^^^^^^^^^

.. Warning::

   There have been reports that the native WebDAV support in Windows is not performing well. We 
   recommend using the Nextcloud App (as described above) for the best user experience. Additionally
   please read `Nextcloud's Windows WebDAV Known Problems`_.

1. Add a WebDAV drive using the file explorer's "Add a network location" icon. (You can also use 
   "Map network drive" to bind your Nextcloud to a drive, like *Z:*).

   .. figure:: /nextbox/images/win_webdav/6.png
      :alt: imgsp1
      :scale: 50 %

2. In the following dialog please enter the full WebDAV address of your
   NextBox: ``https://my.domain.tld/remote.php/dav/files/USERNAME``. Replace *my.domain.tld* with
   your NextBox's public domain and *USERNAME* with the username you would like to connect.

3. In the following window insert your full Nextcloud credentials, means your username and password
   you use to login into your Nextcloud.

   .. figure:: /nextbox/images/win_webdav/8.png
      :alt: imgsp1
      :scale: 50 %

Now your files from your Nextcloud instance are accessible via the file-explorer.


.. _Nextcloud's Windows WebDAV Known Problems: https://docs.nextcloud.com/server/21/user_manual/en/files/access_webdav.html#known-problems


