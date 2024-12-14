PuTTY
=====

.. product-table:: nk3 start storage pro hsm

.. contents:: :local:

This mini-howto assumes that the Nitrokey has been initialized and contains cryptographic keys.

**Required on the client side:**

-  `PuTTY <https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html>`__
   or a variant of it

-  `GPG4Win <https://gpg4win.org/>`__ or
   `pageant.exe <https://smartcard-auth.de/download-de.html>`__ with
   Smartcard support from Dr. Peter Koch

-  Optional: `OpenPGP
   Minidriver <https://wald.intevation.org/frs/?group_id=49&release_id=353>`__

**1) Pageant**

start pageant.exe. That this is running is shown in the notification area of the taskbar.

.. figure:: images/putty/1.png
   :alt: img1



A double click opens the view of the current keys.

.. figure:: images/putty/2.png
   :alt: img2



After inserting the key it looks like this.

.. figure:: images/putty/3.png
   :alt: img3



If nothing is displayed here, pageant may have to be restarted or another application is already using the stick. A possibly running pgp-agent must be terminated! Now we only need the public key we want to store in the ssh configuration of the server. Therefore we press CTRL while inserting the stick…

.. figure:: images/putty/4.png
   :alt: img4



and then view the Pageant-PublicKeys.txt.

.. figure:: images/putty/5.png
   :alt: img5



I searched for the ssh-rsa entry of the auth key and added the line on the server to the authorized_keys.

**2) PuTTY**

There is surprisingly little to say about PuTTY itself.

.. figure:: images/putty/6.png
   :alt: img6



“Attempt authentication using Pageant” must be set, which is the default anyway.

That’s it, as soon as you connect to the server while pageant is running and you have the keys, you will be asked for the password of the Crypto-Stick and can log in.

**3) openpgp-minidriver (optional)**

If you are annoyed that Windows reports every time you plug in the stick that no driver could be found for “Smartcard”, you can get rid of it. You just have to install the x86 or x64 version of the above mentioned driver and the smartcard looks like this:

.. figure:: images/putty/7.png
   :alt: img7

