Operating System Reinstallation
===============================

.. contents:: :local:

.. warning::

   Booting this USB drive entirely erases all data on the hard disk or
   SSD of the NitroPad without further warning. Don’t boot this USB
   drive on any computer which contains data you want to keep. Make sure
   to format the USB drive after the intended use.

.. note::

   Due to a bug Linux Mint 21 is currently not supported. The latest supported version is Linux Mint 20.1

.. tabs::

   .. tab:: Ubuntu

      1. Download the latest LTS image from the `official Ubuntu website <https://ubuntu.com/download/desktop>`__.

      2. `Verify <https://ubuntu.com/tutorials/how-to-verify-ubuntu#1-overview>`__  your dowloaded image.

      3. Flash a USB drive with the dowloaded image with `balenaEtcher <https://www.balena.io/etcher/>`__.

      4. Once the USB drive ready, plug it to your NitroPad or NitroPC and start it.

      .. tabs::

         .. tab:: Heads

            1. For Heads version >= 2.5.0 stop the automatic boot by pressing a key.

            2. Go to the option menu then the "boot option"

            3. Select "USB boot" and "Try and install Ubuntu".

            4. Once the installer is started follow the instuctions and when asked choose to encrypt your drive with LVM.

            5. Once Ubuntu is installed your computer will reboot and Heads will show errors, you will need to perform a `OEM facotry reset <https://www.balena.io/etcher/>`__.

            6. When Ubuntu will be successfully installed and Heads reset you will automatically boot on Ubuntu.

            .. note::

               With Ubuntu 24 you need to type your encryption password blindy as exaplained `here <https://www.balena.io/etcher/>`__.

         .. tab:: Tianocore
   

   .. tab:: QubesOS

      test

      .. tabs::

         .. tab:: Heads      

         .. tab:: Tianocore

1. Download the latest Stable Release of the operating system images: `Ubuntu
   Linux <https://www.nitrokey.com/files/ci/ubuntu/>`__, `Qubes OS <https://www.qubes-os.org/downloads/>`__,
   `Linux Mint <https://linuxmint.com/download.php>`__


2. Optional: Download hash sum and
   `verify <https://proprivacy.com/guides/how-why-and-when-you-should-hash-check#how-to-hash-check>`__
   the downloaded operating system image.

3. Write the operating system image to any USB drive. Possible
   applications:

   -  Windows: `Rufus <https://rufus.ie/>`__,
      `balenaEtcher <https://www.balena.io/etcher/>`__;
   -  Linux: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`__;
   -  macOS: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`__.

4. Connect the USB drive to your NitroPad and start it. In Heads menu
   select Boot Options -> USB Boot.

5. On Qubes use the "latest Kernel" version of the install options

6. Depending on the operating system you may need to confirm its
   reinstallation.

7. `Sign the boot
   partition <heads/system-update.html>`_ (Heads only).

To avoid accidential overwriting of valuable data, format the USB drive afterwards.

.. warning::

   Booting this USB drive entirely erases all data on the hard disk or
   SSD of the NitroPad without further warning. Don’t boot this USB
   drive on any computer which contains data you want to keep. Make sure
   to format the USB drive after the intended use.
