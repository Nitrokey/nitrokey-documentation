Firmware Update
===============

.. include:: ./product_platform_heading.rst

.. only:: comment

 .. contents:: :local:

This guide describes how to update the firmware on the Nitrokey 3.

.. important::
   **For firmware v.1.0.0 and below the update will delete all user data!**    
   Make sure you have proper backup login methods enabled and/or ensure that
   the Nitrokey 3 is not the only way to authenticate/2FA for your 
   applications/services.


   **For firmware v1.0.1 and above user data is retained** during the update. Anyways, be sure to always have another device (or login method) registered with your service, if for some reason your data is not retained.

How to Update
-------------

.. important::
   Never disconnect the Nitrokey 3 or abort the process while updating,
   this will likely render your device useless!

1. Make sure you have the latest `pynitrokey` version installed, please check the `installation instructions`_ for your OS.
2. Run ``nitropy nk3 update``.
3. Once instructed by ``nitropy`` touch the device to activate bootloader.
4. *macOS only:* If instructed by ``nitropy`` run update command again.
5. Please wait until the process finished. (This may vary depending on your operating system)
6. *Optional*: run ``nitropy nk3 test`` to check if device is working properly after flashing.

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).

.. _Nitrokey 3 Firmware - GitHub Releases: https://github.com/Nitrokey/nitrokey-3-firmware/releases
.. _installation instructions: ../../software/nitropy/all-platforms/installation.html


Firmware Release Types
----------------------

There are three types of firmware releases for the Nitrokey 3:

**Stable releases** are most important for users.
They are designed to be backward compatible and to retain all user data and are thoroughly tested.
On production devices, only stable releases should be used.

A **release candidate** is a preview of an upcoming stable release.
It should also be backward compatible but is not tested as thoroughly as a stable release.

**Test releases** (previously: *alpha releases*) contain additional features that are not ready for production yet.
User data created with a test release may not be compatible with other releases.
These releases are still being tested and are more likely to contain bugs.

See the `release notes`_ on GitHub for more information on the features available in a release.

.. _release notes: https://github.com/Nitrokey/nitrokey-3-firmware/releases

You can identify the type of a firmware release by its version number:

.. list-table::
   :widths: 1, 2, 1
   :header-rows: 1

   * - Type
     - Version Number
     - Example
   * - stable release
     - ``v<major>.<minor>.<patch>``
     - ``v1.3.1``
   * - release candidate
     - ``v<major>.<minor>.<patch>-rc.<counter>``
     - ``v1.3.1-rc.1``
   * - test release
     - ``v<major>.<minor>.<patch>-test.<date>``
     - ``v1.3.1-test.20230414``

Downgrade Protection
--------------------

The firmware of the Nitrokey 3 cannot be downgraded. You can only install a firmware update with the same or a higher major, minor and patch version number than the firmware currently installed on the device. This protects against downgrade attacks where a secure firmware version would be replaced with an old, potentially insecure version.

Examples:

- ``v1.3.1`` can be updated to ``v1.3.1-test.20230414`` and vice versa because they have the same major, minor and patch version number.
- ``v1.3.1`` can be updated to ``v1.3.2`` or ``v1.4.0`` because the version number increases.
- ``v1.3.1`` cannot be updated to ``v1.3.0-rc.1`` because the version number would decrease.

This is mostly relevant for users that rely on a feature from the test releases.
Users of the stable firmware can always update to the latest available firmware version.
