Update OpenWrt Firmware
=======================

.. note:: 
   OpenWrt is currently only available for the NitroWall NW678

.. contents:: :local:

We recommend updating OpenWrt via the pre-installed `Attended Sysupgrade <https://openwrt.org/docs/guide-user/installation/attended.sysupgrade>`_. To be able to use this service you need to configure it to ignore the "nitrowall" package, if it has been installed before:

1. Go to System -> Attended Sysupgrade -> Configuration and enable the Advanced Mode -> Save & Apply

	.. image:: /nitrowall/images/openwrt_upgrade1.png

2. Go back to overview and search for available updates

	.. image:: /nitrowall/images/openwrt_upgrade2.png

3. Search through the list of installed packages and remove the "nitrowall" package. Then Request Firmware Image

	.. image:: /nitrowall/images/openwrt_upgrade4.png

4. Wait for the image to be build. Then install it. Check if "keep settings and current configuration" is set

	.. image:: /nitrowall/images/openwrt_upgrade5.png

5. The software will be installed and the NitroWall will restart.

6. After the restart we need to reinstall the `nitrowall.ipk <https://www.nitrokey.com/files/ci/nitrowall/nitrowall_1.0.0-0_x86_64.ipk>`_ package. This will resize your disk and add the kernel parameter *pcie_aspm=off* to your */boot/grub/grub.cfg* which fixes a problem with the *igb* driver `bug <https://bugzilla.kernel.org/show_bug.cgi?id=205073>`_.

7. Under System -> Software -> Upload Package, upload the package 

	.. image:: /nitrowall/images/openwrt_installnw2.png
	.. image:: /nitrowall/images/openwrt_installnw1.png

	
8. Install it. Afterwards the NitroWall will restart.

	.. image:: /nitrowall/images/openwrt_installnw3.png

9. Update OpenWrt via `Attended Sysupgrade <https://openwrt.org/docs/guide-user/installation/attended.sysupgrade>`_.

Alternatively to the above instructions, you can login via ssh and execute this script::

	#!/bin/sh
	BOOT="$(sed -n -e "/\s\/boot\s.*$/{s///p;q}" /etc/mtab)"
	DISK="${BOOT%%[0-9]*}"
	PART="$((${BOOT##*[^0-9]}+1))"
	ROOT="${DISK}${PART}"
	echo "INFO: resize partion ${ROOT}"
	parted -s -a opt ${DISK} "resizepart ${PART} 100%" 
	LOOP="$(losetup -f)"
	losetup ${LOOP} ${ROOT}
	echo "INFO: resize filesytem ${ROOT}"
	fsck.ext4 -y -f ${LOOP}
	resize2fs ${LOOP}
	echo "INFO: add pcie_aspm=off as boot parameter"
	sed -i s/rootwait/rootwait\ pcie_aspm=off/g /boot/grub/grub.cfg
	reboot
