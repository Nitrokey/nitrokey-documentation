Managing Remote Access 
======================

Your NextBox comes with different options on how to enable access to your
NextBox from any remote location as long as you have an internet connection
available.

.. hint:: Even though the *Backwards Proxy* remote access method is a quick
   way to realize remote access, we **strongly recommend** to use a 
   :doc:`dynamic DNS setup<dynamic-dns>` or :doc:`static DNS setup<static>` 
   to maintain the best security level for your NextBox. *In most usage
   scenarios the latter will also provide a better data bandwidth and user 
   experience*
   
There are different ways to make your NextBox available for remote access.

.. toctree::
   :maxdepth: 1
   :glob:

   Backwards Proxy <proxy>
   Dynamic DNS <dynamic-dns>
   Static Domain <static>

The following topics might be of interest for you, depending on your internet service
provider and the type of your internet connection:

.. toctree::
   :maxdepth: 1
   :glob: 

   DNS Rebind <dns-rebind>
   Port Forwarding <port-forwarding>

Comparing Methods For (Remote) Access 
-------------------------------------

Non-encrypted 
^^^^^^^^^^^^^
* simple (``http``) using either ``nextbox.local`` or your local IP (e.g.: ``192.168.178.123``)
* Generally a bad idea, this will not encrypt the transported data in any way and is only useful 
  in a setup where you do not want remote access to your NextBox (having non-encrypted traffic 
  inside your LAN might be no problem, as long as you know what you are doing)
* Data path: [NextBox] ⟷   [Router] ⟷  [Client]
* **Pro:** fast, no configuration
* **Contra:** no transport security, no remote access (or only unencrypted)

Nitrokey's Reverse Proxy  
^^^^^^^^^^^^^^^^^^^^^^^^

* Provides transport encryption between your clients and your NextBox.  But
  with the drawback that it is not End-To-End encrypted, means the traffic will
  be decrypted at the Nitrokey Proxy Server and passed onward with another
  encryption. Thus a compromised proxy server might allow access to your
  traffic to the potential attacker. 
* The proxy server is a bottleneck and all traffic has to go through the proxy
  server, even if you are in a local network together with the NextBox the
  traffic has to go through the proxy server.
* Data path (local client): [NextBox] ⟷  [Router]⟷  [Proxy Server] ⟷   [Router] ⟷   [Client]
* Data path (remote client): [NextBox] ⟷  [Router]⟷  [Proxy Server] ⟷   [Client]
* **Pro:** easy to setup, good transport security
* **Contra:** not strictly end-to-end encrypted, potentially slow (all traffic through the proxy)

DNS-based
^^^^^^^^^

* Clearly the *best* method, but also the one requiring some configuration work
  on your internet router.
* You get your *own* (sub)domain and a TLS certificate, thus all your traffic will always
  be end-to-end encrypted and you maintain the highest level of security for your traffic.
* Opening the right ports on your internet router is necessary, see :doc:`here<remote/port-forwarding>`
* Data path: [NextBox] ⟷   [Router] ⟷  [Client]
* **Pro:** best performance, highest security, full end-to-end encryption
* **Contra:** needs (dynamic) DNS, needs configuration on your internet router

