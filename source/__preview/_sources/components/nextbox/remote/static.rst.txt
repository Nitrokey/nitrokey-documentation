Static DNS Configuration 
=============================================

This configuration shall be used, if you configured DNS and thus a domain
for your NextBox in e.g., your internet router.

In contrast to the :doc:`backwards proxy <proxy>` remote access method, this approach
will ensure full end-to-end encryption using your very own TLS certificate acquired from
`Let's Encrypt`_.

In order to use the configured domain with your NextBox and its Nextcloud 
instance you must provide the full domain here to trust this domain inside 
your Nextcloud instance.

For instance inside a "Fritz!Box" this can be done by navigating to: 
"Internet -> Permit Access -> DynDNS" and configuring a dynamic DNS provider
of your choice.


.. _Let's Encrypt: https://letsencrypt.org


