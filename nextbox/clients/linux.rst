Connect Your Linux Computer 
===============================

.. contents:: :local:

Connect using the Nextcloud App
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Download the client application from: https://nextcloud.com/install/ 

   .. hint:: Most distributions do provide the Nextcloud client via their 
            package managers. (e.g., Ubuntu, Arch Linux, Mint, ...)

2. After starting the ``nextcloud`` application, you will find it 
   as a tray icon.

3. Add an account using your public server url, username and password. 
   Further you can choose the target directory the files should be synced
   to.


Connect using WebDAV
^^^^^^^^^^^^^^^^^^^^^

* Mounting Nextcloud using WebDAV can be done directly via most file 
  managers, by adding a "remote server".

* Additionally you can mount your Nextcloud files using WebDAV via 
  commandline and `/etc/fstab` by installing the `davfs2` package.

* To mount use: 
  
   .. code-block:: bash

      mount -t davfs https://my.domain.tld/remote.php/webdav/ /mnt/target/path


