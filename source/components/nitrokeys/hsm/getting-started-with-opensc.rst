Getting Started
===============

.. contents:: :local:


1. 
    .. tabs::
        .. tab:: Linux
            Install `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__. You need
            at least version 0.19. You can find recent builds for debian-based
            systems like Ubuntu
            `here <https://github.com/Nitrokey/opensc-build>`__ if your system
            does not have the newest version of OpenSC. Alternatively, install
            `this <https://www.cardcontact.de/download/sc-hsm-starterkit.zip>`__
            driver (`source <https://github.com/CardContact/sc-hsm-embedded>`__).

        .. tab:: MacOS
            Install `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__.
            Alternatively, install
            `this <https://www.cardcontact.de/download/sc-hsm-starterkit.zip>`__
            driver (`source <https://github.com/CardContact/sc-hsm-embedded>`__).

        .. tab:: Windows
            Install `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`__.
            Alternatively, install
            `this <https://www.cardcontact.de/download/sc-hsm-starterkit.zip>`__
            driver (`source <https://github.com/CardContact/sc-hsm-embedded>`__).

2. Define SO-PIN and PIN of your own choices. See `these
   instructions <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#initialize-the-device>`__.
   Afterwards you can begin to `generate new
   keys <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#generate-key-pair>`__.

Your Nitrokey is now ready to use.

* There is `nitrotool <https://github.com/johndoe31415/nitrotool>`__ as a more comfortable frontend to OpenSC. (hsmwiz)
* Embedded Systems: For systems with minimal memory footprint a read/only PKCS#11 module is provided by the `sc-hsm-embedded <https://github.com/CardContact/sc-hsm-embedded>`__ project. 
* `This PKCS#11 module <https://github.com/CardContact/sc-hsm-embedded/wiki/PKCS11>`__ is useful for deployments where key generation at the user's workplace is not required. The PKCS#11 module also supports major electronic signature cards available in the German market.
* OpenSCDP: The SmartCard-HSM is fully integrated with `OpenSCDP <https://www.openscdp.org/>`__, the open smart card development platform. See the `public support scripts <https://www.openscdp.org/scripts/sc-hsm/jsdoc/index.html>`__ for details. 
