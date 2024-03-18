Nitrokey Reset
--------------

.. contents:: :local:

The Factory Reset operation deletes the FIDO secret keys stored on the Nitrokey and generates new ones. Afterwards the Nitrokey behaves like a new device.

To avoid accidental and malicious reset of the Nitrokey, the required
touch confirmation time for the FIDO2 reset operation is longer and with
a distinct LED behavior (red LED light) than normal operations. To reset
the Nitrokey, confirm by touching the touch button for at least 5
seconds until the green or blue LED lights up.

Windows 10
~~~~~~~~~~

Make sure you use at least version 2004. Please follow
Windows’ reset wizard.

If the total taken time for execution will be more than 10 seconds, the
Windows OS’ user interface will report failure. Reset operation is
executed on the Nitrokey even after the latter is reported failing, as
long as the user’s touch will be registered before the Nitrokey’s
internal operation timeout (touch confirmation is shown with the blue
color).

Windows 10 on a Virtual Machine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please keep in mind Nitrokey has internal timeout for accepting the FIDO
reset operation of 10 seconds since powering up. If the Nitrokey will
connect to a virtual machine later than that, it will return error and
the operation will be aborted.

Other Ways to Reset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Nitrokey can also be reset by:

* pynitrokey tool: ``nitropy fido2 reset`` (requires Administrator rights to execute)
