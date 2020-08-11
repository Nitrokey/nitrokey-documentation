# Firmware Update

### This guide describes how to update the Heads firmware of the NitroPad.

### These instructions are relevant for the following cases:

- You want to perform a firmware update.
- You have already performed an OEM factory reset, but the TPM  counter has not been reset.


### Needed:

- NitroPad, with battery loaded over 70%, connected to power
- USB-drive with firmware file (.rom file) and SHA256 hash sum for for verification


#### Firmware download location
The firmware file can be downloaded from the releases page:
- https://github.com/Nitrokey/heads/releases

#### Firmware verification
1. After copying firmware to the USB-drive please make sure the latter is properly unmounted/ejected to avoid write issues.
2. Start Nitropad and open recovery console from `Options -> Recovery console`
3. Execute the following to verify the firmware:
```
$ mount-usb
# select USB device
$ cd /media
$ sha256sum -c SHA256SUM.txt
```
For `v1.1-rc3` version this should result in:
```
$ sha256sum -c SHA256SUM.txt
nitropad_x230_v1.1-rc3.rom: OK
```
This confirms the content of the file is as expected.

### Procedure


1. (Optional screen) Select "Ignore error and continue to default boot menu".

![img1](./images/firmware-update/1.jpg)

2. (Optional screen) Select "Ignore error and continue to default boot menu".

![img2](./images/firmware-update/2.jpg)

3. Go to "Options".

![img3](./images/firmware-update/3.jpg)

4. Select "Flash/Update the BIOS".

![img4](./images/firmware-update/4.jpg)

5. Please confirm the first option.

![img5](./images/firmware-update/5.jpg)

6. Confirm the process with Enter.

![img6](./images/firmware-update/6.jpg)

7. Select the desired .rom- file.

![img7](./images/firmware-update/7.jpg)

8. Confirm the process with Enter.

![img8](./images/firmware-update/8.jpg)

9. Confirm the restart with Enter.

![img9](./images/firmware-update/9.jpg)

Now you have updated your firmware.

### Further steps
In case `ERROR: TOTP Generation Failed!` screen will show up, please follow the guide for Factory Reset starting from step 11. Direct link:
- https://docs.nitrokey.com/x230/ubuntu/factory-settings.html

