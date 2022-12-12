.. note::
  This site is for testing certain things. 

Hidden Volumes
==============

Configuring hidden volumes
--------------------------

Hidden volumes allow hiding data inside of the encrypted volume. This data is protected by an additional passphrase. Without the passphrase, it is impossible to know whether hidden volumes are present.
They are not configured with a default password so that their existence can be `denied plausibly <https://en.wikipedia.org/wiki/Plausible_deniability>`__.
The concept is similar to `VeraCrypt's/TrueCrypt's hidden volume <https://veracrypt.eu/en/docs/hidden-volume/>`__ but with Nitrokey Storage the entire functionality of hidden volumes is implemented in hardware.

.. warning::
   If you chose to use hidden volumes, you must not write any data to the encrypted volume, or you risk loosing data in the hidden volume. 

.. note::
   Hidden volumes are hidden within the free space of the encrypted volume, which will be overwritten when writing data to the encrypted volume.
   There are no mechanisms to prevent accidental overwritting of hidden data, as they would reveal the existence of hidden volumes.
   Data written to the encrypted volume before the creation of the hidden volume can still be read.

.. figure:: ../images/hidden-schema.svg
   :alt: Hidden volume description. The hidden volumes are within the free space of the encrypted volume.


.. tip::
  Copy some files to the encrypted volume prior to creating the hidden volume.
 
.. note::
  Using a journaling filesystem may risk overwriting the hidden data. The encrypted filesystem is formated to FAT32 by default, and it is recommended to leave it that way when using hidden volumes.

This is for testing certain words like Brainpool 192, Nitropy and curve25519
============================================================================

.. note::
  These are the words in question:
  Nitropy, curve25519, Brainpool 192, Brainpool 256-320, Brainpool 384-521, Brainpool

And here they are in a text:
Nitropy, curve25519, Brainpool 192, Brainpool 256-320, Brainpool 384-521,
Brainpool

 




