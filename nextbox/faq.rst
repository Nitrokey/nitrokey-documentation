Frequently Asked Questions
==========================

.. contents:: :local:

Generic
-------

**Q:** How can I factory-reset my NextBox?
  Press the hardware button for 5 seconds, see :doc:`technical/factory-reset`

**Q:** What do the different LED colors mean?
  The detailed document can be found here: :doc:`technical/led-colors`

**Q:** Can the inital setup be done using a monitor & keyboard?
  No, this is not possible as the regular login is disabled on delivery. Please connect the
  the NextBox to a network and access the NextBox using `nextbox.local`_ or the IP directly.

Hardware
--------
.. _usb-power-supply:

**Q:** Why must I not connect external hard-drives without an external power-supply to my NextBox?
  The Raspberry Pi 4 Model B can only supply 1.2A of power through USB (see
  `RPi Power Supply`_). The internal hard-drive is already connected and powered
  via USB and pulls ~1.0A. Thus connecting another hard-drive without an
  external power supply can lead to an unreliable power supply for the internal
  hard-drive, thus potential data loss.

**Q:** Why does my hard-drive not show up after plugging it in?
  Please make sure that you are using one of the supported filesystems (e.g., ext, xfs) and you
  have mounted your hard-drive within *Storage Management*.

**Q:** Can I generally extend the NextBox using a USB hard-drive?
  Yes, this is possible, please make sure you are using a hard-drive, which has an external
  power supply. Once connected you can mount the hard-drive using the NextBox *Storage Management* 
  and include it into Nextcloud file-management using the `External storage support`_ app.


**Q:** What functions does the additional "shield" provide?
  As of now the shield does provide a :doc:`status LED <technical/led-colors>`, a hardware button
  to :doc:`factory reset <technical/factory-reset>` and an additional USB Type-C connector on the 
  same side as the Ethernet port for power supply exclusively.

**Q:** Is the NextBox hardware extendable/replaceable?
  Yes, all NextBox components can be easily replaced. None of the components are glued or somehow
  permanently assembled. Using a Phillips screwdriver you can disassemble and re-assemble
  the NextBox easily. Keep in mind that you are doing this at your own risk.

**Q:** What are the two USB Type-C ports used for?
  Both USB Type-C ports are exclusively for power supply and can not be used for data transfer. 
  Do not connect two power supplies, please just use one of both to power your NextBox.



Software
--------

**Q:** Why does Nitrokey currently not recommend to use OnlyOffice or Collabora Office on the NextBox?
  The state of these Nextcloud apps is not yet mature (for ARM platforms). Although it is (partly)
  possible to install them we do not recommend doing so currently.

**Q:** Why does updating Nextcloud from inside Nextcloud not work?
  The Nextcloud version is rolled out by us. Thus the option to update from inside Nextcloud
  is not working. 

**Q:** What kind of public key is expected for SSH access?
  An openssh style (public) key is expected. Depending on your operating system there are different
  ways to determine your public key. One might be ``ssh-add -L``, another might be 
  ``cat ~/.ssh/id_rsa.pub``. If you are using Putty, please see the `Putty documentation`_.

**Q:** Can I add apps to the Nextcloud instance?
  Yes, the Nextcloud app store is available and any app available there can be installed through
  the Nextcloud web frontend.

**Q:** Can the operating system be extended or configured manually?
  Yes, you can set up ssh access through the NextBox Nextcloud app. Afterwards you can access your
  NextBox using ssh and you can do with the system whatever you want. Obviously we will only provide
  support for the NextBox stock configuration.

**Q:** What is the correct WebDAV URL?
  The full URL to use for WebDAV is: ``mount -t davfs https://my.domain.tld/remote.php/webdav/ /mnt/target/path``

**Q:** Can I access my Nextcloud instance using WebDAV?
  Yes, please see `Nextcloud WebDAV documentation`_ for a complete overview. A simple mount for 
  unix-like systems might look like this: ``mount -t davfs https://my.domain.tld/remote.php/webdav/ /mnt/target/path`` 
  while making sure that the ``davfs2`` package is installed.




.. _nextbox.local: http://nextbox.local
.. _External storage support: https://docs.nextcloud.com/server/20/admin_manual/configuration_files/external_storage_configuration_gui.html
.. _RPi Power Supply: https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md
.. _typical bare-board power consumption: https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md
.. _Putty Documentation: https://www.ssh.com/academy/ssh/putty/public-key-authentication
.. _Nextcloud WebDAV documentation: https://docs.nextcloud.com/server/20/user_manual/en/files/access_webdav.html


