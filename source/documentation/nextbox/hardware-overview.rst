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

1. Hardware button for :doc:`Factory-Reset<technical/factory-reset>`
2. :doc:`Status LED<technical/led-colors>`

   .. figure:: /nextbox/images/hardware-overview/back-side.jpg
      :alt: back view
      :align: center

3. **USB Type-C / Power Supply** connector is designated as a replacement for the stock
   connector on the front side and is exclusively for supplying power to the NextBox and cannot 
   transfer data.


   .. hint:: The right side of the NextBox is designed so that all mandatory
            interfaces can be accessed from this side. 

   .. figure:: /nextbox/images/hardware-overview/right-side.jpg
      :alt: right view
      :align: center

4. The **RJ45 - 1GbE Ethernet** connector connects your NextBox with your home network and shall 
   stay connected at all times. 
5. **Free USB 3 - Type A Slot**, please see `Hardware FAQ`_
6. **Reserved USB 3 - Type A Slot**, used for the internal hard-disk. *Never remove this connector!*
7. **2x Free USB 2 - Type A Slots**, please see `Hardware FAQ`_

   .. hint:: Using a hard-drive with an external power supply you can use any of
            the available USB slots. Keep in mind that the data transfer bandwidth for
            the USB 2 slots is less compared to the USB 3 slot. 

8. **USB Type-C / Power Supply** (stock) connector, can be used as **[3]**
9. **Micro HDMI 1 slot**, usable but not needed.
10. **Micro HDMI 2 slot**, usable but not needed.
11. **Headphone Jack**, usable but not needed.

   .. figure:: /nextbox/images/hardware-overview/front-side.jpg
      :alt: front view
      :align: center

.. hint:: The front interfaces are all optional and not necessary for NextBox
          usage in general. While the **USB Type-C/Power Supply** may be used, the
          alternative on the right side of the NextBox can be used to have all wiring
          convenient on one side.






.. _Hardware FAQ: faq/hardware.html#why-must-i-not-connect-external-hard-drives-without-an-external-power-supply-to-my-nextbox