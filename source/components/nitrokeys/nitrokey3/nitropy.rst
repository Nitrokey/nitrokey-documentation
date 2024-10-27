Using The Nitrokey 3 With nitropy
---------------------------------

.. contents:: :local:

``nitropy`` can be used to list and manage Nitrokey 3 devices.

Installation
^^^^^^^^^^^^

Please see `this guide <https://docs.nitrokey.com/software/nitropy/all-platforms/installation>`__ for pynitrokey installation instructions.

Listing Nitrokey 3 Devices
^^^^^^^^^^^^^^^^^^^^^^^^^^

Use ``nitropy list`` or ``nitropy nk3 list`` to list all connected devices:

::

    $ nitropy list
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    :: 'Nitrokey FIDO2' keys
    :: 'Nitrokey Start' keys:
    :: 'Nitrokey 3' keys
    /dev/hidraw3: Nitrokey 3

    $ nitropy nk3 list
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    :: 'Nitrokey 3' keys
    /dev/hidraw3: Nitrokey 3

Querying Device Information
^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following commands are currently available for querying device information:

- ``nitropy nk3 version``: queries the firmware version of the device

  ::

      $ nitropy nk3 version
      Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
      v1.0.0

Working With Multiple Devices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If multiple Nitrokey 3 devices are connected, you can use the ``--path`` option to select one of them.  To determine the path of a device, use the ``nitropy list`` or ``nitropy nk3 list`` command.

::

    $ nitropy nk3 version
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    Error: Multiple Nitrokey 3 devices found -- use the --path option to select one

    $ nitropy nk3 list
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    :: 'Nitrokey 3' keys
    /dev/hidraw4: Nitrokey 3 DD59A7F00CCB715DB515F83C346CA8AD
    /dev/hidraw3: Nitrokey 3

    $ nitropy nk3 --path /dev/hidraw3 version
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    v1.0.0

    $ nitropy nk3 --path /dev/hidraw4 version
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    v1.0.1

Troubleshooting
^^^^^^^^^^^^^^^

To diagnose issues with your Nitrokey 3 device, you can use the ``nitropy nk3 test`` command.  It performs a number of tests to determine the state of your device.

If the tests are successful, a summary of the steps is printed:

::

    $ nitropy nk3 test
    Nitrokey tool for Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 & NetHSM
    Found 1 Nitrokey 3 device(s):
    - Nitrokey 3 at /dev/hidraw3

    Running tests for Nitrokey 3 at /dev/hidraw3

    [1/3]   UUID query                      SUCCESS         [not supported]
    [2/3]   Firmware version query          SUCCESS         v1.0.0
    Please press the touch button on the device ...
    Please press the touch button on the device ...
    [3/3]   FIDO2                           SUCCESS

    3 tests, 3 successful, 0 skipped, 0 failed

    Summary: 1 device(s) tested, 1 successful, 0 failed


If a test fails, the error message contains the path of a log file with detailed information.  Please include this log file in support requests.

If you have set a FIDO2 pin for your device, you have to use the ``--pin`` option:

::

    $ nitropy nk3 test --pin 1234
