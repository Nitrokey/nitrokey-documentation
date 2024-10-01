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
   `privacy screen <https://shop.nitrokey.com/shop/category/smartphone-tablet-4>`__.
   To enable, select: *Settings -> Security -> PIN scrambling -> Scramble PIN*

**Q:** What is a *Kill Switch* and how to activate it?
   Kill Switches, which erase all the phone's data when triggered, are very risky in 
   practice as they could be triggered unintentionally. Therefore, the NitroPhone instead 
   has the feature to automatically shut down and restart when inactive for a set period of time. 
   This puts the phone in a secure state where all data is encrypted, no data is in RAM, and the 
   phone can only be unlocked with the legitimate PIN or password. To enable, select: 
   *Settings -> Security -> Auto reboot -> select the idle time duration after which the phone should reboot*

**Q:** Why do I get "Warning: Your device is loading a different operating system"?
   .. image:: ./images/boot-screen.jpg
      :alt: Boot screen
      :align: center

   Shortly after the phone is turned on, the warning "Your device is loading a different operating system" 
   is displayed. This warning indicates that no ordinary Google Android is running and can be ignored.

**Q:** How can I check, if my NitroPhone has been hacked/compromised?
   If you want to check the integrity of the operating system, you can use `remote verification <https://attestation.app/about>`_.

**Q:** Where can I get further information about GrapheneOS?
   `Here <https://grapheneos.org/faq>`__ you can find further information on GrapheneOS.

**Q:** Why is OEM unlocking enabled by default?
   The only real purpose of the OEM Unlocking setting is `anti-theft protection <https://grapheneos.org/faq#anti-theft>`__ which is not implemented by GrapheneOS. OEM unlocking controls whether the device can be unlocked via boot loader. In the later case all user data is wiped. If OEM Unlocking is disabled, someone can still boot up in recovery mode, enter the menu, wipe data, then boot the OS and enable OEM unlocking. Therefore it doesn't really increase the security but `disabling it <index.html>`_ reduces the potential physical attack surface.

**Q:** Why do we offer to remove the microphones?
   GrapheneOS informs about active access to the sensors and offers a transparent way to monitor the device. However, physical removal is the only way to completely exclude possible misuse. Especially in the case of a microphone, which allows continuous eavesdropping.

**Q:** Why do we also offer to remove the gyroscope?
   A gyroscope is a sensor that detects the orientation of a smartphone. It not only stabilises the camera, but also tells the smartphone whether it is held in portrait or landscape mode. Additionally the gyroscope can also pick up mechanical vibrations, so it has the functionality of a microphone.

**Q:** Why don't we offer to remove the speakers?
   Microphones are usually used to convert mechanical vibrations into electrical signals. The mechanical construction of loudspeakers is essentially the same as that of microphones, so that loudspeakers can also be used as microphones. In loudspeakers, electrical signals cause the diaphragm to vibrate, thus generating sound. Conversely, this process can be used to transmit the electrical signal from the diaphragm to the device, as with a microphone. However, this method is not possible if an amplifier is installed, as this does not allow the signal to be transmitted from the loudspeaker to the device. All Nitrophones only have speakers with built-in amplifiers and are therefore harmless.

.. _all major carriers: https://support.google.com/pixelphone/answer/7107188?hl=en
