Firmware Update
---------------

.. include:: ./product_platform_heading.rst

.. contents:: :local:


Webupdate
~~~~~~~~~

The easiest way to update a Nitrokey FIDO2 is to open `update.nitrokey.com <https://update.nitrokey.com>`_ in your browser and follow the instructions on the web page.

Update With nitropy
~~~~~~~~~~~~~~~~~~~

If the webupdate does not work for you, you can also use the nitropy CLI (installation guide: :doc:`../../software/nitropy/all-platforms/installation`).  Make sure that no other Nitrokey or FIDO2 devices are connected to your system and then run::

    $ nitropy fido2 update
