Update Firmware
===============
.. contents:: :local:

For the General firmware update follow this `Guide <https://docs.gl-inet.com/router/en/4/interface_guide/firmware_upgrade/>`_ . After that we need to reinstall blue merle:

0. make sure the NW750 has a working internet connection 
1. connect with the wifi and login to the alternativ openwrt  https://192.168.8.1/cgi-bin/luci/

        .. image:: /nitrowall/images/750_1.png

2. goto "System" -> Software

        .. image:: /nitrowall/images/750_2.png

3. click "update list". This can take a while but if it fails it means you have no internet connection

        .. image:: /nitrowall/images/750_3.png

        .. image:: /nitrowall/images/750_4.png

        .. image:: /nitrowall/images/750_5.png

4. click "upload packackge" and upload the `blue-merle_2.0.1-101_mips_24kc.ipk <https://www.nitrokey.com/files/ci/nitrowall/blue-merle_2.0.1-101_mips_24kc.ipk>`_

        .. image:: /nitrowall/images/750_6.png

5. click "install"

        .. image:: /nitrowall/images/750_update.png

        .. image:: /nitrowall/images/750_install_finish.png


6. Finished 
