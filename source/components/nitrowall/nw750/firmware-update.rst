Firmware Update
===============

.. spelling:word-list::
   NW750
   merle
   OpenWrt

.. contents:: :local:

For the general firmware update follow `this guide <https://docs.gl-inet.com/router/en/4/interface_guide/firmware_upgrade/>`_ . Afterwards we need to reinstall blue-merle:

1. Make sure the NW750 has a working Internet connection 
2. Connect with the WiFi and login to the alternative OpenWrt web interface at https://192.168.8.1/cgi-bin/luci/ using username ``root`` and the same password used for the other web interface

        .. image:: /components/nitrowall/images/firmware-update/750_1.png

3. Go to "System" -> Software

        .. image:: /components/nitrowall/images/firmware-update/750_2.png

4. Click "update list". This can take a while but if it fails it means you have no Internet connection.

        .. image:: /components/nitrowall/images/firmware-update/750_3.png

        .. image:: /components/nitrowall/images/firmware-update/750_4.png

        .. image:: /components/nitrowall/images/firmware-update/750_5.png

5. click "upload package" and upload `blue-merle <https://www.nitrokey.com/files/ci/nitrowall/latest_blue-merle.ipk>`_

        .. image:: /components/nitrowall/images/firmware-update/750_6.png

6. Click "install"

        .. image:: /components/nitrowall/images/firmware-update/750_update.png

        .. image:: /components/nitrowall/images/firmware-update/750_install_finish.png

Your firmware has been successfully updated.
