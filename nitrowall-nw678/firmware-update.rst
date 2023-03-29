Update Openwrt firmware
=======================

.. contents:: :local:

1. we recommend updating the firmware via the preinstalled Attend Sysupgrade  `Openwrt documentation <https://openwrt.org/docs/guide-user/installation/attended.sysupgrade>`_

2. to be able to use this service you need configure it to ignore the nitrowall package if installed before

3. go to System -> Attended Sysupgrade -> Configuration and enable the Advanced Mode + Save & Apply

	.. image:: /images/nitrowall/openwrt_upgrade1.png

4. go back to Overview and Search for a available updates

	.. image:: /images/nitrowall/openwrt_upgrade2.png

5. search through the list of installed packages and remove the nitrowall package -> Then Request Firmware Image

	.. image:: /images/nitrowall/openwrt_upgrade4.png

6. Wait for the Image to be Build -> then install it. Check if "keep settings and current configuration" is set

	.. image:: /images/nitrowall/openwrt_upgrade5.png


7. The firmware will be installed and the nitrowall will be rebooting

8. after that is done we need to reinstall the `nitrowall.ipk <https://www.nitrokey.com/files/ci/nitrowall/nitrowall_1.0.0-0_x86_64.ipk>`_ .  This will resize your disk again an re add the Kernelparameter *pcie_aspm=off* to our */boot/grub/grub.cfg* 	this fixes a problem with the igb driver `Bug <https://bugzilla.kernel.org/show_bug.cgi?id=205073>`.

9. under System -> Software -> Upload Package Upload the package 

	.. image:: /images/nitrowall/openwrt_installnw2.png
	.. image:: /images/nitrowall/openwrt_installnw1.png

	
10. Install after that the Nitrowall will reboot 

	.. image:: /images/nitrowall/openwrt_installnw3.png
	
12. you can also do that manual if you don't want to do the install Login on the console via ssh and execute this script::

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
	
