Firmware Update
===============

.. contents::
   :local:

This guide describes how to update the Heads firmware of the NitroPad.

These instructions are relevant in the following cases:

-  You want to update the Heads firmware.

-  You have already performed an OEM factory reset, but the TPM counter has not been reset.

Procedure
~~~~~~~~~

.. tabs::
   .. tab:: Heads v3.0+

   .. tab:: Heads v2.0+

        .. rubric:: Preparation

        1. Connect your NitroPad to a power plug and load its battery to over 70%

        2. Download the `latest firmware <https://github.com/Nitrokey/heads/releases/latest>`__ and store it on a USB drive. For the:

            - NitroPad T430: ``firmware-nitropad-t430-[version].zip``
            - NitroPad X230: ``firmware-nitropad-x230-[version].zip``
            - NitroPad NV41: ``firmware-nitropad-nv41-[version].zip``
            - NitroPad NS50: ``firmware-nitropad-ns50-[version].zip``
            - NitroPad T480: ``firmware-nitropad-t480-[version].zip``
            - NitroPad T480s: ``firmware-nitropad-t480s-[version].zip``
            - NitroPad V54: ``firmware-nitropad-v54-[version].zip``
            - NitroPad V56: ``firmware-nitropad-v56-[version].zip``

        .. rubric:: Firmware Signature Check

        To verify the firmware follow these steps:

        1. Download  `sha256sum.sig <https://github.com/Nitrokey/heads/releases/latest>`__ and store it

        2. Download and import Markus Meissners `gpg key <https://keyserver.ubuntu.com/pks/lookup?search=coder%40safemailbox.de&fingerprint=on&op=index>`__

        3. Verify the signature:

            .. code-block:: bash

                gpg --verify sha256sum.sig sha256sum

            You expect an output like this one:

            .. code-block:: bash

                gpg: Signature made Wed 05 Jul 2023 04:30:34 PM CEST
                gpg:                using RSA key C7E32619E2F71736F5910BB144CB2D868DD16BDA
                gpg: Good signature from "Markus Meissner <meissner@nitrokey.com>" [ultimate]
                gpg:                 aka "Markus Meissner <coder@safemailbox.de>" [ultimate]


            This verifys the file.

        .. rubric:: Procedure

        This is the actual update procedure. Usually the first two screens will not be shown - in that case please start from step 3.

        1. (Optional screen) Select “Ignore error and continue to default boot menu”.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/gpg_keyring_empty.jpg
                :alt: img1

        2. (Optional screen) Select “Ignore error and continue to default boot menu”.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/insert_your_nitrokey.jpg
                :alt: img2

        3. Go to “Options”.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/options.jpg
                :alt: img3

        4. Select “Flash/Update the BIOS”.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/flash_update_bios.jpg
                :alt: img4

        5. Please confirm the first option.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/firmware_management_menu.jpg
                :alt: img5

        6. Confirm the process with Enter.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/flash_bios_new_rom.jpg
                :alt: img6

        7. Select the desired .npf file.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/select_your_file.jpg
                :alt: img7

        8. Confirm the process with Enter.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/flash_rom_yes.jpg
                :alt: img8

        9. Confirm the restart with Enter.

            .. figure:: /components/nitropad-nitropc/images/heads/firmware-update/rom_flashed_successfully.jpg
                :alt: img9

        You have successfully updated your firmware!

   .. tab:: Heads ~v1.4

        Starting with v1.4, due to elementary changes inside Heads and the firmware
        layout, the update requires some additional considerations. This applies for
        both NitroPads X230 and T430.

        .. rubric:: Should I update my NitroPad?

        When updating your firmware to 1.4 (without using an external flasher device)
        the graphical HEADS dialogues will be replaced with a less convenient text-only
        version.

        If you use Ubuntu, Debian, Linux Mint, or Qubes 4.0, updating the firmware beyond
        v1.3.1 is (as of today) not needed. If you use Qubes 4.1 *without* the
        integrated Ethernet port, you don't need to update the firmware either.

        If you want to use Qubes 4.1 or newer *and* the integrated Ethernet port, you
        need to update the firmware to 1.4.

        .. hint::
            If the `.npf` file is not accepted by HEADS, you are likely not running the
            latest HEADS version. So either first update to version 1.3.1, or `unzip`
            the `.npf` file and use the resulting `.rom` file instead.

        .. rubric:: How can I update my NitroPad?

        There are two different ways to update from ``v1.3.1`` onwards:

        * Legacy update using either ``nitropad-t430-v1.4.npf`` or ``nitropad-x230-v1.4.npf``
          from the Heads menu, see the procedure above.
        * When using an external flasher device you can use the ``-maximized`` images.
          This keeps the graphical HEADS dialogues working. Read about the external
          flashing below.

        .. warning::
            Never try updating your NitroPad using the `-maximized` image if you do not
            know exactly what you are doing! You will brick your NitroPad and
            it can only be repaired using an external flasher!

        .. rubric:: How can I update to *-maximized*?

        .. hint::
            We highly recommend NOT DOING THIS ON YOUR OWN, as long as
            you do not know exactly what you are doing!

            We have a service to do this upgrade on your NitroPad. Please
            write an e-mail to "shop at nitrokey.com" together with your sales order number (SOxxxxxx).

        The following procedure describes roughly how to flash your NitroPad using
        an external flasher - it is intentionally on a high level, as we do not
        recommend doing this process on your own. But for the sake of completeness
        we document this here for the curious.

        1. Make sure you have a (``flashrom``) compatible flasher like ``ch341a_spi`` with a SOIC-8 clamp.

        2. Open the device (`see coreboot docs <https://doc.coreboot.org/mainboard/lenovo/Ivy_Bridge_series.html>`__)
           and make sure you can access both flash chips.

        3. Using ``flashrom``, read out the **bottom** flash (the 8MB image).

        4. Using ``ifdtool`` (`coreboot ifdtool docs <https://doc.coreboot.org/util/ifdtool/index.html>`__), extract the ``GbE`` flash region from the
           image and replace the ``GbE`` region inside your ``-maximized`` image.

        5. Split the modified firmware image using ``dd`` (as described in the coreboot documentation) into ``-top`` and ``-bottom``.

        6. Flash the images to the matching flash chips using your flasher and clamp.

        7. Reboot into your system (you should see ``-maximized`` inside the Heads menu).

        .. rubric:: Background information

        The new firmware *class* of ``-maximized`` images changes the firmware
        layout in a way that it is incompatible with Heads' internal firmware
        upgrade feature on the NitroPads.

        This change mainly originates from a reduced *Management Engine* size
        inside the firmware image. Furthermore, the ``-maximized`` images do
        contain all flash regions inside the firmware; this also includes ``GbE``,
        which contains the Ethernet MAC address.

        The non ``-maximized`` images have no **functional** differences compared
        to the ``-maximized`` images except for the reduced Heads GUI.
