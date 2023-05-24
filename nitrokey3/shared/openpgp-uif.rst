OpenPGP Touch Confirmation (UIF)
================================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

The Nitrokey 3 OpenPGP Card functionality supports touch button confirmations (so called User Interaction Flags, UIF) when performing cryptographic key operations. It can be configured separately for each operation (Signature, Decryption and Authentication).

UIF supports 3 modes:

- Disabled: The device never prompts for user presence, which is the default behaviour
- Enabled: The device always prompts for user presence
- Permanentaly Enabled: Behaves like Enabled, but can only be reverted to Disabled through a factory-reset

Configuration
-------------

With GnuPG 2.3 or more recent:

.. code-block::

	$ gpg --card-edit
	…
	UIF setting ......: Sign=off Decrypt=off Auth=off
	…
	gpg/card> admin

Then, set the UIF flag accordingly:

- For signature operation: ``uif 1 on`` or ``uif 1 off`` or with ``uif 1 permanent``.
- For decryption operation: ``uif 2 on`` or ``uif 2 off`` or ``uif 2 permanent``.
- For authentication operation: ``uif 3 on`` or ``uif 3 off`` or ``uif 3 permanent``.
	
