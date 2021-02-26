NitroPC with Debian
===========================

.. contents:: :local:

.. toctree::
   :maxdepth: 1
   :glob:
   :hidden:

   *

Using WIFI
-------------------------------

.. code-block:: bash

   sudo apt install bc module-assistant build-essential dkms git
   sudo m-a prepare
   git clone https://github.com/tomaspinho/rtl8821ce.git /tmp/rtl8821ce
   cd /tmp/rtl8821ce
   sudo ./dkms-install.sh

