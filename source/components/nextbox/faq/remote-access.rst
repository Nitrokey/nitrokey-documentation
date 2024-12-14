Remote Access FAQ
=================

.. faq:: What is the correct WebDAV URL?

  The full URL to use for WebDAV is:
  ``https://my.domain.tld/remote.php/webdav/``, there have been reports that
  for native Windows WebDAV you might need:
  ``https://my.domain.tld/remote.php/dav/files/USERNAME`` with *USERNAME* being
  the username you would like to use.

.. faq:: Can I access my Nextcloud instance using WebDAV?

  Yes, please see `Nextcloud WebDAV documentation`_ for a complete overview. A
  simple mount for unix-like systems might look like this: ``mount -t davfs
  https://my.domain.tld/remote.php/webdav/ /mnt/target/path`` while making sure
  that the ``davfs2`` package is installed. For Windows please additionally
  read these :doc:`docs <../clients/windows>`.

**Q:**: Why does my Android smartphone's browser not open: ``http://nextbox.local`` 
  As of today the technology needed to use ``.local`` URLs is not supported by various (stock)
  Android browser(s). The mechanism is based on ``mDNS``. One possible workaround is to use a
  3rd party app like BonjourBrowser to discover all mDNS services in your network.

**Q:**: Why does accessing my NextBox using: ``http://nextbox.local`` not work?
  There are several other reasons why the access using ``http://nextbox.local`` may not work, 
  further known scenarios are: 
  
  * Using a Fritz!Box with the NextBox being connected via a LAN port and the client/browser is
    connected to the network via WiFI (WLAN), the Fritz!Box will block mDNS.

**Q:**: I followed all guides and still cannot acquire the TLS certificate, what can I do? 
  The reason a TLS certificate cannot be acquired is nearly always the fact that
  your NextBox is not reachable from the internet. Make sure you have followed
  the :doc:`../remote/walkthrough`. If you followed the step-by-step
  instructions and it still does not work, very likely something is blocking the
  connection, typical candidates are router web administration features like:
  ``MyFritz!``, ``Fritz Web Services`` or similar services, which are running on
  your router and thus blocking the traffic on port(s) 80 and/or 443. Switch
  them off and retry acquiring your TLS certificate.

.. faq:: Why is my reachability with IPv4 not working? 

  If you have properly set up :doc:`port forwarding <../remote/port-forwarding>`
  and IPv4 connections (reachability test) are still not working there are good
  chances that your Internet-Service-Provider (ISP) does not provide a proper
  (public) IPv4 address to you. There are several (end-customer) internet
  technologies, which do not allow incoming traffic for the IPv4, which was
  assigned to you. An incomplete list is: *private IPv4 address*, *DS-Lite
  connection* or *CarrierGrade-NAT (CG-NAT)*. All these essentially share one
  IPv4 address accross multiple users, thus block (incoming) traffic from the
  internet to you. Some ISPs allow upgrading to so-called **full-stack
  connections**, which should enable full bi-directional traffic for IPv4 and
  IPv6.

.. faq:: Why do some devices fail to connect for my IPv6 configured NextBox?

  Sadly, still not all ISPs and mobile-network providers (smartphones) do have
  full IPv6 support activated. This means, if your NextBox is configured for IPv6
  only access, devices inside these networks will not be able to connect. The
  **backwards-proxy does work as a workaround here**, as it provides an IPv4
  entrypoint to your NextBox independant of your other remote access
  configuration.




.. _Nextcloud WebDAV documentation: https://docs.nextcloud.com/server/20/user_manual/en/files/access_webdav.html


