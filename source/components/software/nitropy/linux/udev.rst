Setting up the udev Rules
=========================

To be able to access your devices without root privileges, nitropy requires the Nitrokey udev rules.
On many distributions, they can be installed from a package:

* Arch Linux: `nitrokey-udev-rules <https://archlinux.org/packages/extra/any/nitrokey-udev-rules/>`__
* Debian: `nitrokey-udev <https://packages.debian.org/search?keywords=nitrokey-udev&searchon=names&exact=1&suite=all&section=all>`__ (since Debian 14 Forky)
* NixOS: `nitrokey-udev-rules <https://search.nixos.org/packages?channel=unstable&query=nitrokey-udev-rules#show=nitrokey-udev-rules>`__ (set |hardware.nitrokey.enable|_ to ``true``)
* Ubuntu: `nitrokey-udev <https://packages.ubuntu.com/search?keywords=nitrokey-udev&searchon=names&exact=1&suite=all&section=all>`__ (since Ubuntu 26.10 Stonking Stingray)

.. |hardware.nitrokey.enable| replace:: ``hardware.nitrokey.enable``
.. _hardware.nitrokey.enable: https://search.nixos.org/options?channel=unstable&query=hardware.nitrokey.enable&type=options#show=option%253Ahardware.nitrokey.enable

If the rules are not provided by your distribution, you can install the rules manually::

    wget https://raw.githubusercontent.com/Nitrokey/nitrokey-udev-rules/main/41-nitrokey.rules
    sudo mv 41-nitrokey.rules /etc/udev/rules.d/
    sudo chown root:root /etc/udev/rules.d/41-nitrokey.rules
    sudo chmod 644 /etc/udev/rules.d/41-nitrokey.rules

After installing the rules, you need to reload them::

    sudo udevadm control --reload-rules && sudo udevadm trigger

If you still cannot access your device, try again after rebooting your system.

Limitations
-----------

The recommended udev rules use the ``uaccess`` mechanism to dynamically assign the correct permissions.
This mechanism requires ``systemd`` and only works with users that are logged in locally (this means no SSH logins or similar).

Troubleshooting
---------------

If installing the udev rules did not fix the issue, you can perform the following steps to investigate the problem:

1. Unplug the Nitrokey.
2. Reboot the computer to ensure that the udev rules are activated.
3. Execute the command ``sudo dmesg --follow`` and connect the Nitrokey.
   Observe the log messages that appear afterwards.
   You should see a line similar to::

     [46561.825062] hid-generic 0003:20A0:42B2.000F: hiddev97,hidraw3: USB HID v1.11 Device [Nitrokey Nitrokey 3] on usb-0000:00:14.0-3.4.1/input1

4. Determine the hidraw device name from the log message.
   In this case, it is ``hidraw3``.
5. Check the permissions for the hidraw device by running ``getfacl /dev/$name`` where ``$name`` is the hidraw device name.
   You should see your user with ``rw`` permissions.
   For example for the user ``myuser``::

       $ getfacl /dev/hidraw3
       getfacl: Removing leading '/' from absolute path names
       # file: dev/hidraw3
       # owner: root
       # group: root
       user::rw-
       user:myuser:rw-
       group::---
       mask::rw-
       other::---

6. If your user does not have the correct permissions, execute the command ``loginctl list-sessions``.
   You should see one session for your user with a seat, for example::

       $ loginctl list-sessions
       SESSION  UID USER   SEAT  LEADER CLASS   TTY IDLE SINCE
             1 1000 myuser seat0 1487   user    -   no   -
             2 1000 myuser -     1495   manager -   no   -

       2 sessions listed.

Additional steps for debugging the udev rules are described `here <https://github.com/Nitrokey/pynitrokey/issues/167#issuecomment-1024921046>`__.
