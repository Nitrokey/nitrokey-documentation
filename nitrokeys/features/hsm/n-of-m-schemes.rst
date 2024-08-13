N-of-m Schemes
==============

.. include:: index.rst
	:start-after: products-begin
	:end-before: products-end

The Nitrokey HSM 2 supports two different n-of-m schemes - one for secure sharing of key material/passwords and one for public key authentication to control the access to the device. Please see `this blog post <https://www.smartcard-hsm.com/2015/10/10/Shared_Control_over_Key_Usage.html>`__ for more detailed information.

N-of-m for DKEK Shares
''''''''''''''''''''''

This feature can be used with OpenSC as described `here <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#using-key-backup-and-restore>`__. The general approach is seen in the videos below (external links).

Nitrokey HSM's Secure Key Backup and Restore:

.. raw:: html

 <a href="https://asciinema.org/a/152957" target="_blank"><img src="https://asciinema.org/a/152957.svg" /></a>


.. only:: comment

   <script id="asciicast-152957" src="https://asciinema.org/a/152957.js" async></script>
.. only:: comment

 <iframe width="560" height="315" src="https://asciinema.org/a/152957" frameborder="0" allowfullscreen></iframe>

Nitrokey HSM's M-of-N Threshold Scheme:

.. raw:: html

 <a href="https://asciinema.org/a/153021" target="_blank"><img src="https://asciinema.org/a/153021.svg" /></a>

.. only:: comment

   <iframe width="560" height="315" src="https://asciinema.org/a/153021" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

N-of-m for public key authentication
''''''''''''''''''''''''''''''''''''

So far n-of-m authentication is only supported in OpenSCDP. `The blog post <https://www.smartcard-hsm.com/2015/10/10/Shared_Control_over_Key_Usage.html>`__ gives an overview and a how-to `here <https://devnet.cardcontact.de/documents/7>`__ (CDN access required) is shown the process step by step in the Smart Card Shell.

N-of-m authentication is also supported in the `PKI-as-a-Service Portal <https://www.smartcard-hsm.com/2018/02/13/pki-as-a-service.html>`__ for locally and remote connected HSMs. The PKI-as-a-Service Portal is based on OpenSCDP.

