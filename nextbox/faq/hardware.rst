Hardware FAQ
============


.. _usb-power-supply:
.. _faq-nextbox-hardware-usb-power-supply:


**Q:** Why must I not connect external hard-drives without an external power-supply to my NextBox?
  The Raspberry Pi 4 Model B can only supply 1.2A of power through USB (see
  `RPi Power Supply`_). The internal hard-drive is already connected and powered
  via USB and pulls ~1.0A. Thus connecting another hard-drive without an
  external power supply can lead to an unreliable power supply for the internal
  hard-drive, thus potential data loss.

**Q:** Where can I find an external hard-drive with its own power supply?
  The smaller form factors (2.5'' and smaller) for external hard-drives mostly
  come without an additional power supply. For these, *a USB Hub with an
  additional power supply can be considered the "external power-supply"* for the
  hard-drive. Although the latter is it not 100% sure for powered USB hubs,
  thus we recommend external 3.5'' hard-drives, which are nearly always
  externally powered.

**Q:** Why does my USB device / hub not work, if connected to the NextBox?
  There are some devices and especially USB3 hubs that are known to not work properly
  with the Raspberry PI 4B, please see this `USB Documentation`_ from Raspberry.
  On top of that also make sure the USB device is working in general by connecting it 
  to another computer (best case: Linux) and verify that it works.

**Q:** Why does my hard-drive not show up after plugging it in?
  Please make sure that you are using one of the supported filesystems (e.g., ext, xfs) and you
  have mounted your hard-drive within *Storage Management*.

**Q:** Can I generally extend the NextBox using a USB hard-drive?
  Yes, this is possible, please make sure you are using a hard-drive, which has an external
  power supply. Once connected you can mount the hard-drive using the NextBox *Storage Management* 
  and include it into Nextcloud file-management using the `External storage support`_ app.


**Q:** What functions does the additional "shield" provide?
  As of now the shield does provide a :doc:`status LED <../technical/led-colors>`, a hardware button
  to :doc:`factory reset <../technical/factory-reset>` and an additional USB Type-C connector on the 
  same side as the Ethernet port for power supply exclusively.

**Q:** Is the NextBox hardware extendable/replaceable?
  Yes, all NextBox components can be easily replaced. None of the components are glued or somehow
  permanently assembled. Using a Phillips screwdriver you can disassemble and re-assemble
  the NextBox easily. Keep in mind that you are doing this at your own risk.

**Q:** What are the two USB Type-C ports used for?
  Both USB Type-C ports are exclusively for power supply and can not be used for data transfer. 
  Do not connect two power supplies, please just use one of both to power your NextBox.

**Q:** Which fan should I install?
  **There is absolutely no need for a fan, the NextBox is designed to work without an active 
  cooling**. Although if the NextBox is used for additional tasks (it's still a Linux), we have
  prepared a fan mount for a 30mm x 12mm fan at 5V connected to the shield. More details (connector,
  used pins) can be taken from `NextBox' GitHub`_. Currently we *do not* recommend adding a fan as
  the outputs are not controlled yet by the NextBox daemon, so this is also something you would have
  to do by yourself.

**Q:**: Can I upgrade the NextBox' RAM size?
  No, the Raspberry PI 4B has the RAM component soldered onto the mainboard, thus it cannot be replaced/extended.


.. _USB Documentation: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#universal-serial-bus-usb
.. _NextBox' GitHub: https://github.com/Nitrokey/nextbox-board
.. _External storage support: https://docs.nextcloud.com/server/20/admin_manual/configuration_files/external_storage_configuration_gui.html
.. _RPi Power Supply: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#power-supply

