PKCS#11 Setup
=============


Installation
------------

You can either get the NetHSM PKCS#11 module as a precompiled binary or compile it from source.

Precompiled Binaries
~~~~~~~~~~~~~~~~~~~~

1. Download the module file corresponding to your system from the `releases page <https://github.com/Nitrokey/nethsm-pkcs11/releases>`__ of the repository.
2. Copy the module file to the directory where your PKCS#11 applications expect to find it.

Compile From Source
~~~~~~~~~~~~~~~~~~~

1. Install the `Rust toolchain <https://www.rust-lang.org/tools/install>`__.
2. Download and extract the source from the `releases page <https://github.com/Nitrokey/nethsm-pkcs11/releases>`__ or clone the `repository <https://github.com/Nitrokey/nethsm-pkcs11>`__.
3. Run ``cargo build --release`` in the source directory.


Configuration
-------------

By default the module searches for configuration files in:

- ``/etc/nitrokey/p11nethsm.conf``
- ``/usr/local/etc/nitrokey/p11nethsm.conf``
- ``$HOME/.config/nitrokey/p11nethsm.conf``

If multiple files are present the configurations will be merged so that the slots of all the config files will be used by the module.

You can manually set the config file location (only this one will be read) with the env variable ``P11NETHSM_CONFIG_FILE`` (e.g. ``P11NETHSM_CONFIG_FILE=./p11nethsm.conf``).

Configuration File Format
~~~~~~~~~~~~~~~~~~~~~~~~~

The configuration is yaml-formatted:

.. tabs::
  .. tab:: All platforms
    .. code-block:: yaml
      
        # Set this option to true to enable the compatibility option for the C_SetAttributeValue() function.
        # This allows the applications using the Java Sun PKCS11 module (like EJBCA) to generate keys.
        # When using this, the names given to the keys will be ignored and the keys will have random names.
        # Under the hood it will store in memory the name given to the key when calling C_SetAttributeValue(). When a certificate is uploaded it will check if the name was previously passed to C_SetAttributeValue() and translate it to the real name on the NetHSM.
        enable_set_attribute_value: false

        # You can set the log file location here.
        # If no value is set the module will output to stderr.
        # If a value is set it will output to the file.
        log_file: /tmp/p11nethsm.log
        # Optional log level
        log_level: Debug

        # Each "slot" represents a NetHSM server
        slots:
          - label: LocalHSM                        # Name you NetHSM however you want
            description: Local HSM (docker)        # Optional description
            
            # Users connecting to the NetHSM server
            operator:
              username: "operator"                       
              password: "env:LOCALHSMPASS"    
            administrator:
              username: "admin"

            # List the NetHSM instances 
            instances:
              - url: "https://keyfender:8443/api/v1"   # URL to reach the server
                # When the NetHSM has a self-signed certificate, it can be verified by a sha256 fingerprint of the NetHSM's certificate :
                sha256_fingerprints: 
                  - "31:92:8E:A4:5E:16:5C:A7:33:44:E8:E9:8E:64:C4:AE:7B:2A:57:E5:77:43:49:F3:69:C9:8F:C4:2F:3A:3B:6E"
                

Instances
~~~~~~~~~

If multiple NetHSM instances are listed in the same slot, these instances must be configured in a cluster. The credentials of the users and the keys must be the same on all instances.

The module will use the instances in a round-robin fashion, trying another instance if one fails.


Users
~~~~~

The operator and administrator users are both optional but the module won't start if no user is configured. This is so you can configure the module with only an administrator user, only an operator user or both at the same time.

When the two users are set the module will use the operator by default and only use the administrator user when the action needs it.

The regular PKCS11 user is mapped to the NetHSM operator and the PKCS11 SO is mapped to the NetHSM administrator.

Passwords
~~~~~~~~~

The password can be provided by multiple means:

- In plain text in the configuration ``password: "mypassword"``
- In an environment variable read by the module with the ``env:`` prefix: ``env:ENV_STORING_THE_PASSWORD``
- Via the login function of pkcs11, example for pcks11-tool: ``pkcs11-tool --module libnethsm_pkcs11.so -p opPassphrase``
  To provide the the admin password you need to use ``--so-pin`` instead: ``pkcs11-tool --module libnethsm_pkcs11.so --login --login-type so --so-pin Administrator``

If the password of an user is not set in the configuration file a login will be required to provide the password (3rd method).

A NetHSM that is not operational is considered as a slot with the token not present.
