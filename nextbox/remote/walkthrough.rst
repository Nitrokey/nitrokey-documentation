Remote Access Walkthrough 
=========================

.. contents:: :local:

This documentation aims to give you a thorough introduction into the Remote
Access topic, including a decision helper **why to choose a particular
method**. If you are familiar with this topic you might want to jump directly
to :doc:`method-comparison`.

What? Why?
----------

You want to access your NextBox from everywhere, this means you want to access your
NextBox from the internet through your internet router. 

On top of that you want to make sure that your data (traffic) is not readable by 
anyone else despite you. Nowadays this is accomplished by using `HTTPS`_, which is
driven by `TLS`_. 

.. figure:: /nextbox/images/walkthrough/padlock.png
   :alt: padlock-tls
 
Right next to the URL (*nitrokey.com*) you see this small padlock, which translates
to: This website provides an encrypted connection and all your traffic is not 
readable by anyone between your browser (client) and the Nitrokey server.

Once your NextBox is set up properly and you see the dashboard the first time your
URL bar in your browser might look like this:

.. figure:: /nextbox/images/walkthrough/no-padlock.png
   :alt: no-padlock
 
In this case the local IP has been used (``192.168.10.50``), this is specific to your
local network and equal to ``nextbox.local``. The *not secure* and the warning sign
transports the information that your connection is **not encrypted**, thus using 
*http* instead of *https*. For more you can read: `HTTP vs. HTTPS`_.

Obviously, access to the NextBox should be secure, thus encrypted using *https*.
This guide covers the different approaches to reach this goal, depending on 
your specific needs.

Use The Nitrokey Backwards Proxy
--------------------------------

This method is by far the easiest to set up and use to get an encrypted to your
NextBox from everywhere, the only think to do is to go to *Remote Access* and 
*Backwards Proxy* inside the NextBox-App, insert a sub-domain you want to use and
click *Enable Quickstart Remote Access*. From now on you can access your NextBox
using a URL like this:

.. figure:: /nextbox/images/walkthrough/proxy-url.png
   :alt: proxy

The padlock is there---your data (if you are using your ``[subdomain].nextbox.link``
URL) is now encrypted! 

So far so good, but wait, this works, but has two major drawbacks: Performance and 
a chained end-to-end encryption.

Performance
^^^^^^^^^^^

The backwards proxy works like this: Your NextBox connects to the Nitrokey Proxy
server and opens up a (backwards) channel. So even though your NextBox is maybe
standing right next to your computer, the traffic goes all the way from your 
computer, into the internet, to the Nitrokey server and all the way back to your
NextBox. 

Simplified, one could say all the traffic has to travel a long way towards the
NextBox instead of talking directly to the NextBox. This essentially is a
drawback of all proxies. The effect for you as a user is that data transfers 
will be slower, than a direct connection.

Chained End-to-End Encryption
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Another drawback is that your traffic is not fully end-to-end encrypted. To be
clear: Your data is still encrypted, but only on the path from your client
(browser) to the Nitrokey server, there the data will be decrypted and
encrypted again to be sent to the NextBox.

Essentially this means you have to trust Nitrokey, because technically whoever
is controlling this server might read the traffic that goes through it using
this proxy.  Nitrokey would never do such a thing, but there is a certain
remaining risk that someone could compromise this server and read your traffic.

Obviously this can be done in a better way, but still this might be enough depending
on your personal usage scenario.

Acquire Your Own Certificate
----------------------------

This is clearly the best and most secure method to remote access your NextBox
as it will give your the best performance and true end-to-end encryption, but
it comes with some additional configuration needs. We start first with a very
quick introduction what encryption with an own certificate means and what is
needed.

The Certificate Authority
^^^^^^^^^^^^^^^^^^^^^^^^^

A `CA`_, as the name suggests, is *someone* who is able to provide you with a
digital certificate, which will allow you to use `TLS`_, thus encrypt the your
traffic, enabling you to use *https*.

By definition, a `CA`_ is only allowed to issue a certificate, if they can
verify that your are the **owner of a public internet (sub)domain**. This
ownership is a very important property as this, despite the encryption,
additionally allows the client (browser) to verify that the traffic that
is sent by a certain website is really originating from this (sub)domain
and no man-in-the-middle has injected some data, which could compromise 
your client.

This being said, obviously it is not possible to acquire an certificate for
*nextbox.local* or even a local IP, as these are neither public nor unique.

Acquire a public (sub)domain for your NextBox
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The NextBox comes with a feature (:doc:`dynamic-dns`), which allows you
to easily register a public sub-domain for your NextBox using a so-called
*dynamic DNS provider*, here namely `deSEC`_. This particular service is
totally free and a non-profit organization.

This is a very important step prior to acquiring a certificate, as this
sub-domain registered through `deSEC`_ will be public and unique, whose
as we learned are needed to acquire a certificate.

Step-by-Step DNS & TLS
^^^^^^^^^^^^^^^^^^^^^^

This may sound complex, but the NextBox comes with all you need to get
through this process:

1. Navigate to the Nextcloud NextBox-App
2. Click on "Remote Access" -> "Guided Dynamic DNS"
3. Insert a valid e-mail address you have access to into the first input field
4. Insert the full sub-domain your NextBox shall be available through. As `deSEC`_ is 
   used here, your sub-domain always has to end with *dedyn.io*, so something like: 
   ``mynextbox.dedyn.io``
5. Click "Register at deSEC" and the NextBox will try to register your domain and 
   e-mail at `deSEC`_. This may fail, if the sub-domain you chose is already taken,
   please choose another one in this case.
6. You will receive an e-mail in which you should verify that this is your e-mail
   by clicking on the provided link
7. In step two, you will have to input a *token*, which you received after you
   clicked the verification link and completed the captcha.

Now you are the owner of your very own sub-domain. You can try and visit this
subdomain now, but you will see that it will only (best case) end up on your 
internet router. This is because your router is your door to the internet and
it has to be made aware that you want specific traffic to be forwarded to your
NextBox. Please set up :doc:`port-forwarding` on your internet router now, once
this is done, visiting your registered sub-domain in the browser will show you
your NextBox' Nextcloud instance.

Great from here there is just one step remaining:

1. Navigate to the Nextcloud NextBox-App
2. Click on "HTTPS / TLS"
3. Click the button "Enable TLS" 
4. Please wait some moments to acquire your certificate

Shortly after you will be automatically redirected to your now encrypted
NextBox sub-domain, which might look similar to this:

.. figure:: /nextbox/images/walkthrough/dns-url.png
   :alt: dns-url

There we are, your very own sub-domain, certificate and fully end-to-end
encrypted Nextcloud.

If you encounter problems, please read the other articles inside the 
:doc:`Remote Access Section<index>`.


.. _deSEC: https://desec.io/
.. _HTTP vs. HTTPS: https://www.guru99.com/difference-http-vs-https.html
.. _TLS: https://en.wikipedia.org/wiki/Transport_Layer_Security
.. _HTTPS: https://en.wikipedia.org/wiki/HTTPS
.. _CA: https://en.wikipedia.org/wiki/Certificate_authority
