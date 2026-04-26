Windows Active Directory Certificate Services (ADCS) with PKI Proxy
------------------------------------------------------------

This document describes the configuration of Windows Active Directory Certificate Services (ADCS) with PKI Proxy and NetHSM.

Prerequisits
============

- NetHSM with private key and certificate for the Windows ADCS.
- PKI Proxy server configured to the NetHSM.
- Windows Server
  - ADCS role installed
  - PKI Proxy client tools installed and the respective certificate shared to the ``Local Maschine\My`` key store.

Configuration
=============

1. Run the configuration assisstant for the ADCS role.
2. Follow the instructions
   - Credentials
   - Role Services
   - Setup Type
     - Select **Enterprise CA** or **Standalone CA** depending on your environment.
   - CA Type
     - Select **Root CA**
   - Private Key
     - Check the radio button next to **Select a certificate and use its associated private keys**.
   - Finish the assisstant

########
# TODO #
########

- Algorithm parameters
  RSA (512, 1024, 2048, 4096)
  -> MD2, MD4, MD5, SHA1, SHA256, SHA384, SHA512
  ECDSA (P256, P384, P521)
  -> SHA1, SHA256, SHA385, SHA512

- Configuration of PKI Proxy with the key store.
- Guides
  - Migrate existing CA.
  - Generate key/certificate with Windows.
  - Generate key on NetHSM and certificate on Windows.

