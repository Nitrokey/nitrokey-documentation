Installing nitropy With pipx
============================

This guide explains how to install nitropy with `pipx <https://pypa.github.io/pipx/>`__. pipx creates a virtual environment for nitropy. This means that nitropy and its dependencies don’t conflict with other packages installed on your system.

.. note::

   **For Windows users:** Windows support is still experimental -- please use with caution. You can also use pre-compiled binaries or a MSI installer, see :doc:`../windows/installation`.

Installation on Linux
---------------------

Ubuntu, Debian
~~~~~~~~~~~~~~
You can install nitropy along with all other required dependencies by using::

    sudo apt install pipx && pipx ensurepath && pipx install pynitrokey

After logging out or restarting your system, nitropy will now be available.

Arch
~~~~
You can install nitropy along with all other required dependencies by using::

    sudo pacman -S python python-pipx && pipx ensurepath && pipx install pynitrokey

If you have already installed Python on your system, you can simply run::
    
    sudo pacman -S python-pipx && pipx ensurepath && pipx install pynitrokey

After logging out or restarting your system, nitropy will now be available.


Installation on other distributions/operating systems
-----------------------------------------------------

Preparation
~~~~~~~~~~~

Python
""""""
Python is already installed on most macOS and Linux systems or can be downloaded from `python.org <https://python.org>`__.
Currently the supported Python versions are 3.9, 3.10, 3.11, 3.12 and 3.13.
See the `Downloading Python Guide <https://wiki.python.org/moin/BeginnersGuide/Download>`__ for more information.

pip
"""
You can install pip with your system package manager or with ``python3 -m ensurepip``. See the `pip Installation Guide <https://pip.pypa.io/en/stable/installation/>`__ for more information.

pipx
""""
Before installing nitropy, you have to install and configure pipx::

    python3 -m pip install --user pipx
    python3 -m pipx ensurepath

See the `pipx Installation Guide <https://pipx.pypa.io/stable/>`__ for more information.

Installation
~~~~~~~~~~~~

Now you can install nitropy from the pynitrokey package::

    pipx install pynitrokey


nitropy is now available in your path::

    nitropy --help

Upgrade 
-------

You can upgrade the package with the following command::

    pipx upgrade pynitrokey
    
Troubleshooting
---------------

If you encounter problems, please make sure that you use the latest version by comparing the output of ``nitropy version`` with the `release list <https://github.com/Nitrokey/pynitrokey/releases>`_ on GitHub.  If an upgrade does not install the latest version, you might be running into one of the following problems.

Wrong Python Version
~~~~~~~~~~~~~~~~~~~~

nitropy requires Python 3.9 or 3.10.  If your default Python installation is older or newer than that and cannot be updated, you have to additionally install Python 3.9 and specify the name of its Python executable when calling pipx, for example::

    $ pipx install --python python3.9 pynitrokey
    
libusb-1.0.dylib not found
~~~~~~~~~~~~~~~~~~~~~~~~~~

When running nitropy on macOS, you might see an error message indicating a missing libusb-1.0.dylib file.  This can be fixed by manually installing libusb, e. g. with homebrew::

    $ brew install libusb

Usage Notes
-----------

All Platforms
~~~~~~~~~~~~~

If you want to use nitropy with a Nitrokey Pro or Nitrokey Storage device, you also have to install `libnitrokey <https://github.com/Nitrokey/libnitrokey>`__.

Windows
~~~~~~~

Windows support is still experimental -- please use with caution.

You might have to run nitropy with administrator rights to be able to connect to a device.

Linux
~~~~~

On Linux systems, you also need the Nitrokey udev rules. These are shipped with `libnitrokey <https://github.com/Nitrokey/libnitrokey>`__. Alternatively, you can install them manually::

    wget https://raw.githubusercontent.com/Nitrokey/nitrokey-udev-rules/refs/heads/main/41-nitrokey.rules
    sudo mv 41-nitrokey.rules /etc/udev/rules.d/

See :doc:`../linux/udev` for more information.

Usage of PIV features
---------------------

To be able to use the PIV functionality of nitropy (``nitropy nk3 piv``), you need to install the ``pyscard`` dependency too:

    pipx install pynitrokey[pcsc]

Next Steps
----------

You can find more information on using nitropy in these guides:

- For Linux: :doc:`../../../nitrokeys/nitrokey3/firmware-update`
- For Mac: :doc:`../../../nitrokeys/nitrokey3/firmware-update`
- For Windows: :doc:`../../../nitrokeys/nitrokey3/firmware-update`
