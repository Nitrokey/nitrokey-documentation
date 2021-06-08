Hardware Overview
==========================

.. contents:: :local:

Summary
-------

A NextBox consists of the following hardware components:

* Raspberry PI 4 Type B 
* Nitrokey NextBox (aluminum) case
* Internal hard-drive (SSD or HDD)
* NextBox Reset Shield
* Various smaller parts (internal wiring, connectors)

The casing is made out of aluminum and a passive thermal design.
There are no glued components and the case can easily be opened using a
Phillips screwdriver.  Please keep in mind that opening the case will void your
warranty and it is generally not recommended to open the case for the
non-professional user, especially as this might damage the thermal conductivity
and therefore the heat dissipating capabilities of the NextBox might suffer.

Connectors and Interfaces
-------------------------

In general the NextBox exposes all ports, which are available on the Raspberry PI 4 and one additional 
USB Type C port for a better accessible power supply connector. In the following a short description of 
the different connectors and interfaces is given.

Back View
^^^^^^^^^^

The back of the NextBox only shows the :doc:`Status LED<technical/led-colors>` and the hardware
button to :doc:`Factory-Reset<technical/factory-reset>` the NextBox.


.. figure:: /nextbox/images/hardware-overview/back-side.jpg
   :alt: back view
   :align: center


Right View
^^^^^^^^^^

The right side of the NextBox is designed so that all mandatory interfaces can be accessed from 
this side. The **USB Type-C / Power Supply** connector is designated as a replacement for the stock
connector on the front side and is exclusively for supplying power to the NextBox and cannot 
transfer data.

The **RJ45 - 1GbE Ethernet** connector connects your NextBox with your home network and shall 
stay connected at all times. 

.. figure:: /nextbox/images/hardware-overview/right-side.jpg
   :alt: right view
   :align: center

Further all (free) USB slots are usable, both USB 2 and USB 3. You can connect e.g., USB Sticks for 
quick data access from within your Nextcloud instance. Please make sure that, if you connect a 
hard-disk, *always use a hard-drive with an external power supply**. Using a hard-drive with an
external power supply you can use any of the available USB slots. Keep in mind that the data 
transfer bandwidth for the USB 2 slots is less compared to the USB 3 slot. 

Additionally, always make sure that the **reserved** USB slot is not disconnected, as this is the
slot which is used to connect the internal NextBox hard-drive.

Front View
^^^^^^^^^^

The front interfaces are all optional and not necessary for NextBox usage in general. While the
**USB Type-C/Power Supply** may be used, the alternative on the right side of the NextBox can 
be used to have all wiring convenient on one side.

.. figure:: /nextbox/images/hardware-overview/front-side.jpg
   :alt: front view
   :align: center

The other connectors (both Micro HDMI and the Headphone Jack) are functional, but are not 
used by the stock NextBox Software, thus not needed.





