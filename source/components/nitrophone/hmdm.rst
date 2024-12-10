Headwind MDM
************

How to install Headwind MDM on NitroPhone
#########################################

.. note::
   
   Depending on whether you are using the paid or gratis license, some features might be available or not.
   (See `feature comparison <https://h-mdm.com/headwind-mdm-version-comparison/>`__ of the community vs. the enterprise version).


.. important::
   
   We recommand to backup your data.


.. note::
   
   Your Nitrophone needs to be connected to the internet during the configuration.


Method 1: regular APK installation
##################################

1. On your Nitrophone donwload and install MDM Agent. 
   You can donwload it on `F-Droid <https://f-droid.org/en/packages/com.hmdm.launcher/>`__ or directly on `HMDM website <https://h-mdm.com/download/>`__

2. Open MDM Agent and select "CONTINUE" and allow to install unknown apps (no need to allow access to Android/obb folder).

3. Go back to the MDM Agent application and select again "CONTINUE" and activate the device admin app.

4. Also allow the application to manage storage (Allow in Settings > Allow access to manage all files).

5. Go back and allow MDM Agent to access the device location while using the app and also to make and manage phone calls.

6. Before finishing the configuration go to: (Settings > Apps) and choose MDM Agent here in the top right corner select the 3 dots and choose "Allow restricted settings".

7. In the same page select "Home app" and choose MDM Agent instead of Launcher.

8. Go back two times at the Apps setting and select "Special app access" and "Display over other apps", here select MDM Agent and allow display over other apps.

Your HMDM app is ready to use, now refer to server configuration.


Method 2: ADB (Android Debug Bridge) install
############################################

1. `Here <https://h-mdm.com/download/>`__ you can download the latest HMDM Android app. 
   It is important that this version matches your HMDM server version and configuration.
   You can also download the desired version here: https://h-mdm.com/files/hmdm-<version>-master.apk

2. Enable developer options (Settings > About Phone > Click 6 times on "Build number").

3. Enable USB debugging (Settings > System > Developer Options > USB debugging).

4. You will need to use Android Debug Bridge (adb), you can download it `here <https://developer.android.com/tools/releases/platform-tools#downloads>`__. 

5. Unzip the downloaded achive and open a terminal in this folder.

6. Connect the smartphone to a PC and change the charging connection to "File transfer".

7. Test if ``adb`` can find your Nitrophone: 

.. code-block:: bash
   
   ./adb devices

You need to see your device listed in the output.

8. Install the HMDM app via:

.. code-block:: bash 
  
  ./adb install <name of your downloaded file>.apk

When the MDM install was sucessful, the output of ``adb`` is "Success".

9. Now give the app device owner rights: 

.. code-block:: bash
 
 ./adb shell dpm set-device-owner com.hmdm.launcher/.AdminReceiver

If it was successful it says:

.. code-block:: bash
   
   Success: Device owner set to package com.hmdm.launcher/.AdminReceiver 
   Active admin set to component com.hmdm.launcher/.AdminReceiver

Your HMDM app is ready to use, now refer to server configuration.

Add your NitroPhone to your HMDM server
#######################################

1. Log into your server web panel and go to the "Configurations" tab and edit or create one configuration.
   For testing purposes you can try the demo server `here <https://app.h-mdm.com/#/login>`__.

2. Make sure that "Use with default launcher" is not selected.  
   Click "Save and close".

3. Now go to Devices and click on the QR code on the right hand side. Note: The QR code contains the configuration for your mobile device.

4. Type in the server URL (e.g. https://app.h-mdm.com/) and click "Scan QR code".

5. In you server web panel, go to your device "Detailed information" by clicking into the 3 dots and verify that there is no red fields on this page.

Your NitroPhone is now properly registered in your HMDM server
