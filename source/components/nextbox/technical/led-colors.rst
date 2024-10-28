LED Colors and Patterns
=======================

=============== ===========  ==============================================================
Color           Pattern      Description
=============== ===========  ==============================================================
Dimmed-out-Blue None         NextBox is booting
Green           None         NextBox Daemon active and in regular operating mode
Green           Fast-Blink   Nextcloud is starting up (docker starting)
Blue            None         (Reset) button is currently being pressed
Blue            Blink        Soft-Reset is ongoing
Yellow          None         Initializing NextBox Daemon
Yellow          Blink        NextBox Daemon update check/apply
Red             Blink        Factory-Reset is ongoing
Purple          None         Nextcloud Maintenance mode active
=============== ===========  ==============================================================

* **Fast-Blink** means 0,5secs on and 0,5secs off
* **Blink** means 2secs on and 2secs off

If the LED is *purple*, the Nextcloud instance is in maintenance mode, you can force
exit the maintenance mode by pushing the hardware button **shortly, once**. The NextBox
will then switch-off the maintenance mode.

.. hint::
   As of today if the maintenance mode is switched using the button press, the "mail"
   app will in addition be disabled as the version 1.11.0 together with Nextcloud
   version 21.0.0.x will never exit the maintenance mode.


