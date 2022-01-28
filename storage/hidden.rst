Hidden Storage
==============

Hidden volumes allow hiding data inside of the encrypted volume. This data is protected by an additional passphrase. Without the passphrase, the existence of the hidden volume can't be proven.
They are not configured with a default password so that their existence can be `denied plausibly <https://en.wikipedia.org/wiki/Plausible_deniability>`_.
The concept is similar to `VeraCrypt's/TrueCrypt's hidden volume <https://veracrypt.eu/en/docs/hidden-volume/>`_ but with Nitrokey Storage the entire functionality of hidden volumes is implemented in hardware.

You can configure up to four hidden volumes. Once unlocked, hidden volumes behave like ordinary storage where you can create various partitions, filesystems and store files as you like.

.. warning::
   If you chose to use hidden volumes, you must not write any data to the encrypted storage, or you risk loosing data in the hidden volume. 

.. note::
   Hidden volumes are hidden within the free space of the encrypted storage, which will be overwritten when writing data to the encrypted volume.
   There are no mechanisms to prevent accidental overwritting of hidden data, as they would reveal the existence of hidden volumes.
   The data that was written to the encrypted volume before the creation of the hidden volume can still be read.


Configuring hidden volumes
--------------------------

.. tip::
  Copy some files to the encrypted volume prior to creating the hidden volume. Once you have configured a hidden volume you shouldn't add or change files on the encrypted volume anymore.


1. Unlock the encrypted storage using the Nitrokey App.
2. In the menu, select "setup hidden volume".

.. image:: ../images/setup_hidden_volume.png
   :alt: menu containing the hidden volume setup utility.

3. Enter a strong passphrase twice. Unlike the encrypted storage PIN, there are no limit to the number of attempts at opening hidden storage, so the strength of the passphrase is extremely important.
4. Define the storage area to be used. Hidden volumes are stored in the free areas of the encrypted volume. When creating multiple hidden volume, you need to allocate part of the free area for each volume, making sure they do not overlap.

.. image:: ../images/hidden-storage-passphrase.png
  :alt: Hidden storage dialog box

Using hidden volumes
--------------------

1. Unlock the encrypted volume.
2. Select "unlock hidden volume" and enter any of the hidden volume's passwords.

.. include:: ./hidden-os-specific-partitioning.rst

4. Make sure to unmount/eject all partitions on the hidden volumes before locking or disconnecting the Nitrokey.
