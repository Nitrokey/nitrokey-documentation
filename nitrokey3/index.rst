Nitrokey 3
==========

.. contents:: :local:


The Nitrokey 3 currently supports FIDO2 and one-time passwords (OTP). Additional features like OpenPGP Card and PIV are available in test firmware releases. See the `release notes`_ on GitHub for more information.

.. _release notes: https://github.com/Nitrokey/nitrokey-3-firmware/releases

First check the:

.. toctree::
   :maxdepth: 1
   :glob:

   Frequently Asked Questions <faq>

Or choose your operating system:

.. toctree::
   :maxdepth: 1
   :glob:

   Windows <windows/index>
   macOS <mac/index>
   Linux <linux/index>
   
Firmware Release Types
~~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~~

The firmware of the Nitrokey 3 cannot be downgraded. You can only install a firmware update with the same or a higher major, minor and patch version number than the firmware currently installed on the device. This protects against downgrade attacks where a secure firmware version would be replaced with an old, potentially insecure version.

Examples:

- ``v1.3.1`` can be updated to ``v1.3.1-test.20230414`` and vice versa because they have the same major, minor and patch version number.
- ``v1.3.1`` can be updated to ``v1.3.2`` or ``v1.4.0`` because the version number increases.
- ``v1.3.1`` cannot be updated to ``v1.3.0-rc.1`` because the version number would decrease.

This is mostly relevant for users that rely on a feature from the test releases.
Users of the stable firmware can always update to the latest available firmware version.
