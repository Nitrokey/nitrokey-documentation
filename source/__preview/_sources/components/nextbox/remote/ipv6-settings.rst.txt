IPv6-related Settings
=====================

Issue
---------

You have properly set up one of the DNS configurations, :doc:`port-forwarding`
and :doc:`dns-rebind` and still your NextBox is not available / reachable.

.. hint::
   This is in particular important for Fritz!Box owners and/or DS-Lite internet 
   connections. 


Details
-------

First test your (sub-)domain using a 3rd party service like `IPv6 Test`_ to test 
your NextBox' IPv6 reachability. If this fails this is another indicator that your
IPv6 settings are not correct.



Solution
------------

Some routers might have a bad default configuration for IPv6. Therefore please
ensure that your router is configured to pass IPv6 addresses to your network
clients (called ``IA_NA``), if this not done, no IPv6 connection can be established 
to your NextBox from the outside, thus your NextBox is not reachable.

On a recent *Fritz!Box* you will find this configuration inside: 
"Home Network -> "Network" -> "Network Settings" -> "IPv6 Configuration"
Inside this view inside the section: "DHCPv6 Server in the Home Network" activate:
"Enable DHCPv6 server in the FRITZ!Box for the home network:" and below this the last
radio button has to be active: "Assign DNS server, prefix (IA_PD) and IPv6 address (IA_NA)" 
instead of the default, which is the 1st radio button.



.. _IPv6 Test: https://ready.chair6.net/


