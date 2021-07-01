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

**Q:** What is the typical power consumption?
  The minimum of 0,6A (3W) is rarely reached, in idle mostly around 1A (5W) and more than 
  2A (10W) under higher loads. 

**Q:** Can I mirror my NextBox onto another NextBox?
  This translates to a cluster setup, which is considered an (paid) enterprise solution 
  by Nextcloud. The details, especially data consistency and collision handling, are far 
  from trivial to realize. Nevertheless, we also see demand for more sophisticated backup
  solutions and will address this issue.


Hardware
--------
.. _usb-power-supply:

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

**Q:** Which fan should I install?
  **There is absolutely no need for a fan, the NextBox is designed to work without an active 
  cooling**. Although if the NextBox is used for additional tasks (it's still a Linux), we have
  prepared a fan mount for a 30mm x 12mm fan at 5V connected to the shield. More details (connector,
  used pins) can be taken from `NextBox' GitHub`_. Currently we *do not* recommend adding a fan as
  the outputs are not controlled yet by the NextBox daemon, so this is also something you would have
  to do by yourself.


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
  The full URL to use for WebDAV is:
  ``https://my.domain.tld/remote.php/webdav/``, there have been reports that
  for native Windows WebDAV you might need:
  ``https://my.domain.tld/remote.php/dav/files/USERNAME`` with *USERNAME* being
  the username you would like to use.

**Q:** Can I access my Nextcloud instance using WebDAV?
  Yes, please see `Nextcloud WebDAV documentation`_ for a complete overview. A
  simple mount for unix-like systems might look like this: ``mount -t davfs
  https://my.domain.tld/remote.php/webdav/ /mnt/target/path`` while making sure
  that the ``davfs2`` package is installed. For Windows please additionally
  read these :doc:`docs <clients/windows>`.


**Q:** My Nextcloud instance is stuck in "Maintenance Mode", how can I switch it off?
  To *force exit* the Nextcloud "Maintenance Mode", you can push the hardware button **shortly, once**. The
  NextBox will then switch-off the maintenance mode. Please avoid this, if possible.


.. _USB Documentation: https://www.raspberrypi.org/documentation/hardware/raspberrypi/usb/README.md
.. _NextBox' GitHub: https://github.com/Nitrokey/nextbox-board
.. _nextbox.local: http://nextbox.local
.. _External storage support: https://docs.nextcloud.com/server/20/admin_manual/configuration_files/external_storage_configuration_gui.html
.. _RPi Power Supply: https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md
.. _typical bare-board power consumption: https://www.raspberrypi.org/documentation/hardware/raspberrypi/power/README.md
.. _Putty Documentation: https://www.ssh.com/academy/ssh/putty/public-key-authentication
.. _Nextcloud WebDAV documentation: https://docs.nextcloud.com/server/20/user_manual/en/files/access_webdav.html


