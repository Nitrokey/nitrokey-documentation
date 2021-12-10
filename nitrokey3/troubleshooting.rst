Troubleshooting
===============

.. include:: ./product_platform_heading.rst

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:


Here you will find a collection of common issues. 

**Google and Microsoft Services:**

Currently there seems to be a bug we hope to fix soon which affects the Nitrokey 3 working with some Google and Microsoft Services per FIDO2.

**Browser specific issues:**

Currently not all Browsers work with the Nitrokey 3 FIDO2 capabilities. 
Different sources of the same browser configure it differently and thats why we decided to make a list of browser which work well in our experience:

+-------------------+-----------------+-----------------+--------------------------+
| Operating System  | Browser         | Package Source  | Note                     |   
+===================+=================+=================+==========================+
| Fedora 33         | Chromium 94.0+  | Fedora Packages |                          |   
+-------------------+-----------------+-----------------+--------------------------+
|                   | Firefox 94.0+   | Fedora Packages | Does not work sometimes  |   
+-------------------+-----------------+-----------------+--------------------------+
|                   | Chromium 96+    | Snap            |                          |   
+-------------------+-----------------+-----------------+--------------------------+
| Ubuntu 20.04      | Firefox 94+     | Debian Packages | Does not work sometimes  |   
+-------------------+-----------------+-----------------+--------------------------+
| Debian 11 & 10    | Firefox 78+ ESR | Debian Packages |                          |   
+-------------------+-----------------+-----------------+--------------------------+
|                   | Chromium 90+    | Debian Packages |                          |   
+-------------------+-----------------+-----------------+--------------------------+
| Arch Linux        | Firefox 88+     | Arch Packages   |                          |   
+-------------------+-----------------+-----------------+--------------------------+
|                   | Chromium 90+    | Arch Packages   |                          |   
+-------------------+-----------------+-----------------+--------------------------+
| Mac Os 12         | Firefox 94+     | Firefox.com     |                          |   
+-------------------+-----------------+-----------------+--------------------------+

We are currently testing more browsers to complete the table.

**NFC is not working:**

Please make sure FIDO2 is working correctly. Otherwise NFC won't work either.

**update.nitrokey.com does not work:**

Currently there are no updates available.

