USBGuard
========

Using usbguard is pretty essential to protect against common attacks like malicious devices, rubber duckies, OMG cables or the “governmental 3 letter agency equivalents”.

Especially thunderbolt (which can be blocked globally, see `this config as to how <https://github.com/secureblue/secureblue/tree/live/files/system/etc/modprobe.d>`__ can grant attackers access to your RAM, which means encryption keys and more.

1. Install USBGuard

    Debian/Ubuntu or Linux mint:

    ``sudo apt install usbguard usbutils udisks2 usbguard-notifier``

    Fedora:

    ``sudo dnf install -y usbguard usbguard-notifier usbguard-selinux ``

2. Set it up

Make sure to have your keyboard and mouse plugged in. 

These commands will permanently allow all currently connected devices:

.. code-block:: bash

    pkexec sh -c '
            mkdir -p /var/log/usbguard
            mkdir -p /etc/usbguard
            chmod 755 /etc/usbguard
            usbguard generate-policy > /etc/usbguard/rules.conf
            systemctl enable --now usbguard.service
            usbguard add-user $1
        ' -- $ACTIVE_USERNAME
        systemctl enable --user --now usbguard-notifier.service

