Software FAQ
============

.. faq:: What kind of public key is expected for SSH access?

  An openssh style (public) key is expected. Depending on your operating system there are different
  ways to determine your public key. One might be ``ssh-add -L``, another might be 
  ``cat ~/.ssh/id_rsa.pub``. If you are using Putty, please see the `Putty documentation`_.

.. faq:: Can the operating system be extended or configured manually?

  Yes, you can set up ssh access through the NextBox Nextcloud app. Afterwards you can access your
  NextBox using ssh and you can do with the system whatever you want. Obviously we will only provide
  support for the NextBox stock configuration.

.. faq:: Where can I see a changelog for the NextBox versions?

  Currently only here: `Launchpad NextBox`_ 

.. faq:: How can I update the Operating System?

  There is no need to update the NextBox OS by hand. This is done using ``unattended-upgrades`` and
  on top the *nextbox-daemon* will check for upgrades manually (as a redundant fallback solution) 
  on every start. You are free to update your OS by hand using ``apt``, if you know what you are 
  doing.

.. faq:: Is the NextBox running a 32bit or 64bit operating system?

  The used OS is a 64bit system. The ``arch`` output: `aarch64`.

.. faq:: Which users and default passwords are created by default on the NextBox's operating system?

  There is not one single default password set on any (system) user. The only non-system user created
  is named ``nextuser``, without a default password. The only way to access the NextBox is using ``ssh``
  with a public key, which can be set via the NextBox App.


.. _Launchpad NextBox: https://launchpad.net/~nitrokey/+archive/ubuntu/nextbox/+packages
.. _Putty Documentation: https://www.ssh.com/academy/ssh/putty/public-key-authentication


