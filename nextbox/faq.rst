Frequently Asked Questions
==========================

**Q:** How can I factory-reset my NextBox?
  Press the hardware button for 5 seconds, see :doc:`technical/factory-reset`

**Q:** What do the different LED colors mean?
  The detailed document can be found here: :doc:`technical/led-colors`

**Q:** Why must I not connect external hard-drives without an external power-supply to my NextBox?
  The Raspberry Pi 4 Model B can only supply 1.2A of power through USB (see
  `RPi Power Supply`_). The internal harddrive is already connected and powered
  via USB and pulls ~1.0A. Thus connecting another harddrive without an
  external power supply can lead to an unreliable power supply for the internal
  harddrive, thus potential data loss.

**Q:** Why does Nitrokey currently not recommend to use OnlyOffice or Collabora Office on the NextBox?
  The state of these Nextcloud apps is not yet mature (for ARM platforms). Although it is (partly)
  possible to install them we do not recommend doing so currently.

 




.. _RPi Power Supply: https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md



