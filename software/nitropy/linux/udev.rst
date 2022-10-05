Setting up The udev Rules For nitropy
=====================================

To be able to access your devices without root privileges, nitropy requires the Nitrokey udev rules.  These rules are shipped with `libnitrokey <https://github.com/Nitrokey/libnitrokey>`__.  If you don’t have libnitrokey or if you need a newer version, you can install the rules manually::

    wget https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey.rules
    sudo mv 41-nitrokey.rules /etc/udev/rules.d/

After installing the rules, you need to reload them::

    sudo udevadm control --reload-rules && sudo udevadm trigger

If you still cannot access your device, try again after rebooting your system.

.. todo::

   describe debugging, see https://github.com/Nitrokey/pynitrokey/issues/167#issuecomment-1024921046

.. todo::

   describe requirements: systemd, load order
