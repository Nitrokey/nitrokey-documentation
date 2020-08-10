# Operating System Reinstallation

::: warning
This will entirely erase all data on the hard disk or SSD of the NitroPad without further warning. Don't boot this USB drive on any other computer.
:::

1. Download one of the operating system images: [Ubuntu Linux](https://www.nitrokey.com/files/ubuntu/latest.iso), [Qubes OS](https://www.nitrokey.com/files/qubes/latest.iso), [Linux Mint](https://www.nitrokey.com/files/linuxmint/latest.iso)

2. Optional: Download hash sum and verify the downloaded operating system image: [Ubuntu Linux](https://www.nitrokey.com/files/ubuntu/latest.iso.sha256sum), [Qubes OS](https://www.nitrokey.com/files/qubes/latest.iso.sha256sum), [Linux Mint](https://www.nitrokey.com/files/linuxmint/latest.iso.sha256sum)

3. Write the operating system image to any USB drive. On Windows you could use [Rufus](https://rufus.ie/) and on Linux you could use `dd` or [balenaEtcher](https://www.balena.io/etcher/).

4. Connect the USB drive to your NitroPad and start it. In Heads menu select Boot Options -> USB Boot.

5. Depending on the operating system you may need to confirm its reinstallation.

6. [Sign the boot partition.](https://www.nitrokey.com/documentation/nitropad-system-update)

To avoid accidential overwriting of valuable data, format the USB drive afterwards.
