Nitrokey HSM with macOS
=======================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

1. Install `OpenSC <https://github.com/OpenSC/OpenSC/wiki>`_.
   Alternatively, install
   `this <https://www.cardcontact.de/download/sc-hsm-starterkit.zip>`_
   driver (`source <https://github.com/CardContact/sc-hsm-embedded>`_).
2. Define SO-PIN and PIN of your own choices. See `these
   instructions <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#initialize-the-device>`_.
   Afterwards you can begin to `generate new
   keys <https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#generate-key-pair>`_.

Your Nitrokey is now ready to use.

* There is `nitrotool <https://github.com/johndoe31415/nitrotool>`_ as a more comfortable frontend to OpenSC. (hsmwiz)
* Embedded Systems: For systems with minimal memory footprint a read/only PKCS#11 module is provided by the `sc-hsm-embedded <https://github.com/CardContact/sc-hsm-embedded>`_ project.
* `This PKCS#11 module <https://github.com/CardContact/sc-hsm-embedded/wiki/PKCS11>`_ is useful for deployments where key generation at the user's workplace is not required. The PKCS#11 module also supports major electronic signature cards available in the German market.
* OpenSCDP: The SmartCard-HSM is fully integrated with `OpenSCDP <https://www.openscdp.org/>`_, the open smart card development platform. See the `public support scripts <https://www.openscdp.org/scripts/sc-hsm/jsdoc/index.html>`_ for details.
