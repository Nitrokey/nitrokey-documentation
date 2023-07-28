OpenDNSSEC
==========

`OpenDNSSEC <https://www.opendnssec.org/>`__ is a tool suite for managing the security of domain names. It can directly load a PKCS#11 module and manage the keys.

To install and setup OpenDNSSEC, you can follow the `OpenDNSSEC Quick Start Guide <https://wiki.opendnssec.org/display/DOCS20/Quick+start+guide>`__. You don't need to install ``SoftHSM``, the NetHSM PKCS#11 module will be used instead.

As OpenDNSSEC needs access to manage the keys and then use them, you will need to configure both administrator and operator account in the PKCS#11 module configuration file.

You can configure OpenDNSSEC to load the libnethsm_pkcs11.so module by editing the ``/etc/opendnssec/conf.xml`` file. You will need to add the following lines:

.. code-block:: xml
      <?xml version="1.0" encoding="UTF-8"?>

      <Configuration>

      ...
      
          <RepositoryList>
                <Repository name="NetHSM">
                        <Module>/root/libnethsm_pkcs11.so</Module>
                        <PIN>opPassphrase</PIN>
                        <TokenLabel>LocalHSM</TokenLabel>
                </Repository>
          ...

          </RepositoryList>

      ...

      </Configuration>


Replace ``/root/libnethsm_pkcs11.so`` with the path to the libnethsm_pkcs11.so module.
You need to match the ``<TokenLabel>`` with the label you set in the ``p11nethsm.conf`` configuration file.
The ``<PIN>`` is the operator PIN, you can either set it in plain text in the ``conf.xml`` file or use ``ods-hsmutil login``. OpenDNSSEC need to have a pin provided or it will refuse to start.

You also need to update the ``<Repository>`` fields in ``/etc/opendnssec/kasp.xml`` to ``NetHSM`` instead of the default ``SoftHSM`` : 

.. code-block:: xml

      <KASP>
            <Policy name="...">
                 
                  ...

                  <Keys>

                        ...

                        <KSK>
                                ...
                                <Repository>NetHSM</Repository>
                        </KSK>
                        <ZSK>
                                ...
                                <Repository>NetHSM</Repository>
                        </ZSK>
                </Keys>
                
                ...
            
            </Policy>

            ...

      </KASP>
