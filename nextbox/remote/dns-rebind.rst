DNS Rebind Protection
=============================

The Issue
---------

You have your dynamic DNS correctly set up, but IPv6 resolving does not work for your domain.


The Why
-------

In general DNS Rebinding protection is a safety mechanism to avoid attacks based
on `DNS-Rebinding`_. Home routers include a protection mechanism for this attack
by never returning a local IP (v4 & v6) address. 

In the context of the NextBox this means that, if you are using IPv6, the IPv6 address
of your NextBox is considered local by your router and thus wiull not be returned 
during DNS resolving of your designated domain.

.. info:: For IPv4 this is actually also happening, but not a problem. In the IPv4 
   world you (dynamic) DNS refers to the router itself and the router will forward
   the traffic to your NextBox. In contrast IPv6 will not resolve to your router but
   to the IPv6 address of your NextBox directly and the router just has to open its
   firewall for the traffic to pass.


The Solution
------------

Most routers, which implement this DNS-Rebind protection also allow you to whitelist certain
domains from this protection.

For instance the setting inside *FritzBoxes* is to be found in: 
Network -> Network-Settings -> Show More. You need to ensure that you have the "extended/expert view"
activated.




.. _DNS-Rebinding: https://en.wikipedia.org/wiki/DNS_rebinding



