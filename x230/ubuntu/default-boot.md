# Default Boot

If you have installed a new operating system, it may be that default boot is not yet assigned. If this is the case, please proceed as described below.

1. Select "Default boot".

![img1](./images/default-boot/1.jpg)

2. Heads informs you that it does not yet know any default. First you agree to the update of the checksums.

![img2](./images/default-boot/2.jpg)

3. Confirm the process with Enter.

![img3](./images/default-boot/3.jpg)

4. Now insert the Nitrokey if this is not already the case and confirm with Enter. Then you have to enter the User PIN of the Nitrokey.

```
    Please confirm that your GPG card is inserted [Y/n]:

    Verifying presence of GPG card...

    XXXXXXX: XXXXXXXXXX
    Please unlock the card

    Number: XXXX XXXXXX
    Holder: 
    Counter: X
    PIN: 
```

Now the NitroPad marks the files that changed by the update as verified.

5. Confirm the process with Enter.

![img4](./images/default-boot/4.jpg)

6. You will then see a list of all possible boat entries - choose the first one here by simply pressing Enter.
    Boot Options

![img5](./images/NitroPad-boot-options.jpeg)

7. To save this value as default, select "Make Ubuntu the default" for Ubuntu or "Make Qubes the default" for Qubes OS.
    Confirm Boot Details

![img6](./images/NitroPad-boot-options.jpeg)

8. Confirm the next three questions with Enter and enter the PIN of the Nitrokey if you are prompted to do so.

```
    Saving a default will modify the disk. Proceed? [Y/n]:

    Do you wish to add a disk encryption to the TPM [Y/n]:

    Please confirm that your GPG card is inserted [Y/n]:

    Verifying presence of GPG card...

    XXXXXXX: XXXXXXXXXX
    Please unlock the card

    Number: XXXX XXXXXX
    Holder: 
    Counter: X
    PIN:
```
9. Your system will then boot.