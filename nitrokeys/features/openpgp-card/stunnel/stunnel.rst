Stunnel
=======

.. section products-begin
.. list-table::
   :width: 100%
   :header-rows: 1

   * - `Nitrokey 3 <https://docs.nitrokey.com/nitrokeys/nitrokey3/index.html>`_
     - `Passkey <https://docs.nitrokey.com/nitrokeys/passkey/index.html>`_
     - `FIDO2 <https://docs.nitrokey.com/nitrokeys/fido2/index.html>`_
     - `U2F <https://docs.nitrokey.com/nitrokeys/u2f/index.html>`_
     - `HSM 2 <https://docs.nitrokey.com/nitrokeys/hsm/index.html>`_
     - `Pro 2 <https://docs.nitrokey.com/nitrokeys/pro/index.html>`_
     - `Start <https://docs.nitrokey.com/nitrokeys/start/index.html>`_
     - `Storage 2 <https://docs.nitrokey.com/nitrokeys/storage/index.html>`_

   * - ✓
     - ⨯
     - ⨯
     - ⨯
     - ✓
     - ✓
     - ✓
     - ✓
.. section products-end

.. contents:: :local:

`Stunnel <https://www.stunnel.org/>`__ works as an SSL encryption wrapper between remote client and local (inetd-startable) or remote server. It can be used to add SSL functionality to commonly used inetd daemons like POP2, POP3, and IMAP servers without any changes in the programs' code.

Stunnel is able to load OpenSC PKCS#11 engine using this configuration:

.. code-block:: bash

  engine=dynamic 
  engineCtrl=SO_PATH:/usr/lib/opensc/engine_pkcs11.so
  engineCtrl=ID:pkcs11
  engineCtrl=LIST_ADD:1
  engineCtrl=LOAD
  engineCtrl=MODULE_PATH:/usr/lib/pkcs11/opensc-pkcs11.so
  engineCtrl=INIT

  [service]
  engineNum=1
  key=id_45
