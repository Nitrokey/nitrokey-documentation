Verify whether your Nitrokey is genuine
=======================================

.. product-table:: nk3 passkey

.. contents:: :local:

The Nitrokey 3 and Nitrokey Passkey can be verified to be genuine to ensure it matches the security expectations.

What does genuine mean?
-----------------------

Nitrokeys are provisioned with model-specific attestation keys. These attestation keys can only be provisioned by Nitrokey. If the firmware of the keys are tampered with, this attestation certificate will not be available anymore. The Nitrokey user applications like pynitrokey and Nitrokey App2 offers a mechanism to cryptographically validate these certificates to ensure the firmware was not tampered with.

How to check whether the keys are genuine?
------------------------------------------
1. With ``nitropy``

Connect the Nitrokey and run ``nitropy nk3 test`` or ``nitropy nkpk test`` for Nitrokey 3 or Nitrokey Passkey respectively. The FIDO2 test includes the verification test. If the key passes the test, it would imply the key is genuine.

    .. code-block:: shell-session

        [1/5]   uuid            UUID query                      SUCCESS         A56F030D2A3F8E5EB6CCFC883FA17555
        [2/5]   version         Firmware version query          SUCCESS         v1.9.1
        [3/5]   status          Device status                   SUCCESS         Status(init_status=<InitStatus: 0>, ifs_blocks=32, efs_blocks=459, variant=<Variant.LPC55: 1>, model=<Model.NK3: 'Nitrokey 3'>, revision=1)
        Running SE050 test: |
        [4/5]   se050           SE050                           SUCCESS         SE050 firmware version: 3.1.1 - 1.11, (persistent: (27864,), transient_deselect: (607,), transient_reset: (592,))
        Please press the touch button on the device ...
        Please press the touch button on the device ...
        [5/5]   fido2           FIDO2                           SUCCESS

        5 tests, 5 successful, 0 skipped, 0 failed

        Summary: 1 device(s) tested, 1 successful, 0 failed

The test ``FIDO2`` here is successful showing the device is genuine.

2. With Nitrokey App2

The ``Overview`` tab of Nitrokey App2 offers to check for the authenticity of the device when it is connected.

    .. figure:: ./images/genuine/app0.png
        :alt: Overview tab

Clicking the ``Check for Authenticity`` validates the attestation certificate and shows the result.

    .. figure:: ./images/genuine/app1.png
        :alt: Verification successful

Note for Hacker Devices
-----------------------

Nitrokey Hacker devices provisioned with the hacker certificate would fail the authenticity check. However, the failure reason (shown as a tooltip in Nitrokey App2) explicitly mentions when it is so. 