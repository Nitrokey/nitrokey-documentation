NitroPhone FAQ
===============

**Q:** Does the Nitrophone work with my carrier network?
   Google claims `all major carriers`_ should work with the Pixel phones. Nevertheless
   there might be exceptions, obviously we cannot check `all` carriers around the world.
   Best practice, is to check if you find some tests/experience stories about the Pixel 4a
   together with your planned carrier network.

**Q:** What is and how to activate *PIN Layout Scrambling*
   To make it difficult for strangers to read the PIN when typing it in, you can
   display the PIN layout in a random order. Additionally, we recommend a
   `privacy screen <https://shop.nitrokey.com/shop/product/privacyscreen-for-nitrophone-1-194>`__.
   To enable, select: *Settings -> Security -> PIN scrambling -> Scramble PIN*

**Q:** What is a *Kill Switch* and how to activate it?
   Kill Switches, which erase all the phone's data when triggered, are very risky in 
   practice as they could be triggered unintentionally. Therefore, the NitroPhone instead 
   has the feature to automatically shut down and restart when inactive for a set period of time. 
   This puts the phone in a secure state where all data is encrypted, no data is in RAM, and the 
   phone can only be unlocked with the legitimate PIN or password. To enable, select: 
   *Settings -> Security -> Auto reboot -> select the idle time duration after which the phone should reboot*

**Q:** Why do I get "Warning: Your device is loading a different operating system"?
   .. image:: /nitrophone/images/boot-screen.jpg
      :alt: Boot screen
      :align: center

   Shortly after the phone is turned on, the warning "Your device is loading a different operating system" 
   is displayed. This warning indicates that no ordinary Google Android is running and can be ignored.

**Q:** How can I check, if my NitroPhone has been hacked/compromised?
   If you want to check the integrity of the operating system, you can use `remote verification <https://attestation.app/about>`__.

**Q:** Where can I get further information about GrapheneOS?
   `Here <https://grapheneos.org/faq>`__ you can find further information on GrapheneOS.


.. _all major carriers: https://support.google.com/pixelphone/answer/7107188?hl=en
