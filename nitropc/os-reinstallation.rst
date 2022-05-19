Operating System Reinstallation
===============================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

.. warning::

   Booting this USB drive entirely erases all data on the hard disk or
   SSD of the NitroPad without further warning. Don’t boot this USB
   drive on any computer which contains data you want to keep. Make sure
   to format the USB drive after the intended use.

1. Download one of the operating system images: `Ubuntu
   Linux <https://www.nitrokey.com/files/ci/nitropc/ubuntu-oem/>`_, `Qubes OS <https://www.nitrokey.com/files/ci/nitropc/qubes-oem/>`_, `Debian <https://www.nitrokey.com/files/ci/nitropc/debian-oem/>`_,
   `Linux Mint <https://linuxmint.com/download.php>`_

2. Optional: Download hash sum and
   `verify <https://proprivacy.com/guides/how-why-and-when-you-should-hash-check#how-to-hash-check>`_
   the downloaded operating system image.

3. Write the operating system image to any USB drive. Possible
   applications:

   -  Windows: `Rufus <https://rufus.ie/>`_,
      `balenaEtcher <https://www.balena.io/etcher/>`_;
   -  Linux: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`_;
   -  macOS: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`_.

4. Connect the USB drive to your NitroPC and start it. In Heads menu
   select Boot Options -> USB Boot.

5. Depending on the operating system you may need to confirm its
   reinstallation.

To avoid accidential overwriting of valuable data, format the USB drive afterwards.

.. warning::

   Booting this USB drive entirely erases all data on the hard disk or
   SSD of the NitroPC without further warning. Don’t boot this USB
   drive on any computer which contains data you want to keep. Make sure
   to format the USB drive after the intended use.
