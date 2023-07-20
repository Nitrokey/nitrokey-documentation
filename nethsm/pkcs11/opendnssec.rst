OpenDNSSEC
==========

OpenDNSSEC is a tool suite for managing the security of domain names. It can directly load a PKCS11 module and manage the modules.

As OpenDNSSEC needs access to manage the keys, you will need to configure an admintistrator and operator account.

You can configure OpenDNSSEC to load the libnethsm_pkcs11.so module by editing the /etc/opendnssec/conf.xml file. You will need to add the following lines:

.. code-block:: xml

    ...
          <RepositoryList>
                <Repository name="NetHSM">
                        <Module>/root/libnethsm_pkcs11.so</Module>
                        <SkipPublicKey/>
                        <PIN>opPassphrase</PIN>
                        <TokenLabel>LocalHSM</TokenLabel>
                </Repository>
          ...
          </RepositoryList>
    ...

Replace ``/root/libnethsm_pkcs11.so`` with the path to the libnethsm_pkcs11.so module.
You need to match the ``<TokenLabel>`` with the label you set in the ``p11nethsm.conf`` configuration file.
The ``<PIN>`` is the operator PIN, you can either set it in plain text in the ``conf.xml`` file or use ``ods-hsmutil login``. Setting a password in ``p11nethsm.conf`` does not work.

You also need to update the ``<Repository>`` fields in ``/etc/opendnssec/kasp.xml`` to ``NetHSM``.