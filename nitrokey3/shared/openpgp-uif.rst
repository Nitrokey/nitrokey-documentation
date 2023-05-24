OpenPGP Touch confirmation (UIF)
================================

.. include:: ./product_platform_heading.rst

.. contents:: :local:

The Nitrokey 3 OpenPGP functionality supports User Interaction Flags (UIF).

UIF allows configuring the device to prompt for touch confirmation when performing an operation with a key.
UIF can be configured separately for each operation (Signature, Decryption and authentication).

UIF support 3 modes:

- Disabled: the device never prompts for user presence, which is the default behaviour
- Enabled: The device always prompts for user presence
- Permanentaly enabled: Behaves like Enabled, but can only be reverted to Disabled through a factory-reset

Configuration
-------------

With GnuPG 2.3 or more recent:

.. code-block::

	$ gpg --card-edit
	…
	UIF setting ......: Sign=off Decrypt=off Auth=off
	…
	gpg/card> admin

Then, set the UIF flag for the signature operation with ``uif 1 on`` or ``uif 1 off`` or with ``uif 1 permanent``.

The same can be done for decryption: ``uif 2 on`` or ``uif 2 off`` or ``uif 2 permanent``.
And authnetication: ``uif 3 on`` or ``uif 3 off`` or ``uif 3 permanent``.
	