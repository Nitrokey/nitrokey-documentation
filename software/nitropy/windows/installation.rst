Installing nitropy on Windows
=============================

.. note::
   Generally Windows support and the installer are experimental - please use with caution.

.. note::
   If you already use Python on your system and are familiar with the command prompt, you can alternatively install nitropy with pipx, see :doc:`../all-platforms/installation`.

How to Install
--------------

- Download the latest ``.msi`` installer from `releases <https://github.com/Nitrokey/pynitrokey/releases/>`_.
- Double-click the installer and click through (*Next* and *Finish*)
- Open the command console in the administrator mode (Windows 10: press the right mouse button on the Menu Start and select "Windows PowerShell (Admin)" from the menu).
- Enter ``nitropy``

Without administrator privileges nitropy might not be able to communicate to device.

Known Issues
------------

- Support for Nitrokey Start under Windows 10 is not working without installing libusb libraries (to be described)
- The installer does not remove a previous installation (manually remove it using settings -> programs and apps)
