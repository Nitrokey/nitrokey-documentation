Nitrokey App 1
==============

The Nitrokey App 1 is a graphical application designed to manage Nitrokey Pro and Nitrokey Storage devices.

.. note::

   This application is compatible only with Nitrokey Pro and Nitrokey Storage devices. For Nitrokey 3 devices, please use `Nitrokey App 2 <../nk-app2>`__.

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

Installation
------------

The latest Nitrokey App is version 1.4.2 (`Release notes <https://github.com/Nitrokey/nitrokey-app/releases/>`__, `PGP signatures and older versions <https://github.com/Nitrokey/nitrokey-app/releases/>`__).

Released binaries are signed by PGP key:
`868184069239FF65DE0BCD7DD9BAE35991DE5B22 <https://keys.openpgp.org/vks/v1/by-fingerprint/868184069239FF65DE0BCD7DD9BAE35991DE5B22>`__ `szczepan@nitrokey.com <szczepan@nitrokey.com>`__.

Alpine Linux
************

Nitrokey App isn't an official package to Alpine Linux but this `inofficial package <https://git.alpinelinux.org/aports/tree/community/nitrokey-app/APKBUILD?id=d80ddaa597091157e11b96586ecc8c955920b2a1>`__ can be used.

FreeBSD
*******

Install by executing:

.. code-block:: bash

   $ pkg install nitrokey-app

Guix
****

Further information `here <https://guix.gnu.org/packages/nitrokey-app-1.4.2/>`__.

Windows
*******

Download .exe file from `here <https://github.com/Nitrokey/nitrokey-app/releases/latest>`__.

macOS
*****

**Single-file download**

Download latest Nitrokey App (DMG file) `here <https://github.com/Nitrokey/nitrokey-app/releases/latest>`__.
**Note:** The Nitrokey App was not notarized by Apple yet, which is required by macOS 10.15. See this `forum post <https://support.nitrokey.com/t/failed-install-on-macos-catalina/2047>`__ for more information.

**Homebrew**

Users of `Homebrew <https://brew.sh/>`__ can install this `cask <https://github.com/Homebrew/homebrew-cask-drivers>`__ to install the Nitrokey App via Homebrew.

.. code-block:: bash

   $ brew tap homebrew/cask-drivers
   $ brew install --cask nitrokey

Fedora
******

Nitrokey App `is part <https://koji.fedoraproject.org/koji/packageinfo?packageID=23317>`__ of Fedora's package repositories. Install it by executing:

.. code-block:: bash

   $ sudo dnf install nitrokey-app

Arch Linux
**********

The Nitrokey App is included in the official extra repo. You can install the App by executing:

.. code-block:: bash

   $ pacman -S nitrokey-app

SUSE
****

Nitrokey App `is part <https://software.opensuse.org/download.html?project=security&package=nitrokey-app>`__ of SUSE's package repository. You can just install it `like every other software <https://en.opensuse.org/YaST_Software_Management>`__.

NixOS
*****

Nitrokey App `is part <https://github.com/NixOS/nixpkgs/tree/master/pkgs/tools/security/nitrokey-app>`__ of NixOS's package repository.

Gentoo
******

Nitrokey App `is part <https://github.com/gentoo/gentoo/tree/master/app-crypt/nitrokey-app>`__ of Gentoo's package repositories.

AppImage
********

AppImage provide everything that is needed to get executed. It works like a .exe on Windows and does not need to be installed.
See `here <https://github.com/Nitrokey/nitrokey-app/releases/latest>`__ for our latest Nitrokey-App.AppImage file. After downloading the file, you need to make the file executable.
You can do this by right-clicking on the file and choosing "Properties". Look for the option to make the file executable there.

Flatpak
*******

Execute the following commands:

.. code-block:: bash

   $ flatpak install flathub com.nitrokey.nitrokey-app
   $ flatpak run com.nitrokey.nitrokey-app

For more information visit `Flathub <https://flathub.org/apps/details/com.nitrokey.nitrokey-app>`__.

Snap
****

.. note::

   There is a problem with the current Snap package. Please make sure that scdaemon is installed by typing 
   
   .. code-block:: bash

      $ apt-get update && apt-get install scdaemon
      
   in a terminal and follow the instruction below.

The latest Nitrokey App is available as Snap package which is available for many Linux distributions and which ensures that you always have the latest version installed.
Snapd is already installed on Ubuntu, for distros like Arch, Debian, Fedora, or Gentoo you need to `install snapd <https://snapcraft.io/>`__ first. As soon as you have Snap installed you can open a terminal and type

.. code-block:: bash

   $ sudo snap install nitrokey-app --devmode

to install Nitrokey App. You now can use it as usual, e.g. by pressing Alt + F2 and entering "nitrokey-app".

**Troubleshooting**
In case you get the error "failed to create user data directory. errmsg: Permission denied" during starting the Nitrokey App, it may is because your home directory is encrypted. In this case, apply one of these fixes `[1] <https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/1592696/comments/7>`__ `[2] <https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/1592696/comments/8>`__.

Debian
******

For Debian 9 and newer, the Nitrokey App is included in the Debian repository. You can just install it via Software Center or by typing the following in a terminal:

.. code-block:: bash

   $ sudo apt update
   $ sudo apt install nitrokey-app

Unfortunately, the App versions in the official Debian repositories are often not up-to-date.

Slackware
*********

Available at `Slackbuilds <http://slackbuilds.org/repository/14.2/desktop/nitrokey-app/?search=nitrokey>`__.

Source
******

You can download and compile the source code from `here <https://github.com/Nitrokey/nitrokey-app/>`__. In this case you may need to install `these UDEV rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`__ manually.

