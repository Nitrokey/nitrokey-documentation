Hashicorp Vault
===============

.. note::
   Using a HSM with Hashicorp Vault requires an enterprise license for Vault! If your main use case is (automatic) unsealing with NetHSM, `OpenBao also supports that <https://openbao.org/docs/guides/unseal/pkcs11/nitrokey/>`_

HSM support
-----------

NetHSM can be used to protect your Vault secrets.
It supports all features outlined in the `Vault HSM overview <https://developer.hashicorp.com/vault/docs/enterprise/hsm>`_
through the `NetHSM PKCS#11 module <https://github.com/Nitrokey/nethsm-pkcs11>`_. This includes:

- Root key Wrapping
- Automatic Unsealing
- Seal Wrapping
- Entropy Augmentation

Please refer to the `example setup and documentation for using Vault with NetHSM <https://github.com/Nitrokey/nethsm-pkcs11/tree/main/container/vault>`_.

Managed Keys
------------

Vault can also be configured to use NetHSM for `3rd party key management <https://developer.hashicorp.com/vault/docs/enterprise/managed-keys>`_.
This feature is also provided through PKCS#11 and is enabled by setting up NetHSM as `kms_library in Vault <https://developer.hashicorp.com/vault/docs/configuration/kms-library>`_.

.. note::
   Utilizing managed keys though NetHSM has not been extensively tested. For a basic example, please refer to `the setup documentation <https://github.com/Nitrokey/nethsm-pkcs11/tree/main/container/vault>`_
