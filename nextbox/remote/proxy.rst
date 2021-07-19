Backwards Proxy Remote Access
=============================

**This is the fastest and easiest way to make your NextBox available for remote
access.**

The only information to provide is the (sub)domain your NextBox should be
available at.  There is also no need for a port forwarding configuration or any
other setting to be done at your internet router. Although this method is
recommended, please be aware that this method also comes with some drawbacks:

* All traffic is passed through our (backwards) proxy server, thus is not
  end-to-end encrypted.  *In particular, if this server is compromised, your
  traffic might be readable.*

* The same reason also introduces a bandwith bottleneck, if you are connecting
  to your NextBox from within your local area network (LAN). As all traffic has
  to be send to our proxy server and from there to your NextBox, the available
  bandwidth is limited to roughly 50% of your upload or download bandwidth
  (whichever is smaller).


In order to not be affected by these drawbacks you can set up a :doc:`dynamic
DNS provider <dynamic-dns>` or a :doc:`static domain <static>`.

IPv6 to IPv4 Translation
^^^^^^^^^^^^^^^^^^^^^^^^^

If your NextBox is only available through IPv6 (e.g., DS-Lite internet
connection) the backwards proxy might be the only way to access your NextBox
using a non-IPv6 enabled device. As of today e.g., various mobile network
providers do not support IPv6 yet.




.. There are several ways to enable remote access to the NextBox. The easiest way is to use the "Quickstart Configuration".
    
   Quickstart Configuration (recommended)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   1. Go to "Remote Access" in the NextBox app.
   
   .. figure:: /nextbox/images/gettingstarted/5.png
      :alt: img5
      
   2. Click on "Quickstart Configuration (recommended)".
   
   .. figure:: /nextbox/images/gettingstarted/6.png
      :alt: img6
      
   3. Enter your desired domain name consisting of at least 4 characters and ending with ".nextbox.link".
   
   4. Specify your token received with the NextBox.
   
   .. figure:: /nextbox/images/gettingstarted/7.png
      :alt: img7  
   
   5. Click on "Activate Quickstart Remote Access". This process may take a few seconds.
   
   .. figure:: /nextbox/images/gettingstarted/9.png
      :alt: img9
      
   6. Go back to Remote Access to check the status about the accessibility of the address.
   
   .. figure:: /nextbox/images/gettingstarted/9.5.png
      :alt: img9.5
      
   7. Now your NextBox is reachable via the selected address!
   
   .. figure:: /nextbox/images/gettingstarted/10.png
      :alt: img10
    

