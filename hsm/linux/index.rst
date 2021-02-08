Nitrokey HSM with GNU/Linux
===========================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

1. Install `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__. You need
   at least version 0.19. You can find recent builds for debian-based
   systems like Ubuntu
   `here <https://github.com/Nitrokey/opensc-build>`__ if your system
   does not have the newest version of OpenSC. Alternatively, install
   `this <https://www.cardcontact.de/download/sc-hsm-starterkit.zip>`__
   driver (`source <https://github.com/CardContact/sc-hsm-embedded>`__).
2. Define SO-PIN and PIN of your own choices. See `these
   instructions <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#initialize-the-device>`__.
   Afterwards you can begin to `generate new
   keys <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#generate-key-pair>`__.

Your Nitrokey is now ready to use.
`Checkout <https://www.nitrokey.com/documentation/applications>`__ the
various use cases and supported applications.
