Nitrokey Reset
--------------

.. contents:: :local:

Factory Reset operation regenerates the secret material stored on the Nitrokey FIDO U2F / Nitrokey FIDO2, which makes it a completely new key logic-side. New owner cannot use it to login to account of the previous one. In case of the FIDO2 Resident Keys the material is erased.

To avoid accidental and malicious reset of the Nitrokey, the required
touch confirmation time for the FIDO2 reset operation is longer and with
a distinct LED behavior (red LED light) than normal operations. To reset
the Nitrokey FIDO2, confirm by touching the touch button for at least 5
seconds until the green or blue LED lights up.

Nitrokey FIDO2 could be reset by:

* pynitrokey tool: ``nitropy fido2 reset`` (requires Administrator rights to execute)
* Google Chrome: `Manage security keys` via the direct link: `chrome://settings/securityKeys`

Or by using these instructions (Windows only):

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