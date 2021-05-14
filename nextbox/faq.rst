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

**Q:** Why does updating Nextcloud from inside Nextcloud not work?
  The Nextcloud version is rolled out by us. Thus the option to update from inside Nextcloud
  is not working. 

**Q:** Why does my harddrive not show up after plugging it in?
  Please make sure that you are using one of the supported filesystems (e.g., ext, xfs) and you
  have mounted your hard-drive within *Storage Management*.

**Q:** What kind of public key is expected for SSH access?
  An openssh style (public) key is expected. Depending on your operating system there are different
  ways to determine your public key. One might be ``ssh-add -L``, another might be 
  ``cat ~/.ssh/id_rsa.pub``. If you are using Putty, please see the `Putty documentation`_.

**Q:** Can I generally extend the NextBox using an USB hard-drive?
  Yes, this is possible, please make sure you are using a hard-drive, which has an external
  power supply. Once connected you can mount the hard-drive using the NextBox *Storage Management* 
  and include it into Nextcloud file-management using the `External storage support`_ app.




.. _External storage support: https://docs.nextcloud.com/server/20/admin_manual/configuration_files/external_storage_configuration_gui.html
.. _RPi Power Supply: https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md
.. _Putty Documentation: https://www.ssh.com/academy/ssh/putty/public-key-authentication



