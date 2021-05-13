Port Forwarding & Firewall Configuration
========================================

Issue
---------

You have your dynamic DNS correctly set up, but your NextBox is not reachable using the domain. 

Before looking into this topic, make sure your domain correctly resolves to your IP.


Details
-------

For both IPv4 and IPv6 you need to properly configure your internet router to allow access to your 
NextBox. While most internet routers will refer to this configuration as *port forwarding*, in fact
IPv4 based (dynamic) DNS will resolve to your router's IP. But IPv6 in contrast will resolve to a
(globally) unique IP, which refers to your NextBox. 

Therefore in technical terms IPv4 needs port forwarding to be enabled and for IPv6 you need to open
the firewall to allow access to your NextBox. But in reality most routers do not differentiate 
between those and just name it *port sharing* for either IPv4 or IPv6.


Solution
------------

**The port-forwarding and/or firewall rules have to be configured to allow traffic on 
ports 80 (HTTP-Server) and 443 (HTTPS-Server).**

On a recent *Fritz!Box* you will find this configuration inside: "Internet -> Permit Access -> Port Sharing"





