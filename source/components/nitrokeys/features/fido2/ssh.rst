SSH Authentication with FIDO2
=============================

.. product-table:: nk3 passkey fido2

Use your Nitrokey 3A NFC for secure SSH login to servers, GitLab, or GitHub.  
The private key is generated and safely stored inside the device, ensuring it never leaves the hardware.  
Authentication requires a physical touch of the Nitrokey, providing strong protection against phishing and unauthorized access.

What is SSH?
------------

**SSH (Secure Shell)** is a network protocol used to securely access and manage remote systems, such as servers or code repositories.  
It uses cryptographic key pairs for authentication, allowing passwordless logins while maintaining strong security.

Requirements
------------

1. Nitrokey 3A NFC set up (FIDO2 enabled, optional PIN set)
2. OpenSSH 8.2+ on your computer (adds FIDO2 ``*-sk`` key support)

Generating SSH Key
------------------

1. Insert the Nitrokey 3A NFC into your computer.

2. Open a terminal and execute the following command, replacing "your_comment" with a note to identify your key (e.g., "Nitrokey GitLab"). The -C "your_comment" parameter is optional — it only adds a label for identification (e.g., in GitLab or GitHub), and the command will work normally without it.

   .. code-block:: shell-session

      ssh-keygen -t ed25519-sk -C "your_comment"

3. Optionally you can also turn your key into a resident key, allowing it to be used on other computers without copying files. By default, SSH FIDO2 keys created with ``-t ed25519-sk`` are non-resident keys, meaning a local key handle is stored in ``~/.ssh/`` while the private key remains securely on the Nitrokey. Using ``-O resident`` is optional and provides portability across systems. For single-system use, the standard ``ssh-keygen -t ed25519-sk`` command is sufficient.Optionally you can also turn your key into a resident key, allowing it to be used on other computers without copying files. By default, SSH FIDO2 keys created with ``-t ed25519-sk`` are non-resident keys, meaning a local key handle is stored in ``~/.ssh/`` while the private key remains securely on the Nitrokey. Using ``-O resident`` is optional and provides portability across systems. For single-system use, the standard ssh-keygen ``-t ed25519-sk`` command is sufficient.
         
   .. code-block:: shell-session

      ssh-keygen -t ed25519-sk -O resident -C "your_comment"

   .. note::

      On a new system you can list and load resident keys from the device with:

      .. code-block:: shell-session

         ssh-keygen -K

4. During key generation, you may also be asked to set a **passphrase**. This passphrase encrypts the local key handle stored in ``~/.ssh/`` (not the private key on the Nitrokey, which always stays securely inside the device). The passphrase is **different from the FIDO2 device PIN**: the PIN protects the physical key itself, while the passphrase protects your local SSH key files. Using both increases overall security.

5. When asked for a file path, accept the default option (``~/.ssh/id_ed25519_sk``) or choose a custom name like ``id_ed25519_sk_gitlab``.

6. If the Nitrokey blinks, confirm the operation by touching it.

7. Optionally you can also set a passphrase (it is usually recommended for security reasons but not mandatory).

8. By executing the command, the following files will be created:

   ``~/.ssh/id_ed25519_sk`` → handle to the private key (stored securely on the Nitrokey)

   ``~/.ssh/id_ed25519_sk.pub`` → public key file

   .. note::

      The file names may differ if you specified a custom name when generating the key.

.. figure:: images/ssh/terminal.png
   :alt: img0


Adding your Public Key to GitLab or GitHub
------------------------------------------
1. Enter this command to view your public key in the terminal

   .. code-block:: shell-session 

      cat ~/.ssh/id_ed25519_sk.pub 

   Example output (do not use this key)::
   
      sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG7wZW4zc2guY29tAAAAILeZl6r07HV4i1rK07OfLqD3J4IzX2q0lB6Ok0pdxoG5AAAABHNzaDo= your_comment #. Copy the key to your account...

2. Add the copied SSH key to your accounts designated SSH Key Field.

   See instructions for `GitLab <https://docs.gitlab.com/user/ssh/#add-an-ssh-key-to-your-gitlab-account>` or `GitHub <https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account>`.