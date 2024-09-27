Dynamic DNS Setup
========================

.. contents:: :local:

**There are two ways to configure a dynamic DNS provider to be used and updated
by your NextBox instance.**

In contrast to the :doc:`backwards proxy <proxy>` remote access method, this
approach will ensure full end-to-end encryption using your very own TLS
certificate acquired from `Let's Encrypt`_.


Guided Dynamic DNS
------------------

The guided setup will register an account at `desec.io`_ for you. Please follow
these steps to configure your NextBox using the Guided Dynamic DNS method:

* In step one you need to provide an e-mail address and the domain you would
  like to register.  Please make sure that you have access to this e-mail
  account and the domain ends with **.dedyn.io**. *You can continue to the next
  step by registering at `desec.io`_ or without (e.g., if you have already
  registered this domain before)*

* After the registration at `desec.io`_ you will receive a verification e-mail,
  which will guide you through the registration process at `desec.io`_. Once
  completed you will be presented with a secret token, which is needed in step
  two.

.. hint:: If you do not receive a verification e-mail try `reset password`_
   (using the same e-mail address) at `desec.io`_ to set a password, which will
   allow you to login into your account.

* In step two the just acquired secret token shall be inserted into the input
  field to complete your guided dynamic dns configuration.

.. hint:: Your token will only be presented once to you (after the verification
   process).  If you need a new token, you need to create a new one inside the
   `token management`_ inside your `desec.io`_ account settings.

* Once the 2nd step is completed you can *Continue to TLS activation* - see below...

Custom Dynamic DNS
------------------

To update your dynamic DNS provider with your currently used IP(s), NextBox is
using `ddclient`_, which can be directly configured here or via the *Guided
DNS* method described before.

In this configuration you need the provide the *domain* this configuration is
enabling and the contents of the `ddclient.conf` used by `ddclient`_. Various
examples can be found at the `official documentation`_, the one used for the
guided DNS configuration uses the following template:

.. code-block:: none

    daemon=300
    protocol=dyndns2
    use=cmd, cmd='curl https://checkipv4.dedyn.io'
    ssl=yes
    server=update.dedyn.io
    login=[domain]
    password='[token]'
    [domain]

* Once you actiavted this configuration, you can *Continue to TLS activation* -
  see below



Enable TLS
----------
On this page first wait for the status-bars to settle and mainly ensure that
*reachability* of your NextBox is tested successfully. If this is the case,
just click **Enable TLS** to acquire your TLS certificate.

.. note:: If the reachibility test fails, make sure your :doc:`port forwarding <port-forwarding>` is configured properly.



.. _Let's Encrypt: https://letsencrypt.org
.. _desec.io: https://desec.io
.. _reset password: https://desec.io/reset-password
.. _token management: https://desec.io/tokens
.. _ddclient: https://ddclient.net/
.. _official documentation: https://ddclient.net/usage.html


.. There are several ways to enable remote access to the NextBox. The easiest way is to use the "Quickstart Configuration".
    
   Quickstart Configuration (recommended)
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
   1. Go to "Remote Access" in the NextBox app.
   
   .. figure:: /components/nextbox/images/gettingstarted/5.png
      :alt: img5
      
   2. Click on "Quickstart Configuration (recommended)".
   
   .. figure:: /components/nextbox/images/gettingstarted/6.png
      :alt: img6
      
   3. Enter your desired domain name consisting of at least 4 characters and ending with ".nextbox.link".
   
   4. Specify your token received with the NextBox.
   
   .. figure:: /components/nextbox/images/gettingstarted/7.png
      :alt: img7  
   
   5. Click on "Activate Quickstart Remote Access". This process may take a few seconds.
   
   .. figure:: /components/nextbox/images/gettingstarted/9.png
      :alt: img9
      
   6. Go back to Remote Access to check the status about the accessibility of the address.
   
   .. figure:: /components/nextbox/images/gettingstarted/9.5.png
      :alt: img9.5
      
   7. Now your NextBox is reachable via the selected address!
   
   .. figure:: /components/nextbox/images/gettingstarted/10.png
      :alt: img10
    

