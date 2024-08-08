Encrypted Mobile Storage
========================


Prior of using the encrypted mobile storage you need to install and initialize the Nitrokey Storage and download the latest `Nitrokey App <https://www.nitrokey.com/download>`__.

1. Start the Nitrokey App.
2. Press its tray icon and select "unlock encrypted volume" in the menu.
3. Enter your User PIN in the appearing popup window.
4. If this is the first time you may need to create a partition on the encrypted volume. Windows will open an appropriate window and ask you to do so. On GNU+Linux and Mac you may need to open a partition manager and create a partition manually. You can create as many partitions as you want. We recommend FAT(32) if you want to access the partition from various operating systems.
5. Now you can use the encrypted volume as you would use any other ordinary USB drive. But all data stored on it will be encrypted in the Nitrokey hardware automatically.
6. To remove or lock the encrypted volume you should unmount/eject it first.
7. Afterwards you can disconnect the Nitrokey or select "lock encrypted volume" from the Nitrokey App menu.

The Nitrokey Storage is able to create hidden volumes as well. Please have a look at the corresponding instructions for `hidden volumes <../hidden-storage/index.html>`_.

