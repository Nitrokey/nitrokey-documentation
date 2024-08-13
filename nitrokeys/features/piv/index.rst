PIV (Personal Identity Verification)
====================================

.. section products-begin
.. list-table::
   :width: 100%
   :header-rows: 1

   * - `Nitrokey 3 <https://docs.nitrokey.com/nitrokeys/nitrokey3/index.html>`_
     - `Passkey <https://docs.nitrokey.com/nitrokeys/passkey/index.html>`_
     - `FIDO2 <https://docs.nitrokey.com/nitrokeys/fido2/index.html>`_
     - `U2F <https://docs.nitrokey.com/nitrokeys/u2f/index.html>`_
     - `HSM 2 <https://docs.nitrokey.com/nitrokeys/hsm/index.html>`_
     - `Pro 2 <https://docs.nitrokey.com/nitrokeys/pro/index.html>`_
     - `Start <https://docs.nitrokey.com/nitrokeys/start/index.html>`_
     - `Storage 2 <https://docs.nitrokey.com/nitrokeys/storage/index.html>`_

   * - ✓
     - ⨯
     - ⨯
     - ⨯
     - ⨯
     - ⨯
     - ⨯
     - ⨯
.. section products-end

.. warning::
   The PIV application of the Nitrokey 3 is currently considered unstable and is not available on the stable firmware releases.
   To obtain that functionality it is required to install a test firmware.
   Subsequent firmware updates may lead to loss of data and cryptographic keys.
   Please refer to `the firmware update documentation <../firmware-update.html#firmware-release-types>`__ for more information.

The *Personal Identity Verfication* (PIV) is based on the NIST special publication `SP 800-73 <https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-73-4.pdf>`__.

.. toctree::
   :maxdepth: 1
   :glob:

   Access Control <access_control>
   Certificate Management <certificate_management>
   Factory Reset <factory_reset>
   Key Management <key_management>

   Guides <guides/index>
