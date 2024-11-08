Test Nitrokey 3
===============

This guide describes how to test the Nitrokey 3.


1. Make sure you have the latest `pynitrokey` version installed, please check the `installation instructions`_ for your OS.
2. Run ``nitropy nk3 test`` this will launch several tests over your key.
3. During the test, when asked touch the key.

This is an example of a working key::

   $ nitropy nk3 test 
   Command line tool to interact with Nitrokey devices 0.4.46
   Found 1 Nitrokey 3 device(s):
   - Nitrokey 3 at /dev/hidraw2
   Running tests for Nitrokey 3 at /dev/hidraw2
   [1/5]   uuid            UUID query                      SUCCESS         DBA5FA34F3DE6F579F26FC62CD8C6F5D
   [2/5]   version         Firmware version query          SUCCESS         v1.6.0
   [3/5]   status          Device status                   SUCCESS         Status(init_status=<InitStatus.0: 0>, ifs_blocks=42, efs_blocks=465, variant=<Variant.LPC55: 1>)
   Running SE050 test: |                                                                                                                                
   [4/5]   se050           SE050                           SKIPPED         Testing SE050 functionality is not supported by the device
   Please press the touch button on the device ...
   Please press the touch button on the device ...
   [5/5]   fido2           FIDO2                           SUCCESS  
   5 tests, 4 successful, 1 skipped, 0 failed
   Summary: 1 device(s) tested, 1 successful, 0 failed

In case of any errors please take the logs from ``/tmp`` directory (``/tmp/nitropy.log.*``).


.. _installation instructions: ./installation.html
