Comparing Methods For (Remote) Access 
========================================

.. contents:: :local:

DNS-based
^^^^^^^^^

.. hint:: This is clearly the best and most secure approach and we recommend using a
   DNS-based remote-access method including your own TLS certificate for the best
   security

This denotes the :doc:`dynamic-dns` and the :doc:`static` approach.

* Clearly the *best* method, but also the one requiring some configuration work
  on your internet router.
* You get your *own* (sub)domain and a TLS certificate, thus all your traffic will always
  be end-to-end encrypted and you maintain the highest level of security for your traffic.
* Opening the right ports on your internet router is necessary, see :doc:`here<port-forwarding>`
* Data path: [NextBox] ⟷   [Router] ⟷  [Client]
* **Pro:** best performance, highest security, full end-to-end encryption
* **Contra:** needs (dynamic) DNS, needs configuration on your internet router



Non-encrypted 
^^^^^^^^^^^^^

.. warning:: We strongly recommend to not use the non-encrypted setup, if you plan to make your
   NextBox available outside of your local area network.

* simple (``http``) using either ``nextbox.local`` or your local IP (e.g.: ``192.168.178.123``)
* Generally a bad idea, this will not encrypt the transported data in any way and is only useful 
  in a setup where you do not want remote access to your NextBox (having non-encrypted traffic 
  inside your LAN might be no problem, as long as you know what you are doing)
* Data path: [NextBox] ⟷   [Router] ⟷  [Client]
* **Pro:** fast, no configuration
* **Contra:** no transport security, no remote access (or only unencrypted)


Further, once you set up TLS and thus a DNS-based method, the unencrypted
connection for your NextBox will be disabled, this is not the case for the
Reverse Proxy as a problem with the proxy would then lock you out of your
NextBox.


Nitrokey's Reverse Proxy  
^^^^^^^^^^^^^^^^^^^^^^^^

This refers to the :doc:`proxy` method.


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


.. hint:: Non end-to-end encrypted does still mean all your traffic is indeed
   encrypted, but within the proxy server, in order to be forwarded the traffic
   will be decrypted once and encrypted again before being passed to the client
   or NextBox

