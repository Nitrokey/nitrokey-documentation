Disabling Intel Management Engine
---------------------------------

.. Note::
    With Heads Intel ME is already disabled.

By default Intel ME is not disabled with Dasharo Tianocore UEFI.

In order to disable it follow theses steps:

1. Boot your computer and access to the UEFI menu by pressing the "ESC" key.

2. In the menu navigate to "Dasharo System Features".

3. Then "Intel Management Engine Options".

4. From this menu you will have two diffrent ways to disable Intel ME:

- Disabled (Soft) - when set, causes the Dasharo firmware to send ME_DISABLE command via MEI/HECI. MEI/HECI interface is being hidden from OS when ME is disabled.
- Disabled (HAP) - when set, causes the Dasharo firmware to set HAP bit in the flash descriptor. MEI/HECI interface is being hidden from OS when ME is disabled. HAP method is much more efficient as it halts the ME firmware execution even earlier than Soft Disable described above.

5. Save the changes and reboot.
