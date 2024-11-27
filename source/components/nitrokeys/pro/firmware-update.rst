Firmware Update
===============

This guide describes how to update the firmware on the Nitrokey Pro.

.. warning::
  This guide is still in an experimental state!

.. note::
  Updates are only possible with firmware version 0.11 and newer.

.. important::
   Updating could lead to data loss, so make sure you have proper backup login methods enabled and/or ensure that
   the Nitrokey Pro is not the only way to authenticate/2FA for your 
   applications/services.

How to Update
-------------

.. important::
   Never disconnect the Nitrokey Pro or abort the process while updating,
   this will likely render your device useless!

1. Make sure you have the latest `pynitrokey` version installed, please check the `installation instructions <../../software/nitropy/all-platforms/installation.html>`__ for your OS.
2. Download the latest stable `firmware image <https://github.com/Nitrokey/nitrokey-pro-firmware/releases>`__.

    .. important:: 
        For production use you should choose the latest stable version (so only versions, that don’t contain i.e. “pre-release” or “RC”).

3. To apply the update run:

.. code-block:: bash

 $ nitropy pro enable-update
 $ nitropy pro update nitrokey-pro-firmware-<version>.bin


Alternative Update Method
^^^^^^^^^^^^^^^^^^^^^^^^^

Alternatively `dfu-util` can be used for the firmware update:

1. Install dfu-util

    Binaries for Windows are available at:
    * http://dfu-util.sourceforge.net/releases/

    For macOS binaries are available via Homebrew:
    * https://formulae.brew.sh/formula/dfu-util

    *macOS only:* Install `dfu-util` via Homebrew

    .. code-block:: bash

        brew install dfu-util

2. Use Nitrokey App v1.5-RC7 or higher to change the boot mode of the Nitrokey Pro to update mode.

3. Now the following command to apply the update

    .. code-block:: bash

        $ dfu-util -D update_binary.bin

4. The boot mode can now be changed back again with the Nitrokey App.

Troubleshooting
---------------

**Issue:** ``libnitrokey`` could not be found.
 In case the libnitrokey could not be found automatically, the path to it can be provided with env. variable:

 .. code-block:: bash
 
  $ env LIBNK_PATH=/libnk/path/libnitrokey.so nitropy pro enable-update

 To find libnitrokey on your system use:

 .. code-block:: bash

  $ locate libnitrokey.so

Linux Permission error
^^^^^^^^^^^^^^^^^^^^^^

**Issue:** I get ``permission denied for /dev/hidrawX`` during update.
  This likely means your user has not the needed permissions to
  read/write the device. Please make sure you have set up the correct
  `udev-rules`_. Download this `udev-rules`_ set and place it in your
  udev rules directory (e.g., ``/etc/udev/rules.d``). Then remove
  your Nitrokey Pro from the USB slot and run: 
  ``udevadm control --reload-rules && udevadm trigger`` or reboot
  your machine. Afterwards the update should work without the 
  permission issue.

.. _udev-rules: https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey.rules
