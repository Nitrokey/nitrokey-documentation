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

      # Optional log level, acceptable  values are Trace, Debug, Info, Warn and Error
      log_level: Debug

      # By default, the module logs to both syslog and stderr, trying the sockets /dev/log, /var/run/syslog and finally /var/run/log
      # A custom socket can be configured:
      syslog_socket: /var/nethsm/log
      # Instead of a socket, a custom UDP or TCP syslog can be configured:
      # syslog_udp: 
      #    to_addr: 127.0.0:1:514
      #    from_addr: 127.0.0:1:4789
      # syslog_tcp: 127.0.0.1:601
      # Only one option among "syslog_socket", "syslog_udp", "syslog_tcp" can be configured at the same time

      # You can configure the syslog facility ( "kern", "user", "mail", "daemon", "auth", "syslog", "lpr", "news", "uucp", "cron", "authpriv", "ftp", "local0", "local1", "local2", "local3", "local4", "local5", "local6" or "local7"):
      syslog_facility: "user"
      # You can set the hostname (for use only with syslog_udp or syslog_tcp)
      # syslog_hostname: "localhsm-pkcs11"
      # You can set the process name (defaults to the process name obtained from the OS)
      # syslog_process: "NetHSM Pkcs11"
      # You can set the pid used in logs (defaults to the process id obtained from the OS)
      # syslog_pid: 0
      # You can also configure a custom file, or "-" for stderr.
      # log_file: /tmp/p11nethsm.log

      # Each "slot" represents a HSM cluster of server that share the same user and keys.
      slots:
        - label: LocalHSM                        # Name your NetHSM however you want
          description: Local HSM (docker)        # Optional description

          # Users connecting to the NetHSM server
          operator:
            username: "operator"
            # If the password starts with `env:`, it will obtain the password from an environment variable:
            # password: "env:LOCALHSMPASS"
            password: "localpass"
          administrator:
            username: "admin"

          # List the NetHSM instances
          instances:
            - url: "https://keyfender:8443/api/v1"   # URL to reach the server
              # To avoid having to re-open connections on each requests, the module keeps a connection pool to each instance. If the module is used by a multithreaded application, multiple connections can be opened at the same time.
              # This configures the maximum number of connections in the pool at the same time.
              # Note that this does not limit the total number of open connections.
              # Having a degree of parrallelism that is higher than the max number of idle connection can lead overhead as those connections will be closed an re-opened frenquently
              max_idle_connections: 10
              # By default, the certificate of the HSM will be validated using the system's root certificate authority.
              # When the NetHSM uses a self-signed certificate, it can be verified against an allowed list of sha256 fingerprint of the NetHSM's certificate:
              sha256_fingerprints:
                - "31:92:8E:A4:5E:16:5C:A7:33:44:E8:E9:8E:64:C4:AE:7B:2A:57:E5:77:43:49:F3:69:C9:8F:C4:2F:3A:3B:6E"
              # Alternatively certificate checks can be skipped entirely with danger_insecure_cert option.
              # This should be avoided if possible and certainly not used with a productive NetHSM.
              # danger_insecure_cert: true
          # Configure the network retry mechanism. If absent, no retries are attempted on a network error
          retries:
            # The number of retries after a network error
            count: 3
            # The delay between retries, in integer seconds
            delay_seconds: 1
          # it is possible to configure idle connections to make use of TCP keepalives, preventing the closing of connections by a firewall or detecting such cases
          tcp_keepalive:
            # the number of seconds before keepalives packets start being sent
            # Corresponds to `TCP_KEEPIDLE` on Linux, `TCP_KEEPALIVE` on macOS, and the field keepalivetime of tcp_keepalive on Windows
            time_seconds: 600
            # the number of seconds between each keepalive packet
            # Corresponds to `TCP_KEEPINTVL` on Linux and macOS, and the field keepaliveinterval of tcp_keepalive on Windows
            interval_seconds: 60
            # the number of keepalive packets being sent without a response before the connection 
            # is considered closed
            # Corresponds to `TCP_KEEPCNT` on Linux and macOS, and is not used on Windows
            retries: 3
          # Time a connection can spend idle before being closed
          connections_max_idle_duration: 1800
          # Configurable timeout for network operations. If a network operation takes more than, `timeout_seconds`, consider it failed. If `retries` is configured, it will be retried.
          # Defaults to infinite
          timeout_seconds: 10


Instances
~~~~~~~~~

If multiple NetHSM instances are listed in the same slot, these instances must be configured in a cluster. The credentials of the users and the keys must be the same on all instances.

The module will use the instances in a round-robin fashion, trying another instance if one fails.


Network reliability
~~~~~~~~~~~~~~~~~~~

To improve the reliability of the PKCS#11 module, it is possible to configure timeouts, retries, instance redundancy and TCP keepalives.

Retries
^^^^^^^

If a NetHSM instance is unreachable, the PKCS#11 module is capable of retrying sending the request to other instances, or to the same instance (if other instances are also unreachable).
It is possible to introduce a delay between retries.

- Failing instances are marked as unreachable and retried in a background thread, so they won't be tried unless all instances are unreachable
- If no background thread can be spawned (`CKF_LIBRARY_CANT_CREATE_OS_THREADS`), failed instances will be tried during normal operations, slowing down the requests. To minimise this, such "inline" health checks are limited to 1 second timeouts, and only 3 health checks can be attempted per request (this is a worst case situation that can only be reached if a large number of instances failed).
- The total number of requests is: ``retries.count`` + 1
- The total timeout for 1 request attempt is: (``retries.count`` + 1) * ``timeout_seconds`` + 3 
- The total timeout for 1 PKCS#11 function call will vary because some functions will lead to multiple API calls in the NetHSM.

TCP keepalive
^^^^^^^^^^^^^

To improve performance, connections are kept open with the NetHSM instances to avoid the need for re-opening them.
It is possible that in a network with a firewall, these idle connection could be closed, leading to the next connection attempt to timeout.
To prevent slow timeouts from happening, and to detect earlier if it does, it is possible to configure TCP keepalives for these. 

Users
~~~~~

The operator and administrator users are both optional but the module won't start if no user is configured. This is so you can configure the module with only an administrator user, only an operator user or both at the same time.

When the two users are set the module will use the operator by default and only use the administrator user when the action needs it.

The regular PKCS#11 user is mapped to the NetHSM operator and the PKCS#11 SO is mapped to the NetHSM administrator.

Passwords
~~~~~~~~~

The password can be provided by multiple means:

- In plain text in the configuration ``password: "mypassword"``
- In an environment variable read by the module with the ``env:`` prefix: ``env:ENV_STORING_THE_PASSWORD``
- Via the login function of pkcs11, example for pcks11-tool: ``pkcs11-tool --module libnethsm_pkcs11.so -p opPassphrase``
  To provide the the admin password you need to use ``--so-pin`` instead: ``pkcs11-tool --module libnethsm_pkcs11.so --login --login-type so --so-pin Administrator``

If the password of an user is not set in the configuration file a login will be required to provide the password (3rd method).

A NetHSM that is not operational is considered as a slot with the token not present.
