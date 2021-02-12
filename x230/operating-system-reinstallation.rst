Operating System Reinstallation
===============================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

.. danger::

   Booting this USB drive entirely erases all data on the hard disk or
   SSD of the NitroPad without further warning. Don’t boot this USB
   drive on any computer which contains data you want to keep. Make sure
   to format the USB drive after the intended use.

1. Download one of the operating system images: `Ubuntu
   Linux <https://www.nitrokey.com/files/ubuntu/latest.iso>`__, Qubes OS
   (`English <https://www.nitrokey.com/files/qubes/latest-en.iso>`__,
   `German <https://www.nitrokey.com/files/qubes/latest-de.iso>`__),
   `Linux Mint <https://www.nitrokey.com/files/linuxmint/latest.iso>`__

2. Optional: Download hash sum and
   `verify <https://proprivacy.com/guides/how-why-and-when-you-should-hash-check#how-to-hash-check>`__
   the downloaded operating system image: `Ubuntu
   Linux <https://www.nitrokey.com/files/ubuntu/latest.iso.sha256sum>`__,
   Qubes OS
   (`English <https://www.nitrokey.com/files/qubes/latest-en.iso.sha256sum>`__,
   `German <https://www.nitrokey.com/files/qubes/latest-de.iso.sha256sum>`__),
   `Linux
   Mint <https://www.nitrokey.com/files/linuxmint/latest.iso.sha256sum>`__

3. Write the operating system image to any USB drive. Possible
   applications:

   -  Windows: `Rufus <https://rufus.ie/>`__,
      `balenaEtcher <https://www.balena.io/etcher/>`__;
   -  Linux: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`__;
   -  macOS: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`__.

4. Connect the USB drive to your NitroPad and start it. In Heads menu
   select Boot Options -> USB Boot.

5. Depending on the operating system you may need to confirm its
   reinstallation.

6. `Sign the boot
   partition. <https://docs.nitrokey.com/x230/system-update.html>`__

To avoid accidential overwriting of valuable data, format the USB drive afterwards.

.. danger::

   Booting this USB drive entirely erases all data on the hard disk or
   SSD of the NitroPad without further warning. Don’t boot this USB
   drive on any computer which contains data you want to keep. Make sure
   to format the USB drive after the intended use.
