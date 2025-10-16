EJBCA
=====

.. note::
   EJBCA requires at least NetHSM v3 and nethsm-pkcs11 v2.

`EJBCA <https://www.ejbca.org/>`__ is a PKI Certificate Authority software available as open source.

To be able to use NetHSM with EJBCA you need to `setup <pkcs11-setup.html>`__ the NetHSM PKCS#11 module first.

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
---------------

We provide an example setup using docker for testing.
If you want to experiment with it you can use git to clone the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11>`__ and then follow the steps described in the `container/ejbca/README.md <https://github.com/Nitrokey/nethsm-pkcs11/blob/main/container/ejbca/README.md>`__ file.
