Hidden Volumes
==============

Hidden volumes allow hiding data inside of the encrypted volume. This data is protected by an additional passphrase. Without the passphrase, it is impossible to know whether hidden volumes are present.
They are not configured with a default password so that their existence can be `denied plausibly <https://en.wikipedia.org/wiki/Plausible_deniability>`__.
The concept is similar to `VeraCrypt's/TrueCrypt's hidden volume <https://veracrypt.eu/en/docs/hidden-volume/>`__ but with Nitrokey Storage the entire functionality of hidden volumes is implemented in hardware.

You can configure up to four hidden volumes. Once unlocked, hidden volumes behave like ordinary storage where you can create various partitions, filesystems and store files as you like.

.. warning::
   If you chose to use hidden volumes, you must not write any data to the encrypted volume, or you risk loosing data in the hidden volume. 

.. note::
   Hidden volumes are hidden within the free space of the encrypted volume, which will be overwritten when writing data to the encrypted volume.
   There are no mechanisms to prevent accidental overwritting of hidden data, as they would reveal the existence of hidden volumes.
   Data written to the encrypted volume before the creation of the hidden volume can still be read.

.. figure:: images/hidden/hidden-schema.svg
   :alt: Hidden volume description. The hidden volumes are within the free space of the encrypted volume.


Configuring hidden volumes
--------------------------

.. tip::
  Copy some files to the encrypted volume prior to creating the hidden volume.
 
.. note::
  Using a journaling filesystem may risk overwriting the hidden data. The encrypted filesystem is formated to FAT32 by default, and it is recommended to leave it that way when using hidden volumes.


1. Unlock the encrypted volume using the Nitrokey App.
2. In the menu, select "setup hidden volume".

   .. figure:: images/hidden/setup_hidden_volume.png
      :alt: menu containing the hidden volume setup utility.

3. Enter a strong passphrase twice. Unlike the encrypted volume PIN, there are no limit to the number of attempts at opening hidden volumes, so the strength of the passphrase is extremely important.
4. Define the storage area to be used. Hidden volumes are stored in the free areas of the encrypted volume. When creating multiple hidden volume, you need to allocate a part of the free area for each volume, making sure they do not overlap.

   .. figure:: images/hidden/hidden-storage-passphrase.png
      :alt: Hidden volume dialog box

Using hidden volumes
--------------------

1. Unlock the encrypted volume.

2. Select "unlock hidden volume" and enter any of the hidden volume's passwords.

3.

    .. tabs::
        .. tab:: Linux
            
            If this is the first time you unlock the hidden volume, you may need to create a partition on the hidden volume. You will need to open a partition manager such as `GParted <https://gparted.org/>`__ and create one or more partitions manually. Make sure to create the partitions on the device that appeared when unlocking the hidden volume.

            .. figure:: images/hidden/hidden-storage-partition.png
                :alt: Hidden volume partitioning

        .. tab:: MacOS

            If this is the first time you unlock the hidden volume, you may need to create a partition on the hidden volume. You will need to use `Disk Utility <https://support.apple.com/en-gb/guide/disk-utility/dskutl14027/mac>`__. Make sure to create the partitions on the device that appeared when unlocking the hidden volume.

        .. tab:: Windows

            If this is the first time you unlock the hidden volume, you may need to create a partition on the hidden volume. In this case, Windows will prompt you to do so. You can then format the hidden volume using FAT32, for compatibility with most operating systems.


            .. figure:: images/hidden/format-dialog.png
                :alt: Windows formating prompt

            .. figure:: images/hidden/format-tool.png
                :alt: Windows formating tool

4. Make sure to unmount/eject all partitions on the hidden volumes before locking or disconnecting the Nitrokey.