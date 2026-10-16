sub rosa
********

.. product-table:: nk3 pro start storage


sub rosa allows you to program a static password onto a hardware security key, which can act as a keyboard when touched.
Plug it into your phone, tablet, or laptop, touch it, and it automatically types out a sequence of characters.

Simple: no need to memorize multiple complex passwords. No need to carry multiple devices either — you can program a hardware security key with a password, use it, and then program it with a different password whenever needed. Nowadays, hardware security keys come in various form factors: from models small enough to remain in your phone's USB-C port to larger, NFC-enabled keys.

sub rosa can program an OpenPGP key onto your hardware key, allowing you to encrypt, decrypt, cryptographically sign documents, or authenticate to remote servers via SSH. An OpenPGP key acts as your digital identity.

Just like KeePassDroid managing passwords, OpenKeychain or PGPony manage OpenPGP keys. You can easily import OpenPGP keys generated or stored by these apps in sub rosa and then program them onto your hardware security key.

.. note::

    For further information or issue/feature proposal, please refer to the source repository `here <https://github.com/naive-HA/subrosa>`__.

Install sub rosa
----------------

sub rosa is available on F-Droid `here <https://apt.izzysoft.de/packages/acab.naiveha.subrosa>`__ if you have the `IzzyOnDroid repository <https://apt.izzysoft.de/fdroid/index/info>`__.

On the Google Play Store `here <https://play.google.com/store/apps/details?id=acab.naiveha.subrosa.by.naiveha>`__.

In the source repository `here <https://github.com/naive-HA/subrosa>`__.

Supported Features
------------------

.. list-table::
   :header-rows: 1

   * - Fonction
     - Action
     - Nitrokey 3 USB
     - Nitrokey 3 NFC
     - Nitrokey Pro USB
     - Nitrokey Storage
   * - Static password
     - Write
     - ❌
     - ❌
     - ❌
     - ❌
   * - Static password
     - Read
     - ❌
     - ❌
     - ❌
     - ❌
   * - Static password
     - Wipe
     - ❌
     - ❌
     - ❌
     - ❌
   * - OpenPGP
     - Write
     - ✅
     - ❌
     - ✅
     - ✅
   * - OpenPGP
     - Read
     - ✅
     - ❌
     - ✅
     - ✅
   * - OpenPGP
     - Wipe
     - ✅
     - ❌
     - ✅
     - ✅
   * - OpenPGP
     - Change User PIN
     - ✅
     - ❌
     - ✅
     - ✅
   * - OpenPGP
     - Reset User PIN
     - ✅
     - ❌
     - ✅
     - ✅
   * - OpenPGP
     - Change Admin PIN
     - ✅
     - ❌
     - ✅
     - ✅

.. list-table::
   :header-rows: 1

   * - OpenKeychain supported algorithm
     - Nitrokey 3 USB
     - Nitrokey 3 NFC
     - Nitrokey Pro
     - Nitrokey Storage
   * - RSA 2048
     - ✅
     - ✅
     - ✅
     - ✅
   * - RSA 3072
     - ✅
     - ✅
     - ✅
     - ✅
   * - RSA 4096
     - ✅
     - ✅
     - ✅
     - ✅
   * - ECC NIST P-256
     - ✅
     - ✅
     - ✅
     - ✅
   * - ECC NIST P-521
     - ✅
     - ✅
     - ✅
     - ✅
   * - Ed25519/X25519
     - ✅
     - ✅
     - ❌
     - ❌

.. note::

    Other algorithms have not been tested.

Import OpenPGP Keys From OpenKeychain
-------------------------------------

sub rosa works closely with OpenKeychain. OpenKeychain manages OpenPGP keys, handling generation, secure storage, and backups.

Importing keys from OpenKeychain is a breeze. Share a key backup with sub rosa and enter the backup code provided by OpenKeychain. Because this backup code—consisting of 36 numbers and dashes—cannot be copied directly to the clipboard from OpenKeychain, sub rosa includes Tesseract (an Optical Character Recognition library) to make the process effortless:

1.    Take a screenshot of the OpenKeychain app displaying the backup code and share that screenshot with sub rosa.
2.    Select the region containing the backup code and tap **EXTRACT PASSWORD**.
3.    The backup code will be copied to your clipboard. Return to OpenKeychain and tap **SHARE BACKUP**.
4.    Paste the backup code into sub rosa and get ready to write your private OpenPGP key to your security key.


.. list-table::
   :widths: 33 33 33
   :class: borderless

   * - .. figure:: ./images/subrosa1.png
          :width: 100%

     - .. figure:: ./images/subrosa2.png
          :width: 100%

     - .. figure:: ./images/subrosa3.png
          :width: 100%


Use Your Security key for SSH Authentication
--------------------------------------------

When generating a new OpenPGP key with OpenKeychain, select **Change key configuration** and **add an Authentication subkey**.
Then import this OpenPGP key into sub rosa and write it to your security key.

On a clean Debian machine, ensure all required packages are installed:

.. code-block:: bash

    sudo apt update
    sudo apt install openssh-client gnupg scdaemon pinentry-curses pcscd

Identify where ``pinentry`` is installed:

.. code-block:: bash

    which pinentry

The output should look similar to:

.. code-block:: bash

    /usr/bin/pinentry

Take note of that path, then configure ``gpg-agent`` to enable SSH support and use that ``pinentry`` binary:

.. code-block:: bash

    echo "enable-ssh-support" > ~/.gnupg/gpg-agent.conf
    echo "pinentry-program /usr/bin/pinentry" >> ~/.gnupg/gpg-agent.conf

Restart the agent to apply the configuration:

.. code-block:: bash

    gpgconf --kill gpg-agent
    gpgconf --launch gpg-agent
    gpgconf --list-dirs agent-ssh-socket

This should output a path like:

.. code-block:: bash

    /run/user/1000/gnupg/S.gpg-agent.ssh

Note this path and add it to your ``~/.ssh/config``:

.. code-block:: bash

    echo "Host *" > ~/.ssh/config
    echo "  IdentityAgent /run/user/1000/gnupg/S.gpg-agent.ssh" >> ~/.ssh/config


.. note::
     Be sure to replace ``/run/user/1000/gnupg/S.gpg-agent.ssh`` with the actual path output on your system.

Now query the security key:

.. code-block:: bash

    gpg-connect-agent "scd learn --force" /bye

This displays details of the OpenPGP key written to your security key. The output will look similar to:

.. code-block:: bash

    S KEYPAIRINFO 5BBF795A5F93498C2FF6C6CD3ABF896302DC9FA0 OPENPGP.1 sc 1782525925 ed25519
    S KEYPAIRINFO D1B359A6A77A68B1776ABFA085E65AFA1582E6D6 OPENPGP.2 e 1782525925 cv25519
    S KEYPAIRINFO 36F40BE75662CEA929402AAA360A64F448E35ABB OPENPGP.3 a 1782525925 ed25519
    OK

To configure SSH to use the authentication key, add its keygrip to ``~/.gnupg/sshcontrol``:

.. code-block:: bash

    echo "36F40BE75662CEA929402AAA360A64F448E35ABB" >> ~/.gnupg/sshcontrol
    gpgconf --kill gpg-agent
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    ssh-add -L

.. note::
     Replace ``36F40BE75662CEA929402AAA360A64F448E35ABB`` with the keygrip of your specific Authentication subkey (the line ending in ``a``).

The ``ssh-add -L`` command should display your public key card identifier, for example:

.. code-block:: bash

    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfZlzyF4mwdtAnUNJVz1TxOkotdHNizIaA56IOepfA/ cardno:000F_D52FD320

Copy this line and add it to ``~/.ssh/authorized_keys`` on your remote server.

When logging into your remote server via SSH, you will be prompted for a PIN. This is the **User PIN** (default: ``123456``), not the Admin PIN (default: ``12345678``).

