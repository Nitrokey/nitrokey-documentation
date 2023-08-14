EJBCA
=====

`EJBCA <https://www.ejbca.org/>`__ is a PKI Certificate Authority software available as open source.

To be able to use NetHSM with EJBCA you need to `setup <pkcs11-setup.html>`__ the NetHSM PKCS#11 module first.

Then configure EJBCA to use the NetHSM PKCS#11 module by adding an entry in the ``/etc/ejbca/conf/web.properties`` file:

.. code-block:: 

  cryptotoken.p11.lib.418.name=NetHSM
  cryptotoken.p11.lib.418.file=/usr/lib/nitrokey/libnethsm_pkcs11.so


.. note:: The ``418`` in the name is an index that must be unique for each PKCS#11 module in the configuration file.

To be able to generate keys from the interface you need to set the ``enable_set_attribute_value`` option to true in the ``p11nethsm.conf`` file.

.. warning:: Because of some integration problems with the Sun PKCS11 provider, Keys generated from the EJBCA interface will have a random name instead of the name given in the interface.

After restarting EJBCA you can add a new Crypto Token in the EJBCA Admin GUI ``https://mycahostname/ejbca/adminweb/cryptotoken/cryptotokens.xhtml``. The Crypto Token type is ``PKCS#11 Crypto Token`` and the Crypto Token name is ``NetHSM``.


Executing The Example
---------------------

If you want to experiment with the given example you can use git to clone the `nethsm-pkcs11 repository <https://github.com/Nitrokey/nethsm-pkcs11>`__ and run the following commands:

- Configure a NetHSM, either a real one or a container. See the `getting-started guide <getting-started>`__ for more information.
- Change the libnethsm_pkcs11 configuration to match your NetHSM in ``container/ejbca/p11nethsm.conf``.
- Build the container.
  
  .. code-block:: bash
    
    docker build -f container/ejbca/Dockerfile . -t pkcs-ejbca

- Run the container.
  
  .. code-block:: bash
    
    docker run --rm -it -p 9443:8443 -p 9080:8080 -h mycahostname -e TLS_SETUP_ENABLED="simple" pkcs-ejbca
  
The container will be available at `https://localhost:9443/ <https://localhost:9443/>`__.
