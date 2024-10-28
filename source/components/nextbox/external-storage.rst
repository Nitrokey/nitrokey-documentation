Connect External Storage
========================

.. Warning::

   External storage drives without an external power supply must NOT be
   connected to the USB sockets. Otherwise, this can lead to data loss on the
   internal hard disk. **Always use external storage drives with a separate
   power supply together with the NextBox.**

Requirements
------------

- an external storage drive with a separate power supply
- the external storage must be formatted with a supported filesystem (e.g. ext3, ext4 or XFS)

Configuration
-------------

- Connect your external storage to your NextBox
- Switch to the NextBox Administration App
- Select "Storage Management"
- Click onto the plus sign to mount the storage

.. note::

    If you want to share directories with multiple users you have to install the "Group folders app" and click
    onto the three dotted symbol and "Share" to make it available for other users. (As the last image shows)

.. figure:: ./images/storage-one.png
   :alt: Storage Configuration

.. figure:: ./images/storage-two.png
    :alt: Storage Mount


Allow Access From Files App
-----------------------------

As an additional requirement the hard-disk must have its mounted directory
access permissions be set to ``777`` or owned by user and group id ``32``. If the
hard-disk is mounted on your host locally the easiest way is just to do ``chmod
777 /path/to/mounted/hard-disk`` as root.

To allow direct access to the mounted external storage through the Nextcloud
"Files" App, the **External storage support** app has to be installed from the
Nextcloud App Store. There the correct mount point listed inside "Storage
Management" inside the NextBox App has to be made available. As shown in this screenshot:

.. figure:: ./images/storage-settings.png
   :alt: External Storage Support Settings

Replace ``/media/extra-1`` with the mountpoint found in "Storage Management". Given
the configuration above the external hard-disk shall be available as "Local" within the
Files App now.
