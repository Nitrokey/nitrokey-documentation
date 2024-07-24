Nextcloud FAQ
=============

**Q:** What to do to run/install/fix Nextcloud App "XYZ"? Why does Nextcloud feature XYZ not work?
  Generally we cannot help in detail for these topics. Nextcloud internals and apps are 
  out-of-scope for the NextBox development as we use the stock Docker images provided by Nextcloud.
  Ultimately, if some NextBox/OS configuration is blocking an app to run properly we for sure will
  look into fixing it.

**Q:** Why does Nitrokey currently not recommend to use OnlyOffice or Collabora Office on the NextBox?
  The state of these Nextcloud apps is not yet mature (for ARM platforms). Although it is (partly)
  possible to install them we do not recommend doing so currently.

**Q:** Why does updating Nextcloud from inside Nextcloud not work?
  The Nextcloud version is rolled out by us. Thus the option to update from inside Nextcloud
  is not working. 

**Q:** Can I add apps to the Nextcloud instance?
  Yes, the Nextcloud app store is available and any app available there can be installed through
  the Nextcloud web frontend.

**Q:** My Nextcloud instance is stuck in "Maintenance Mode", how can I switch it off?
  To *force exit* the Nextcloud "Maintenance Mode", you can push the hardware button **shortly, once**. The
  NextBox will then switch-off the maintenance mode. Please avoid this, if possible.

**Q:** Why am I getting a permission warning for ``/var/www/html/custom_apps/nextbox`` inside the Nextcloud settings overview?
  This is a "feature". The NextBox Nextcloud App is installed on the system
  with the Debian nextbox package. To avoid an accidental deletion of the NextBox 
  Nextcloud App from within the Nextcloud app management, the stated directory 
  can not be written by Nextcloud, this is what Nextcloud is complaining about here.

**Q:** How can I run Nextcloud's `occ`?
  As Nextcloud is running inside a Docker container, you need to be root and execute the following:
  ``docker exec -it -u www-data nextbox-compose_app_1 /var/www/html/occ``

**Q:** What to do about missing php-modules like `imagemagick`?
  Similar to Apache, PHP is also provided by the Nextcloud container, therefore as we are using
  the stock Nextcloud container this will also only be resolved once this is resolved by
  the Nextcloud Team.

**Q:** Why is my Nextcloud not loading properly, instead I get a white page and a `.htaccess` error?
  This usually is an indication that the OS has unmounted/detached the internal
  hard-drive due to an low-power-incident. Please make sure you read and
  understood :ref:`USB power<faq-nextbox-hardware-usb-power-supply>`. In most
  cases doing a power-cycle (unplug the USB-C connector, wait 5secs and plug it
  in again) should resolve this. **Make sure no additional USB devices are
  connected during this procedure.**





