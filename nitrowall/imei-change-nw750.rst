IMEI Change NW750
=================
.. note:: if you factory reseted the device, blue-merle needs to be reinstalled. Seehere https://github.com/srlabs/blue-merle#installation

.. contents:: :local:

For the IMEI Change procedure we use the software blue merle https://github.com/srlabs/blue-merle.
There a diffrent ways to do the IMEI Change the simplest is to use the Toogle on the side of the NW750:

1. Flip the NW750 hardware switch to initiate the first stage of changing your device's IMEI. 
2. Follow the instructions on the display, which will ask you to replace the SIM card at the end.
3. After replacing the SIM card, flip the switch again. The second stage changes the IMEI and then powers off the device. 
4. You should change location before booting again.

For more details see here https://github.com/srlabs/blue-merle/blob/main/Documentation.pdf 

.. note:: Occasionally, commands may take longer than expected to execute on the device. This can result in the display switching off (standby) for a few seconds before displaying the expected final message (e.g. instructions to replace the SIM card). Wait for the final message to appear before pulling the switch again. If no message is displayed after a minute, the script might have exited or you might have missed the message. In this case, pull the switch to continue / restart the process.
