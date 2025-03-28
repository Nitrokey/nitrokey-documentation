Manage the Nitrokey Passkey
===========================


Browser
-------

This works with all chromium based browsers. Sometimes the options are missing in Windows.








nitropy
-------

You can use the command line tool nitropy to manage the Nitrokey Passkey. 

.. code-block:: bash

   ~ nitropy nkpk

   Command line tool to interact with Nitrokey devices 0.7.4
   Usage: nitropy nkpk [OPTIONS] COMMAND [ARGS]...

    Interact with Nitrokey Passkey devices, see subcommands.

    Options:
     -p, --path TEXT  The path of the Nitrokey 3 device
     -h, --help       Show this message and exit.

    Commands:
    fetch-update     Fetches a firmware update and stores it at the given...
    list             List all devices.
    reboot           Reboot the key.
    rng              Generate random data on the device.
    status           Query the device status.
    test             Run some tests on all connected devices.
    validate-update  Validates the given firmware image and prints the...
    version          Query the firmware version of the device.

Windows
-------

