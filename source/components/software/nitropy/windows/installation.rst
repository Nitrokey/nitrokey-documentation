Installing nitropy on Windows
=============================

.. note::
   Generally Windows support and the installer are experimental - please use with caution.

.. note::
   If you already use Python on your system and are familiar with the command prompt, you can alternatively install nitropy with pipx, see :doc:`../all-platforms/installation`.

Using our Release
-----------------

1. Download the latest ``.exe`` file from `releases <https://github.com/Nitrokey/pynitrokey/releases/>`__.
2. Open the command console in the administrator mode (Windows 10: press the right mouse button on the Menu Start and select "Windows PowerShell (Admin)" from the menu).
3. Change to the directoy of the ``.exe`` (something like ``cd C:\Users\YOURUSER\Downloads``)
4. Execute ``nitropy-VERSION.exe``

.. note::
   If you're using Microsoft Edge, the downloaded ``.exe`` might be marked as "untrused" by Windows. To mark it as trusted anyway, click the three dot on the right of the warning, then "keep", then "show more" and finally "keep anyway".

  .. figure:: ./windowswarning/threedotsmore.png
     :alt: The warning displayed by Edge

  .. figure:: ./windowswarning/keep-anyway.png
     :alt: The keep anyway button

.. note::
   Without administrator privileges nitropy might not be able to communicate to the device.

Using Winget
------------

If you don't have Winget installed on your system you can download and install it from `here <https://github.com/microsoft/winget-cli/releases>`__.

1. Open PowerShell and run this command: ``winget install --id=NitrokeyGmbH.Nitropy  -e``

2. Close PowerShell and relaunch it.

You can find our package informations `here <https://winstall.app/apps/NitrokeyGmbH.Nitropy>`__.

Known Issues
------------

- Support for Nitrokey Start under Windows 10 is not working without installing libusb libraries (to be described)
- The installer does not remove a previous installation (manually remove it using settings -> programs and apps)

