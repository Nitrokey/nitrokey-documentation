Generic FAQ
===========

.. faq:: What to do if my NextBox doesn't start?

  If your NextBox doesn't start correctly or you have some other problem using
  it, chances are a soft reset can fix it:
  :doc:`../technical/soft-reset`. To press the button use a thin (~1mm) pin
  like a smartphone sim-card tray removal device.
  If this doesn't help, please make sure you have connected the NextBox correctly
  as described in Quickstart: :doc:`../gettingstarted`.
  Otherwise you can try a factory reset: :doc:`../technical/factory-reset` as long
  as your NextBox doesn't contain any data you care about losing.
  If everything fails, please contact our customer support. Do note that our
  ability to help you might be limited if you changed your system configuration
  using for example ssh.

.. faq:: How can I factory-reset my NextBox?

  Press the hardware button for 5 seconds, see
  :doc:`../technical/factory-reset`. To press the button use a thin (~1mm) pin
  like a smartphone sim-card tray removal device.

.. faq:: What do the different LED colors mean?

  The detailed document can be found here: :doc:`../technical/led-colors`

.. faq:: Can the inital setup be done using a monitor & keyboard?

  No, this is not possible as the regular login is disabled on delivery. Please
  connect the the NextBox to a network and access the NextBox using
  `nextbox.local`_ or the IP directly.

.. faq:: What is the typical power consumption?

  The minimum of 0,6A (3W) is rarely reached, in idle mostly around 1A (5W) and
  more than 2A (10W) under higher loads. 

.. faq:: How secure is the NextBox?

  Debian with frequent `unattended-upgrades` based security updates, a minimal
  attack surface by ensuring that not a single unneccessary port is open 
  are the main contributors to system security. **Make sure your Nextcloud users 
  and passwords are on a high level, either with long-random passwords or a 
  2-Factor-Authentification supported login method with e.g., a Nitrokey FIDO2.**


.. faq:: What do all the ssh-related "warnings" mean?

  Once you set up your ssh-access, you make yourself technically responsible for
  your NextBox. We do provide help as good as we can as goodwill, but under the
  line we cannot provide generic Linux-administration support outside of the
  intended NextBox use-cases.

.. faq:: Can I mirror my NextBox onto another NextBox?

  This translates to a cluster setup, which is considered an (paid) enterprise
  solution by Nextcloud. The details, especially data consistency and collision
  handling, are far from trivial to realize. Nevertheless, we also see demand
  for more sophisticated backup solutions and will address this issue.

.. faq:: What to do to run/install/fix Nextcloud App "XYZ"? Why does Nextcloud feature XYZ not work?

  Generally we cannot help in detail for these topics. Nextcloud internals and
  apps are out-of-scope for the NextBox development as we use the stock Docker
  images provided by Nextcloud. Ultimately, if some NextBox/OS configuration is
  blocking an app to run properly we for sure will look into fixing it.

.. faq:: Can I connect/use the NextBox using WiFi? 

  No, currently this is not (easily) possible, only wired ethernet using RJ-45
  is available.

.. faq:: Is the WiFi on the Raspberry PI 4B physically available and working?

  Yes, physically the WiFi is available and working, but not used/managed by the
  NextBox App. If you know what you are doing you can configure and use it, if
  works although being inside the NextBox casing. 



.. _nextbox.local: http://nextbox.local

