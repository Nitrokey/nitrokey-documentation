Factory Reset Heads v2.0+
=========================

.. contents:: :local:

Reasons for resetting to factory settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Your Nitrokey is locked (e.g. due to multiple incorrect PIN entries)

-  You have lost your Nitrokey (in which case you will first need a new one)

-  You have installed an operating system yourself (e.g. after changing the hard disk)

-  Your operating system does not start

.. warning::
   All GPG keys of your Nitrokey will be deleted during this procedure.

Procedure
~~~~~~~~~

.. tabs::
   .. tab:: Heads v3.0+

   .. tab:: Heads v2.0+

        .. tabs::
            .. tab:: Heads v2.5+
                    1. Connect your Nitrokey to the NitroPad.
                    2. Turn on the NitroPad and interupt the automatic boot by pressing any key.
                    3. Select “Options”.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/after-version_2-5/options_v2-5.jpg
                            :alt: heads options menu

                    4. Select “OEM-Factory Reset /Re-Ownership”.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/after-version_2-5/reset_v2-5.jpg
                            :alt: reset

                    5. Confirm reset with “Continue”.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/after-version_2-5/confirm_v2-5.jpg
                            :alt: confirm

                    6. The integrity of your setup will be tested, deppending on your reason to perform the reset this can fail continue with ok anyways

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/after-version_2-5/confirm-integrity_v2-5.jpg
                            :alt: confirm integrity

                    7. You will be prompted with:

                        .. code-block::

                            Would you like to use default configuration option?
                            If N, you will be prompted for each option [Y/n]:

                        Hit enter for the default option (Y).

                        A second prompt will show:

                        .. code-block::

                            Would you like to export your public key to an USB drive? [y/N]:

                        Hit enter for the default option (N).

                        You will need to touch your Nitrokey during this process when asked.

                    8. Now it shows all PINs used by Heads:

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/default-sec.jpg
                            :alt: defaults

                        You will need them for certain procedure so make sure to remember them.

                    9. Confirm the subsequent restart.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/reboot.jpg
                            :alt: reboot

                    10. After the restart the OTP secret must be created. Confirm the process with Enter.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/otp-sec1.jpg
                            :alt: otp secrets generate confirm 1

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/otp-sec2.jpg
                            :alt: otp secrets generate confirm 2

                    11. Enter TPM Owner Password (Default: 12345678)

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/tpm.jpg
                            :alt: tpm password enter

                    12. Scan QR code with Phone to inport TOTP Seceret (Optional) and hit Enter

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/totp.jpg
                            :alt: qr code totp

                        When asked touch your Nitrokey.


                    13. When prompted, enter the Secret App PIN of your Nitrokey (Default: 12345678) and hit Enter

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/admin-pin.jpg
                            :alt: admin pin nitrokey input

                    14. Hit enter and the automatic boot will start.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/after-version_2-5/start-menu_v2-5.jpg
                            :alt: start menu with default boot selected

                    15. You will now need to select your default boot, pick the first option and make it default.

                        .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/after-version_2-5/default_v2-5.jpg
                            :alt: default boot selection

                    16. This prompt will appear:

                        .. code-block::

                            Do you wish to add a disk encryption key to the TPM [y/N]:

                        Hit enter to choose the default option (N).

                        .. code-block::

                            Please confirm that your GPG card is inserted [Y/n]:

                        Here also hit enter for the default option (Y).

                        It will ask for the Admin PIN which is by default (123456).

                        The reset is done and you are booting in your installed operating system.

            .. tab:: Heads v2.0 to v2.5

                1. Connect your Nitrokey to the NitroPad.
                2. Turn on the NitroPad.
                3. Select “Options”.

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/before_version_2-5/options_v2-0.jpg
                        :alt: heads options menu

                4. Select “OEM-Factory Reset /Re-Ownership”.

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/before_version_2-5/reset_v2-0.jpg
                        :alt: reset

                5. Confirm Reset with “Continue”.

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/before_version_2-5/confirm_v2-0.jpg
                        :alt: confirm

                6. The integrity of your Setup will be tested, deppending on your reason to perform the reset this can fail continue with ok anyways

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/before_version_2-5/confirm-integrity_v2-0.jpg
                        :alt: confirm integrity

                7. The following Question can all be answered with the Default. Just hit enter if you only want to reset your device.

                    .. code-block:: shell

                        Would you like to change the current LUKS Disk Recovery Key passphrase?
                        (Highly recommended if you didn't install the Operating System yourself, so that past provisioned passphrase would not permit to access content.
                        Note that without re-encrypting disk, a backuped header could be restored to access encrypted content with old passphrase) [y/N]: N

                        Would you like to re-encrypt LUKS encrypted container and generate new Disk Recovery key?
                        (Highly recommended if you didn't install the operating system yourself: this would prevent any LUKS backuped header to be restored to access encrypted data) [y/N]: N
                        The following security components will be provisioned with defaults or chosen PINs/passwords:

                        TPM Ownership password
                        GPG Admin PIN
                        GPG User PIN

                        Would you like to set a single custom password that will be provisioned to previously stated security components? [y/N]: N

                        Would you like to set distinct PINs/passwords to be provisioned to previously stated security components? [y/N]: N

                        Would you like to set custom user Information for the GnPG key?[y/N]: N

                        Would you like to set custom user information for the GnuPG key? [y/N]: N

                        Checking for USB Security Dongle...

                        Detecting and setting boot device...

                        Boot device set to /dev/nvme0n1p2

                        Resetting TPM...

                        Resetting GPG Key...
                        (this will take around 3 minuts...)

                        Changing default GPG Admin PIN

                        Changing default GPG User PIN

                        Reading current firmware
                        (this will take a minute or two)

                        Adding generated key to current firmware and re-flashing...

                        Signing boot files and generating checksums

                8. It will show the Default GPG PINS and TPM Password

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/default-sec2.jpg
                        :alt: defaults

                9. Confirm the subsequent restart.

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/reboot.jpg
                        :alt: reboot

                10. After the restart the OTP secret must be created. Confirm the process with Enter.

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/otp-sec1.jpg
                        :alt: otp secrets generate confirm 1

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/otp-sec2.jpg
                        :alt: otp secrets generate confirm 2

                11. Enter TPM Password (Default: 12345678)

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/tpm.jpg
                        :alt: tpm password enter

                12. Scan QR COde with Phone to inport TOTP Seceret (Optional) and hit Enter

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/totp.jpg
                        :alt: qr code totp

                13. When prompted, enter the Admin PIN of your Nitrokey (Default: 12345678) and hit Enter

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/admin-pin.jpg
                        :alt: admin pin nitrokey input

                14. You should then reach the Start menu.

                    .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_2-0/before_version_2-5/start-menu_v2-0.jpg
                        :alt: start menu

                15. Press Enter to start the “Default Boot”.

                    .. note::
                        If you see the message that no default exists yet, please follow the procedure described in `default boot <./default-boot.html>`__.

   .. tab:: Heads ~v1.4
        .. note::
            Only for firmware till version 1.4

        1. Connect any USB flash drive to the NitroPad. (You need that USB flash drive for saving your security key)
        2. Connect your Nitrokey to the NitroPad.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/usb_keys_v1-4.jpg
                :alt: img1

        3. Turn on the NitroPad.
        4. Select “Options”.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/options_v1-4.jpg
                :alt: img2

        5. Select “OEM-Factory Reset”.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/oem_factory_reset_v1-4.jpg
                :alt: img3


        .. warning::
            All your data will be lost if you reset your device. Therefore please backup your data before performing the reset.

        6. Confirm the “OEM Factory Reset” with “Continue”.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/factory_reset_continue_v1-4.jpg
                :alt: img4

        7. You will be asked if you want to set the User and Admin/TPM PIN yourself. You press Enter to continue without changing the PINs.

        8. You will then be asked if manual user information should be added. You confirm with ``y`` and enter your name and then the email address.

            .. code-block:: bash

                Would you like to set a custom password?[y/N]:
                Would you like to set custom user Information for the GnPG key?[y/N]: y
                Please enter the following Information...

                Real name: "your name"
                Email adress: "your email-adress"
                Comment:

                Checking for USB media...

                New value of PCR[5]: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                [ xx.xxxxxx] sd 6:0:0:0: [sdb] No Caching mode page found
                [ xx.xxxxxx] sd 6:0:0:0: [sdb] Assuming drive cache: write through

                Checking for GPG Key...

                Detecting and setting boot device...

                Boot device set to /dev/sda1

                Resetting TPM...

                Resetting GPG Key...
                (this will take a minute or two)

        9. If you are using Nitrokey Storage, you must then select the drive. If the drives /dev/sdb1, /dev/sdc, /dev/sdd1 are displayed, select /dev/sdd1. If the drives /dev/sdb1, /dev/sdc1, /dev/sdd are displayed, select /dev/sdb1.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/select_usb_disk_v1-4.jpg
                :alt: img5


        10. The rest of the configuration will be done automatically. You confirm the subsequent restart.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/reset_completed_v1-4.jpg
                :alt: img6


        11. After the restart the OTP secret must be created. Confirm the process with Enter.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/totp_generation_failed_v1-4.jpg
                :alt: img7


        12. Confirm that new OTP Secrets should be created.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/generate_new_secret_v1-4.jpg
                :alt: img8


        13. When prompted, enter the Admin PIN and TPM password. Both are by default: “12345678”.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/new_totp_secret_v1-4.jpg
                :alt: img9


        14. You should then reach the Start menu.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/start-menu_v1-4.jpg
                :alt: img10


        15. Press Enter to start the “Default Boot”.

            .. note::

                If you see the message that no default exists yet, please follow the procedure described in “Troubleshooting: Default Boot Menu”.

        16. Once the operating system starts until the encryption password is requested, you are done.

            .. figure:: /components/nitropad-nitropc/images/heads/factory-reset-heads/factory-reset-heads_1-4/ubuntu_v1-4.jpg
                :alt: img11


        17. Finally, copy the public PGP key from the data stick to your computer, e.g. to use it for e-mail encryption.

