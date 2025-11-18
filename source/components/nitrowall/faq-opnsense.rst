FAQ OPNSense
============

.. faq:: How to set up a LAN bridge?:

	Details on how to set up a LAN bridge you can find `here <https://docs.opnsense.org/manual/how-tos/lan_bridge.html>`__.

.. faq:: How to set up IDS/IPS with Suricata:

	OPNSense uses Suricata to provide an IPS/IDS Service.
	Suricata is already installed and running after initial configuration.

	You find the administration, monitoring and logging settings via "Services -> Intrusion Detection".

	More information on how to configure IDS/IPS are available `here <https://docs.opnsense.org/manual/ips.html>`__.

.. faq:: How to use NitroWall as combined DHCP-Client/DHCP-Server:

	.. warning:: Note the correct mapping of interfaces to physical ports: Interfaces → Assignments

	1. In "System → Wizard → Configure WAN Interface" set the value for  IPv4 Configuration Type to DHCP
	2. Follow `this guide <https://docs.opnsense.org/manual/dhcp.html#using-dhcpv4>`_ to configure the LAN interface for DHCP

.. faq:: How to create a backup:

	Information on how to create backups can be found `here <https://docs.opnsense.org/manual/backups.html>`__.

.. faq:: Why is my system time wrong?

	If your system time is wrong try to follow `this documentation <https://docs.opnsense.org/manual/ntpd.html>`__.
