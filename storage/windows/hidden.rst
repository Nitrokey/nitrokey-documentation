.. include:: ../hidden.rst

Using hidden volumes
--------------------

1. Unlock the encrypted volume.

2. Select "unlock hidden volume" and enter any of the hidden volume's passwords.

3. If this is the first time you unlock the hidden volume, you may need to create a partition on the hidden volume. In this case, Windows will prompt you to do so. You can then format the hidden volume using FAT32, for compatibility with most operating systems.


.. figure:: ./images/format-dialog.png
  :alt: Windows formating prompt

.. figure:: ./images/format-tool.png
  :alt: Windows formating tool

4. Make sure to unmount/eject all partitions on the hidden volumes before locking or disconnecting the Nitrokey.
