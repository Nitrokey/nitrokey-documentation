How to Fix NTP
==============

By default, the NitroWall arrives at your site with a pre-configured NTPd server. The firewall blocks all access that does not occur via a LAN interface. If you have large deviations in the system time, you can fix them as follows:

1. Set the time to match your time zone via the cmdline interface (reboot required) using `date`
2. Switch to the OPNsense GUI again
3. Go to Menu → Services → Network Time → General
4. Set "Interfaces" from "All (recommended)" to "LAN" (Or WAN if you are connected via WAN interface)
5. Restart the service e.g. by the restart button in the top-right corner



 .. figure:: ./images/ntp-one.png
  :alt: Set Interface to LAN

 .. figure:: ./images/ntp-two.png
  :alt: NTP restart
