Changing IMEI
=============

To be able to change the IMEI of your device, the software `blue merle <https://github.com/srlabs/blue-merle>`_ is pre-installed.

.. note:: After performing a factory reset, you need to `reinstall <https://github.com/srlabs/blue-merle#installation>`_ blue-merle.

.. contents:: :local:

There a different ways to change the IMEI. The simplest is to use the toogle on the side of the NW750:

1. Switch the hardware toggle.
2. Follow the instructions on the display, which will prompt you to replace the SIM card eventually.
3. After replacing the SIM card, flip the toggle again. This changes the IMEI and powers off your device. 
4. You should change your geographical location before booting again.

For more details see `this documentation <https://github.com/srlabs/blue-merle/blob/main/Documentation.pdf>`_.

.. note:: Occasionally, commands executed on the device may take longer than expected. This can result in the display switching off (standby) for a few seconds before displaying the expected final message (e.g. instructions to replace the SIM card). Wait for the final message to appear before pulling the switch again. If no message is displayed after a minute, the script might have exited or you might have missed the message. In this case, pull the switch to continue / restart the process.
