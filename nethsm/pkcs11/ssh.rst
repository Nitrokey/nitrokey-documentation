SSH
===

You can use NetHSM for SSH authentication. You need to pass the module path in the command line or the SSH configuration.

.. tabs::
  .. tab:: Command line
    .. code-block:: bash
       
      ssh -I PKCS11Provider=/usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so user@host
  
  .. tab:: SSH config
    .. code-block:: 
       
      Host example.com
        PKCS11Provider /usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so


SSH will search for a key on the NetHSM that is accepted by the server.

To list the keys of a NetHSM in a SSH ``authorized_keys`` format, use the following command:

.. code-block:: bash

  ssh-keygen -D /usr/lib/x86_64-linux-gnu/pkcs11/libnethsm_pkcs11.so -e