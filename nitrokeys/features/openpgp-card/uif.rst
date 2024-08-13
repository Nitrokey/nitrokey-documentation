OpenPGP Touch Confirmation (UIF)
================================

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

.. contents:: :local:

The Nitrokey 3 OpenPGP Card functionality supports touch button confirmations (so called User Interaction Flags, UIF) when performing cryptographic key operations. It can be configured separately for each operation (Signature, Decryption and Authentication).

UIF supports 3 modes:

- Disabled: The device never prompts for user presence, which is the default behaviour
- Enabled: The device always prompts for user presence
- Permanentaly Enabled: Behaves like Enabled, but can only be reverted to Disabled through a factory-reset

Configuration
-------------

With GnuPG 2.3 or more recent:

::

	$ gpg --card-edit
	…
	UIF setting ......: Sign=off Decrypt=off Auth=off
	…
	gpg/card> admin

Then, set the UIF flag accordingly:

- For signature operation: ``uif 1 on`` or ``uif 1 off`` or with ``uif 1 permanent``.
- For decryption operation: ``uif 2 on`` or ``uif 2 off`` or ``uif 2 permanent``.
- For authentication operation: ``uif 3 on`` or ``uif 3 off`` or ``uif 3 permanent``.
	
