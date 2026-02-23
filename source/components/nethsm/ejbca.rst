EJBCA
=====

.. note::
   EJBCA requires at least NetHSM v3 and nethsm-pkcs11 v2.

`EJBCA <https://www.ejbca.org/>`__ is a PKI Certificate Authority software available in both Community (CE) and Enterprise Edition (EE).

EJBCA Community
---------------

EJBCA Community Edition is an open source PKI Certificate Authority software.

To be able to use NetHSM with EJBCA CE you need to `setup <pkcs11-setup.html>`__ the NetHSM PKCS#11 module first.

Then configure EJBCA to use the NetHSM PKCS#11 module by adding an entry in the ``/etc/ejbca/conf/web.properties`` file:

.. code-block:: cfg

   cryptotoken.p11.lib.418.name=NetHSM
   cryptotoken.p11.lib.418.file=/usr/lib/nitrokey/libnethsm_pkcs11.so
   cryptotoken.p11.lib.418.canGenerateKey=true


.. note::
   The ``418`` in the name is an index that must be unique for each PKCS#11 module in the configuration file.

After restarting EJBCA you can add a new Crypto Token in the EJBCA Admin GUI ``https://mycahostname/ejbca/adminweb/cryptotoken/cryptotokens.xhtml``.
The Crypto Token type is ``PKCS#11 Crypto Token`` and the Crypto Token name is ``NetHSM``.


Docker Example
^^^^^^^^^^^^^^

We provide an example setup using docker for testing.
If you want to experiment with it you can use git to clone the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11>`__ and then follow the steps described in the file `container/ejbca/README.md <https://github.com/Nitrokey/nethsm-pkcs11/blob/main/container/ejbca/README.md>`__.

EJBCA Enterprise
----------------

EJBCA Enterprise Edition provides advanced features and enterprise support.

Configuration for EJBCA EE differs from the Community Edition. Instead of configuring the PKCS#11
module directly in EJBCA, the Enterprise Edition uses a **sidecar container** approach. This sidecar
container provides the p11ng (PKCS#11 Next Generation) connection to NetHSM, enabling seamless
integration without modifying the main EJBCA container.

For detailed information on configuring Hardware Security Modules (HSM) with EJBCA EE, refer to the
official `EJBCA HSM documentation <https://docs.keyfactor.com/ejbca/latest/hardware-security-modules-hsm>`__.

Docker Setup
^^^^^^^^^^^^

We provide a complete containerized setup for EJBCA EE integration with NetHSM. The setup includes:

- EJBCA EE container
- NetHSM PKCS#11 sidecar container (p11ng)
- NetHSM container for testing

You can find the container image and configuration in
the `container/ejbca-ee/ directory <https://github.com/Nitrokey/nethsm-pkcs11/tree/main/container/ejbca-ee>`__ of
the nethsm-pkcs11 repository.

The directory includes a complete ``docker-compose.yml`` file that brings up all necessary components,
including a NetHSM instance for testing purposes. This provides a ready-to-use environment for
experimenting with EJBCA EE and NetHSM integration.

.. note::
   ``Dockerfile`` and ``docker-compose.yml`` contain references to the official repositories, make
   sure to run ``docker login`` before making use of them.

Currently a limitation is that there is no way to select the *Padding Scheme* for a particular
*Crypto Token*. Therefore RSA will always use PKCS#1 padding (and not PSS).
