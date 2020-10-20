# Firmware Update

::: danger Warning
You should backup all data from the device before upgrading, as firmware upgrades may destroy all data on the device (especially coming from firmware version <0.45)!
:::

![img1](./images/update-firmware-of-nitrokey-storage/1.png)

## Required Software

Download the [Nitrokey App](https://www.nitrokey.com/download) and the [Nitrokey Update Tool](https://github.com/Nitrokey/nitrokey-update-tool/releases/latest). The Nitrokey Update Tool is currently available for macOS and Windows only. For Updating on GNU/Linux please see below.
Download the Latest Firmware

## Download the latest firmware 

Download the latest firmware.hex file from [here](https://github.com/Nitrokey/nitrokey-storage-firmware/releases/download/V0.54/storage-firmware-V0.54-0-g0b1ed2d.hex). Older releases are [here](https://github.com/Nitrokey/nitrokey-storage-firmware/releases).

## Enable Firmware Update

**If you are using Microsoft Windows Build 1809 and Nitrokey Storage Firmware 0.52 or lower, you need to use another system or if this is not feasible use [these instructions](https://docs.nitrokey.com/storage/activate-update-mode-manually.html) to enable the Firmware Update mode.**

Set Nitrokey Storage into upgrade mode using the [Nitrokey App](https://www.nitrokey.com/download). This may looks different on your system (see picture below). Generally right click on the icon of the Nitrokey App and go to "Configure" -> "Enable Firmware Update". The default firmware password is '12345678'.

::: tip Note
The Nitrokey is not detected by App anymore once update mode got activated. You have to proceed with the instructions described below to make it work again.
:::

## Update the Firmware with the Update Tool

Now start the previously download Nitrokey Update Tool. After clicking left on "Select firmware file" you can choose the previously downloaded .hex file. Please left click on "Update firmware" to start the update process. Your device should get detected by the Nitrokey App again as soon as the update is finished.

![img2](./images/update-firmware-of-nitrokey-storage/2.png)