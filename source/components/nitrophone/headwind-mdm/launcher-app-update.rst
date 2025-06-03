Launcher App Update
-------------------

This document describes the update of the Headwind MDM (HMDM) launcher app on the mobile devices.

.. note::
   I you use the HMDM installation hosted by Nitrokey, you can skip to the chapter `Test the new launcher <#test-the-new-launcher>`__.

Prerequisits
============

- Launcher installation files, provided by Nitrokey.
- Administrative access to the web panel.

Update Launcher on the Web Panel
================================

1. Log in to the web panel with the administrative user.
2. Change to the "Applications" view.
3. Search for the Package ID ``com.hmdm.launcher``.
   In the column **Actions**, click the **Versions** button.
4. Click the **Add** button.
5. In the field **Version** enter the version number, mentioned in the file name of the new launcher installation file.
   In the field **File** upload the launcher installation file.
6. Click the **Save** button to persist the new version to the server.

Test the new Launcher
=====================

1. Log in to the web panel with the administrative user.
2. Change to the "Configurations" view.
3. Search for the configuration you use for your production devices.
   In the column **Actions**, click the **Copy** button.
4. Enter a name and description to indicate the test configuration.
5. Click the **Save** button to persist the new configuration to the server.
6. Search for the just created configuration.
   In the column **Actions**, click the **Edit** button.
   Change to the view "Applications".
   Search the row for the "Headwind MDM" ``com.hmdm.launcher``.
   In the column **Version** click on the version number.
   Select the latest version and click the **Apply** button.
   Click on the **Save and close** button.
7. Change to the "Devices" view.
8. Search for a device you want to test the new configuration with.
   In the column **Actions**, click the **Edit** button.
9. In the field "Configuration", select the just created test configuration.
10. Click the **Save** button to persist the new device configuration to the server.
11. Renew the configuration on the device.
    Check that the launcher has been updated and started, and the device is up and running.
12. Perform your testing.
13. After the test, assign the test device to its original configuration again and delete the test configuration.

Push the Launcher to Mobile Devices
===================================

1. Log in to the web panel with the administrative user.
2. Change to the "Configurations" view.
3. Search for the configuration you use for your production devices.
   In the column **Actions**, click the **Edit** button.
   Change to the view "Applications".
   Search the row for the "Headwind MDM" ``com.hmdm.launcher``.
   In the column **Version** click on the version number.
   Select the latest version and click the **Apply** button.
   Click on the **Save and close** button.
4. The mobile devices will now automatically update the HMDM launcher.

Verify Update on Mobile Devices
===============================

After a launcher app update has been pushed it should be verified that the mobile devices install the new version.
The following instructions are helpful to get an overview of the versions installed on the mobile devices.
This is especially helpful during a server update.

1. Log in to the web panel with the administrative user.
2. Change to the "Devices" view.

Filter for Mobile Devices with a Version Number
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Click on **More parameters**.
2. In the field **Launcher Version** enter the version number of the old launcher version.
3. Click the **Search** button.
4. The list of devices will now only show the devices which have the respective version installed.

Verify for Individual Mobile Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Search for the device you want to get the installed launcher version for.
   In the column **Actions**, click the **More...** button and click **Detailed information**.
2. You can see the installed launcher version for a device in the table **Installation status**.
   Search for the Package ID ``com.hmdm.launcher``, the column **Installed version** shows the currently installed version.

