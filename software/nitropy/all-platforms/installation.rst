Installing nitropy With pipx
============================

.. contents:: :local:

This guide explains how to install nitropy with `pipx <https://pypa.github.io/pipx/>`__. pipx creates a virtual environment for nitropy. This means that nitropy and its dependencies don’t conflict with other packages installed on your system.

.. note::

   **For Windows users:** Windows support is still experimental -- please use with caution. You can also use pre-compiled binaries or a MSI installer, see :doc:`../windows/installation`.

Preparation
-----------

Python 3.9 or newer 
~~~~~~~~~~~~~~~~~~~
  Python is already installed on most macOS and Linux systems or can be downloaded from `python.org <https://python.org>`__. See the `Downloading Python Guide <https://wiki.python.org/moin/BeginnersGuide/Download>`__ for more information.

pip
~~~~~  
  You can install pip with your system package manager or with ``python3 -m ensurepip``. See the `pip Installation Guide <https://pip.pypa.io/en/stable/installation/>`__ for more information.

pipx
~~~~
Before installing nitropy, you have to install and configure pipx::

    python3 -m pip install --user pipx
    python3 -m pipx ensurepath

See the `pipx Installation Guide <https://pypa.github.io/pipx/installation/>`__ for more information.

Installation
------------

Now you can install nitropy from the pynitrokey package::

    pipx install pynitrokey


nitropy is now available in your path::

    nitropy --help

Upgrade 
-------

You can upgrade the package with the following command::
    pipx upgrade pynitrokey

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

    wget https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey.rules
    sudo mv 41-nitrokey.rules /etc/udev/rules.d/

See :doc:`../linux/udev` for more information.

Next Steps
----------

You can find more information on using nitropy in these guides:

- :doc:`../../../nitrokey3/firmware-update`
