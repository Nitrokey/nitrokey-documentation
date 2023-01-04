.. include:: ../hidden.rst

Using hidden volumes
--------------------

1. Unlock the encrypted volume.

2. Select "unlock hidden volume" and enter any of the hidden volume's passwords.

3. If this is the first time you unlock the hidden volume, you may need to create a partition on the hidden volume. You will need to open a partition manager such as `GParted <https://gparted.org/>`__ and create one or more partitions manually. Make sure to create the partitions on the device that appeared when unlocking the hidden volume.

.. figure:: ./images/hidden-storage-partition.png
  :alt: Hidden volume partitioning

4. Make sure to unmount/eject all partitions on the hidden volumes before locking or disconnecting the Nitrokey.
