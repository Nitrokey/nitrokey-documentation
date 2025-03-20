Windows Install
===============

Using Winget
------------

If you don't have Winget installed on your system you can download and install it from `here <https://github.com/microsoft/winget-cli/releases>`__.

1. Open PowerShell and run this command: ``winget install --id=NitrokeyGmbH.Nitrokey-App  -e``

You can find our package informations `here <https://winstall.app/apps/NitrokeyGmbH.Nitrokey-App>`__.


Using Chocolatey
----------------

If you don't have Chocolatey installed on your system you can find instructions `here <https://chocolatey.org/install>`__.

1. Open PowerShell and run this command: ``choco install nitrokey-app2``

You can find our package informations `here <https://community.chocolatey.org/packages/nitrokey-app2>`__.


Using our MSI File
------------------

1. `Download <https://github.com/Nitrokey/nitrokey-app2/releases>`__ the Windows installer (MSI file).

   .. note::
      If you're using Microsoft Edge, the downloaded ``.msi`` might be marked as "untrused" by Windows. To mark it as trusted anyway, click the three dot on the right of the warning, then "keep", then "show more" and finally "keep anyway".

2. Execute the Windows installer to install Nitrokey App 2 to your system.
3. Start Nitrokey App 2 from your applications.

Alternatively, you can download and execute the portable Windows binary without installation.

Silent installations are possible with the parameter **/qn**.

.. code-block::
   :caption: Example for a silent/mass installation

       msiexec.exe /qn /i nitrokey-app-v2.2.2-x64-windows-installer.msi
