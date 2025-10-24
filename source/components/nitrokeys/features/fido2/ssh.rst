SSH Authentication with FIDO2
=============================

.. product-table:: nk3 passkey fido2

SSH (Secure Shell) is a network protocol used to securely access and manage remote systems such as servers or code repositories. It uses cryptographic key pairs for authentication, allowing passwordless logins with strong security.

With a Nitrokey, the private SSH key is generated and stored directly on the device, so it never leaves the hardware. Each login requires you to touch the Nitrokey, adding a simple physical confirmation that protects against unauthorized access. For example, when connecting to a server, GitLab, or GitHub.

Generating SSH Key
------------------

1. Insert the Nitrokey into your computer.

2. Open a terminal and execute the following command, replacing "your_comment" with a note to identify your key (e.g., "Nitrokey GitLab"). The -C "your_comment" parameter is optional — it only adds a label for identification (e.g., in GitLab or GitHub), and the command will work normally without it.

   .. code-block:: shell-session

      ssh-keygen -t ed25519-sk -C "your_comment"

3. You can optionally create a resident key, allowing it to be used on other computers without copying files. By default, SSH FIDO2 keys created with -t ed25519-sk are non-resident, meaning a local key handle is stored in ~/.ssh/ while the private key remains securely on the Nitrokey. Using -O resident provides portability across systems, but for single-system use, the standard ssh-keygen -t ed25519-sk command is sufficient.

   .. code-block:: shell-session

      ssh-keygen -t ed25519-sk -O resident -C "your_comment"

   .. note::

      On a new system you can list and load resident keys from the device with:

      .. code-block:: shell-session

         ssh-keygen -K

4. During key generation, you may also be asked to set a **passphrase**. This passphrase encrypts the local key handle stored in ``~/.ssh/`` (not the private key on the Nitrokey, which always stays securely inside the device). The passphrase is **different from the FIDO2 device PIN**: the PIN protects the physical key itself, while the passphrase protects your local SSH key files. Using both increases overall security.

5. When asked for a file path, accept the default option (``~/.ssh/id_ed25519_sk``) or choose a custom name like ``id_ed25519_sk_gitlab``.

6. If the Nitrokey blinks, confirm the operation by touching it.

7. By executing the command, the following files will be created:

   ``~/.ssh/id_ed25519_sk`` → handle to the private key (stored securely on the Nitrokey)

   ``~/.ssh/id_ed25519_sk.pub`` → public key file

   .. note::

      The file names may differ if you specified a custom name when generating the key.

.. figure:: images/ssh/terminal.png
   :alt: img0


Adding Your Public Key
----------------------

1. Once your SSH key pair is generated, the public key must be added to the service or server you want to access.

1.For Git Services (GitLab, GitHub, etc.) 
   1. Display your public key:

      .. code-block:: shell-session

         cat ~/.ssh/id_ed25519_sk.pub

      Example output (do not use this key)::
      
         sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG7wZW4zc2guY29tAAAAILeZl6r07HV4i1rK07OfLqD3J4IzX2q0lB6Ok0pdxoG5AAAABHNzaDo= your_comment

   2. Copy the output and add it to your account’s SSH key settings.  
      See `GitLab <https://docs.gitlab.com/user/ssh/#add-an-ssh-key-to-your-gitlab-account>` or `GitHub <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account>` for detailed steps.


2. To allow SSH access to the remote servers, the same public key must be listed in the server’s ``~/.ssh/authorized_keys`` file. During authentication, the server checks for a matching key and verifies your identity through a challenge signed by your Nitrokey’s private key.
   To add your key:

   .. code-block:: shell-session

      mkdir -p ~/.ssh
      chmod 700 ~/.ssh
      cat ~/.ssh/id_ed25519_sk.pub >> ~/.ssh/authorized_keys
      chmod 600 ~/.ssh/authorized_keys

   Each line in ``authorized_keys`` represents one trusted key. 
   
   You can add multiple keys or restrict usage, for example to a specific IP range and command:
      from="192.168.0.*" command="/usr/local/bin/backup.sh" sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG7wZW4zc2guY29tAAAAILeZl6r07HV4i1rK07OfLqD3J4IzX2q0lB6Ok0pdxoG5AAAABHNzaDo= your_comment
