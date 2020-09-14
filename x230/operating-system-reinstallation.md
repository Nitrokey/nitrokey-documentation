# Operating System Reinstallation

::: danger Warning
Booting this USB drive entirely erases all data on the hard disk or SSD of the NitroPad without further warning. Don't boot this USB drive on any computer which contains data you want to keep. Make sure to format the USB drive after the intended use.
:::

1. Download one of the operating system images: [Ubuntu Linux](https://www.nitrokey.com/files/ubuntu/latest.iso), Qubes OS ([English](https://www.nitrokey.com/files/qubes/latest-en.iso), [German](https://www.nitrokey.com/files/qubes/latest-de.iso)), [Linux Mint](https://www.nitrokey.com/files/linuxmint/latest.iso)

2. Optional: Download hash sum and [verify](https://proprivacy.com/guides/how-why-and-when-you-should-hash-check#how-to-hash-check) the downloaded operating system image: [Ubuntu Linux](https://www.nitrokey.com/files/ubuntu/latest.iso.sha256sum), Qubes OS ([English](https://www.nitrokey.com/files/qubes/latest-en.iso.sha256sum), [German](https://www.nitrokey.com/files/qubes/latest-de.iso.sha256sum)), [Linux Mint](https://www.nitrokey.com/files/linuxmint/latest.iso.sha256sum)

3. Write the operating system image to any USB drive. Possible applications:
    - Windows: [Rufus](https://rufus.ie/), [balenaEtcher](https://www.balena.io/etcher/);
    - Linux: `dd`, [balenaEtcher](https://www.balena.io/etcher/);
    - macOS: `dd`, [balenaEtcher](https://www.balena.io/etcher/).

4. Connect the USB drive to your NitroPad and start it. In Heads menu select Boot Options -> USB Boot.

5. Depending on the operating system you may need to confirm its reinstallation.

6. [Sign the boot partition.](https://www.nitrokey.com/documentation/nitropad-system-update)

To avoid accidential overwriting of valuable data, format the USB drive afterwards.

::: danger Warning
Booting this USB drive entirely erases all data on the hard disk or SSD of the NitroPad without further warning. Don't boot this USB drive on any computer which contains data you want to keep. Make sure to format the USB drive after the intended use.
:::

