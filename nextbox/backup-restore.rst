Backup and Restore
==================

.. contents:: :local:


The NextBox can be backupped and restored from within the NextBox Nextcloud App. In order to 
execute a backup or restore operation you need to have a storage device attached to your NextBox.

To enable backup and restore onto a storage device please follow these steps:

1. Make sure your storage device contains at least one partition formatted with a supported file-system
   (currently *ext* and *xfs* are supported).

2. Attach the storage device to your NextBox to any of the USB ports and *remember to use an external
   power supply* (:ref:`more information<usb-power-supply>`)

3. Once attached you will see the storage(s) inside "Storage Management" below "Available Storages"

4. Click on the plus-symbol on the right side to *mount* your storage and make it available for 
   backup and restore operations. The added storage is now listed inside "Mounted Storages".


Backup
-------

To backup your NextBox including all Nextcloud settings apps and data please follow these steps:

1. Make sure you have a storage mounted as described above

2. Inside "Backup / Restore" below "Full System Backup" select the storage
   device for backup from the drop-down menu named: "Select Backup Device"

3. Now you have the option to incrementally update an existing backup from the drop-down menu named:
   "Select Backup Location" **or** create a entirely new backup by entering a name into the 
   "Name of the new backup" entry field.

4. Click "Start Backup now", the backup process will begin immediately.

The resulting backup is not encrypted so take care who has access to the used storage.

Restore
--------

.. hint::
   The restore operation replaces the Nextcloud internals entirely and depending on the version
   combination this might lead to undefined behavior of the Nextcloud frontend. If this happens, 
   please be patient and reload the page using ``F5`` or ``ctrl-r`` and check, if the restore 
   operation was successful.

1. Make sure your have a storage mounted as described above and it contains a backup to be restored

2. Inside "Backup / Restore" below "Restore System from Backup" use the "Select Backup to Restore"
   drop-down menu to select a backup to be restored

3. Click "Start Restoring now", the restore process will begin immediately.

Depending on the backupped Nextcloud version after the restore process you will be asked to run
the upgrade process for Nextcloud. 


.. hint::
   All configurations and settings of the NextBox and the Nextcloud instance will be restored, thus
   there might be changes on how you access your NextBox, if the restored Remote Access configuration 
   is not identical to the current one.




