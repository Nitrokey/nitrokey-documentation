Launcher App Installation
#########################

.. important::
   
   We recommand to backup your data before installing MDM.

Your NitroPhone needs to be connected to the internet during the configuration and you also need a PC.

To grant special permissions you need to use ADB (Android Debug Bridge). You can use ADB directly from your web browser with WebADB (easier, recommended), or you can install the CLI tool on your computer (alternative). WebADB is currently only compatible with Chromium-based browsers (e.g. Chrome, Microsoft Edge, Opera).

Installation With WebADB
========================

1. Download the latest launcher app, provided by Nitrokey.
   It is important that this version matches your HMDM server configuration.

2. On your NitroPhone, enable the developer options: Settings -> About Phone -> Press 6 times on "Build number".

3. Enable USB debugging: Settings -> System -> Developer Options -> USB debugging.

4. Connect the smartphone to the PC and change the charging connection to "File transfer".

5. On your PC go to `WebADB <https://app.webadb.com/>`__.

6. At the top left of the page click on "Add" select your NitroPhone and click on "Connect" and click again on "Connect" next to "Add"

7. On your NitroPhone allow the connection.

8. In the WebADB menu choose "Install APK", click on "Open", and choose the previously downloaded APK.

9. Once completed, in the WebADB menu choose "Interactive Shell".
   If you have this error: "Application error: a client-side exeption has occurred" refresh the page or click to "File Manager" and go back to "Interactive Shell".
   If you see ``<your android version name>:/ $`` then you are properly connected.

10. In the shell type: 

    .. rstcheck: ignore-next-code-block
    .. code-block:: bash
   
       dpm set-device-owner com.hmdm.launcher/.AdminReceiver

    If it was successful it says:

    .. rscheck: ignore-next-code-block
    .. code-block:: bash
      
       Success: Device owner set to package com.hmdm.launcher/.AdminReceiver 
       Active admin set to component com.hmdm.launcher/.AdminReceiver

11. Now you can open "MDM agent" on your NitroPhone. If any permissions are asked, allow them.

Your HMDM app is ready to use. Refer to "Register NitroPhone on HMDM Server" at the end of this page.

Installation With ADB 
=====================

1. Download the latest launcher app, provided by Nitrokey. 
   It is important that this version matches your HMDM server configuration.

2. On your NitroPhone, enable the developer options: Settings -> About Phone -> Press 6 times on "Build number".

3. Enable USB debugging: Settings -> System -> Developer Options -> USB debugging.

4. On your PC, `download <https://developer.android.com/tools/releases/platform-tools#downloads>`__ ADB.

5. Unzip the downloaded archive and open a terminal in this folder.

6. Connect the NitroPhone to the PC and change the charging connection to "File transfer".

7. Test if ``adb`` can find your NitroPhone: 

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash
      
      ./adb devices

   You need to see your device listed in the output.

8. Install the HMDM app via:

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash 
   
      ./adb install <name of your downloaded file>.apk

   When the MDM installation was sucessful, the output of ``adb`` is "Success".

9. Now give the app device owner rights: 

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash
   
      ./adb shell dpm set-device-owner com.hmdm.launcher/.AdminReceiver

   If it was successful it says:

   .. rstcheck: ignore-next-code-block
   .. code-block:: bash
      
      Success: Device owner set to package com.hmdm.launcher/.AdminReceiver 
      Active admin set to component com.hmdm.launcher/.AdminReceiver

10. Now you can open "MDM agent" on your NitroPhone. If any permissions are asked, allow them.
   
Your HMDM app is ready to use. Refer to "Register NitroPhone on HMDM Server" at the end of this page.

Register NitroPhone on HMDM Server
==================================

1. Log into your server web panel and go to the "Configurations" tab and edit or create one configuration.
   For testing purposes you can try the `demo server <https://app.h-mdm.com/#/login>`__.

2. Make sure that "Use with default launcher" is not selected.  
   Click "Save and close".

3. Now go to Devices and click on the QR code on the right hand side. Note: The QR code contains the configuration for your mobile device.

4. Type in the server URL (e.g. https://mdm.nitrokey.com) and click "Scan QR code".

5. In you server web panel, go to your device "Detailed information" by clicking into the 3 dots and verify that there is no red fields on this page.

Your NitroPhone is now properly registered in your HMDM server.
