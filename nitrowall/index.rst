NitroWall
============================

Getting Started
---------------

1. Connect the NitroWalls LAN1 port by a patch cable with the ethernet port of your Laptop or PC
2. Connect the NitroWall by power supply
3. Turn on the NitroWall by I/O switch on the front side 
4. After booting (The NitroWall beeps accordingly) it is available via https://192.168.1.1/. 
   You'll get an IP address from the DHCP-Server automatically

- Login: root
- Password: opnsense

.. figure:: ./images/nitrowall_back.jpg
 :alt: NitroWall backside
        
 NitroWall back side

.. figure:: ./images/nitrowall_front.jpg
 :alt: NitroWall frontside
        
 NitroWall front side

After logging in you are at the admin dashboard of the NitroWall:

.. figure:: ./images/dashboard.png
 :alt: dashboard
        
 NitroWall dashboard

Start the system wizard via the menu of the lefthand side: system →  system wizard → setup. The
wizard is going trough the configuration with you step-by-step.



.. toctree::
   :maxdepth: 1
   :glob:

   #faq.rst
   #gettingstarted/index.rst 

After configuring your NitroWall reload it to make the changes persistent. As soon as the process terminates
you are back again at the dashboard.

.. figure:: ./images/reload.png
 :alt: reload
        
 Reload the NitroWall

