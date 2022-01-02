Firmware Update v1.4+
=======================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

Starting with ``v1.4`` due to elementary changes inside Heads 
and the firmware layout, the update requires some additional 
considerations.

**This applies for both Nitropads X230 & T430**

Get the `latest firmware <https://github.com/Nitrokey/heads/releases/latest>`__.

.. warning:: 
    Updating from ``v1.3.1`` onwards has two different ways:
    
    * Legacy update using either ``nitropad-t430-v1.4.npf`` or ``nitropad-x230-v1.4.npf`` 
      from inside the Heads menu, see: :doc:`firmware-update`
    * External flashing using a flasher, then you can use the ``-maximized`` images, read
      about the external flashing below


Should I update my Nitropad?
----------------------------

For most users updating beyond v1.3.1 is (as of today) not needed. The 
most important change with v1.4 is the **compatibility with
QubesOS 4.1.** 

Generally everyone *can* update to v1.4, the most important
drawback for the end-user is the reduced fanciness (text-only) for the 
Heads menu directly after boot.

How can I update my Nitropad?
-----------------------------

Your Nitropad can be updated using the regular documented way, just
take care to use the right files:  ``nitropad-t430-v1.4.npf`` or ``nitropad-x230-v1.4.npf``
and follow this guide: :doc:`firmware-update`

.. warning::
    Never try updating your Nitropad using the `-maximized` image, if you do not 
    know exactly what you are doing! You will brick your Nitropad and
    it can only be repaired using an external flasher!


How can I update to *-maximized*?
---------------------------------

.. hint::
    We highly recommend to NOT DO THIS ON YOUR OWN, as long as 
    you are not exactly know what you are doing!

    We have a service to do this upgrade on your Nitropad, please
    write an e-mail to shop@nitrokey.com together with your order
    identification (``SOxxxxxxx``).

The following procedure describes roughly how to flash your Nitropad using
an external flasher - it is intentionally on a high level as we do not
recommend doing this process on your own. But for the sake of completeness
we document this here for the curios.

1. Make sure you have a (``flashrom``) compatible flasher like ``ch341a_spi`` with a SOIC-8 clamp.

2. Open the device (`see coreboot docs <https://doc.coreboot.org/mainboard/lenovo/Ivy_Bridge_series.html>`__) 
   and make sure you can access both flash chips.

3. Using ``flashrom`` read out the **bottom** flash (the 8MB image)

4. Using ``ifdtool`` (`coreboot ifdtool docs <https://doc.coreboot.org/ifdtool/index.html>`__) extract the ``GbE`` flashregion from the 
   image and replace the ``GbE``-region inside your ``-maximized`` image.

5. Split the modified firmware image using ``dd`` (as described in the coreboot documentation) into ``-top`` and ``-bottom``

6. Flash the images to the matching nand-flash chips using your flasher and clamp

7. Reboot into your system (you should see ``-maximized`` inside the Heads menu)


Background information
----------------------

The new firmware *class* of ``-maximized`` images change the firmware
layout in a way that it is incompatible with the Heads internal firmware
upgrade feature on the Nitropads.

This change mainly originates from a reduces *Management Engine* size
inside the firmware image. Furthermore the ``-maximized`` images do 
contain all flash regions inside the firmware, this also includes ``GbE``,
which is contains the ethernet MAC address. 

The non ``-maximized`` image have no **functional** differences compared
to the ``-maximized`` images, the only difference is the reduced Heads menu.



