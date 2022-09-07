This guide explains how to prepare your SSH server and client for use with the Nitrokey.

The Nitrokey should already have PGP keys installed and the local GnuPG keyring should know the keys.

Preparation on client
'''''''''''''''''''''

* Make sure ~/.gnupg/gpg.conf contains 'use-agent'
* Add ssh support to gnupg-agent by adding 'enable-ssh-support' to ~/.gnupg/gpg-agent.conf
* If the file does not exist yet, you can just create it.
* Add the following code somewhere into your ~/.bashrc (for fish shell, look `here <https://support.nitrokey.com/t/ssh-auth-with-fish-instead-of-bash/2206>`__)

.. code-block:: bash

    unset SSH_AGENT_PID
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    fi

* Simply restart your system or try ``pkill gpg-agent`` and open a new commandline to make sure everything is set
* In case of problems, please try ``gpg2 --card-status`` on first usage to make sure the gpg-agent gets started

Preparation for the server
''''''''''''''''''''''''''

You can generate an authorized_keys file by running either

.. code-block:: bash
 
 gpg2 --export-ssh-key keyID >> ~/authorized_keys

where

.. code-block:: bash
 
 keyID

is the subkey id being used for authentication on your Nitrokey. The Nitrokey must already be known to the local GnuPG keyring. You can now append that file to a remote server's authorized_keys and when you ssh to the server you'll be asked for a pin rather than a passphrase.

 
Troubleshooting
'''''''''''''''

If you are still being asked for a password please make sure that

.. code-block:: bash

 echo $SSH_AUTH_SOCK

returns something like '/run/user/1000/gnupg/S.gpg-agent.ssh' or '/home/username/.gnupg/.S.gpg-agent.ssh'. Unfortunately there were some changes in GnuPG in the past so that the actual content can differ from system and GnuPG version. On some systems there may are even multiple folders in this variable saved. You have to adapt the above given code in .bashrc so that the variable SSH_AUTH_SOCK is correct. In doubt look for 'SSH_AUTH_SOCK' in

.. code-block:: bash

 man gpg-agent

to find the actual code for your version/system.

You may check if you have a 'pinentry' program installed via your package manager. You may need to `set it in the gpg-agent.conf <https://wiki.archlinux.org/index.php/GnuPG#pinentry>`__ as well.
You may need to `point gpg-agent to the correct TTY <https://wiki.archlinux.org/index.php/GnuPG#Configure_pinentry_to_use_the_correct_TTY>`__.
