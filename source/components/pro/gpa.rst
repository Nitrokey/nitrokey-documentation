Setup With Gnu Privacy Assistant (GPA)
=======================================================

This document describes how to use Gnu Privacy Assistant (GPA) to set up the Nitrokey for its first usage.

1. First you need to install Gnu Privacy Assistant (GPA). For Windows you should download and install the `GPG4Win <https://www.gpg4win.org/>`__ package which contains GPA. For Linux you should install the GPA package of your distribution (e.g. on Ubuntu: sudo apt-get install gpa ).

2. Start GPA and select the Card Manager; either by pressing the icon at the top or by choosing Card Manager in the Windows menu.

    .. figure:: /components/pro/images/gpa/1.png
        :alt: img1

3. The window of the Card Manager will appear. Enter your salutation, name and optional other information. While doing so you might be asked to enter the admin PIN.

    .. figure:: /components/pro/images/gpa/2.png
        :alt: img2

4. Confirm this window and enter the admin PIN in the next window.

    .. figure:: /components/pro/images/gpa/3.png
        :alt: img3

5. In the Card Manager window you might need to scroll down until you see the buttons to change the PINs. The term PIN is used interchangeable with "password". Press the first button "Change PIN" in order to change the user password. Read and confirm the following information window.

    .. figure:: /components/pro/images/gpa/4.png
        :alt: img4

6. Choose and enter your own PIN with a minimum length of six characters. This PIN is required for the daily usage of the Nitrokey.

    .. figure:: /components/pro/images/gpa/5.png
        :alt: img5

7. Go back to the Card Manager window in step three. This time you choose the third button Change PIN in order to change the admin PIN. The admin PIN is required to change the information on the Nitrokey and to change the cryptographic keys. Proceed as described in steps four and five.

8. After changing both the user and the admin PIN, you are back in the Card Manager window. Select "Generate key" in the "Card" menu.

    .. figure:: /components/pro/images/gpa/6.png
        :alt: img6

9. Enter your name and e-mail address. You should keep "backup" enabled in order to create a backup file of your cryptographic keys. Optionally you might select an expiration date for your cryptographic keys.

    .. figure:: /components/pro/images/gpa/7.png
        :alt: img7

10. Wait until the keys are generated successfully.

    .. figure:: /components/pro/images/gpa/8.png
        :alt: img8

11. Enter a strong passphrase for your backup keys. We strongly recommend to store the backup file on a separate storage(e.g. CD-ROM) and on a safe location.

    .. figure:: /components/pro/images/gpa/9.png
        :alt: img9

Congratulations, your Nitrokey is now ready to use. Please see the `applications <https://www.nitrokey.com/documentation/applications>`__ section for further information of its usage.
