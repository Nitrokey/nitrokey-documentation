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

      2. `Verify <https://ubuntu.com/tutorials/how-to-verify-ubuntu#1-overview>`__  your downloaded image.

      3. Flash a USB drive with the downloaded image with `balenaEtcher <https://www.balena.io/etcher/>`__.

      4. Once the USB drive is flashed, plug it to your NitroPad or NitroPC and start it.

      .. tabs::

         .. tab:: Heads

            1. For Heads version >= 2.5.0 stop the automatic boot by pressing a key.

            2. Go to the option menu and "boot option".

            3. Select "USB boot" and "Try and install Ubuntu".

            4. Once the installer started follow the instuctions and when asked choose to encrypt your drive with LVM.

            5. Once Ubuntu is installed your computer will reboot and Heads will show errors, you will need to perform a `OEM facotry reset <./heads/factory-reset-heads2.html>`__.

            6. When Ubuntu will be successfully installed and Heads reseted you will automatically boot on Ubuntu.

            .. note::

               With Ubuntu 24 you need to type your encryption password blindy as exaplained `here <./ubuntu/index.html#workaround-ubuntu-24-04>`__.

         .. tab:: Tianocore

            1. Interrupt the boot and access the UEFI menu by pressing "ESC".

            2. Go to "one time boot" and select the USB key with the Ubuntu installer image.

            3. Once the installer started follow the instuctions and when asked choose to encrypt your drive with LVM.

            4. When Ubuntu will be successfully installed you will automatically boot on Ubuntu.

   
   .. tab:: QubesOS

      1. Download the latest image from the `official QubesOS website <https://www.qubes-os.org/downloads/>`__.

      2. `Verify <https://doc.qubes-os.org/en/latest/project-security/verifying-signatures.html>`__  your downloaded image.

      3. Flash a USB drive with the downloaded image with `balenaEtcher <https://www.balena.io/etcher/>`__.

      4. Once the USB drive is flashed, plug it to your NitroPad or NitroPC and start it.


      .. tabs::

         .. tab:: Heads

            1. For Heads version >= 2.5.0 stop the automatic boot by pressing a key.

            2. Go to the option menu and "boot option".

            3. Select "USB boot" and select "Install Qubes OS".

            4. Once the installer started follow the instuctions and when asked choose to encrypt your drive's data.

            5. Once QubesOS is installed your computer will reboot and Heads will show errors, you will need to perform a `OEM facotry reset <./heads/factory-reset-heads2.html>`__.

            6. When QubesOS will be successfully installed and Heads reseted you will automatically boot on QubesOS.


         .. tab:: Tianocore

            1. Interrupt the boot and access the UEFI menu by pressing "ESC".

            2. Go to "one time boot" and select the USB key with the QubesOS installer image.

            3. Once the installer started follow the instuctions and when asked choose to encrypt your drive's data.

            4. When QubesOS will be successfully installed you will automatically boot on QubesOS.

