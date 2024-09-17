Access Control
==============

The following access matrix shows what authentication a certain operation requires.

+-------------------+-----+-----+-----+-------------------------------------------------+
| Operation         | PIN | PUK | MGM | Remarks                                         |
+===================+=====+=====+=====+=================================================+
| Change PIN        |  x  |     |     |                                                 |
+-------------------+-----+-----+-----+-------------------------------------------------+
| Change PUK        |     |  x  |     |                                                 |
+-------------------+-----+-----+-----+-------------------------------------------------+
| Change MGM        |     |     |  x  |                                                 |
+-------------------+-----+-----+-----+-------------------------------------------------+
| Unblock PIN       |     |  x  |     |                                                 |
+-------------------+-----+-----+-----+-------------------------------------------------+
| Generate key      |  x  |     |  x  |                                                 |
+-------------------+-----+-----+-----+-------------------------------------------------+
| Read certificate  |     |     |     | This operatain does not require authentication. |
+-------------------+-----+-----+-----+-------------------------------------------------+
| Write certificate |  x  |     |  x  |                                                 |
+-------------------+-----+-----+-----+-------------------------------------------------+


Personal Identification Number (PIN)
------------------------------------

The *PIN* is used for key operations, such as signing and authentication.
The factory default for the *PIN* is ``123456``.

.. note::
   The *PIN* must have maximal length of 8 characters.
   It can contain alphanumeric characters, including special characters such as punctations.

.. warning::
   The *PIN* is subject to the restriction of a retry counter.
   Please refer to the chapter `Retry Counter <access_control.html#retry-counter>`__ to learn more.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``nitropy nk3 piv --experimental change-pin``.


Personal Unblocking Key (PUK)
-----------------------------

The *PUK* is used for management operations, such as unblocking the PIN.
The factory default for the *PUK* is ``123456``.

.. note::
   The *PUK* must have a maximal length of 8 characters.
   It can contain alphanumeric characters, including special characters such as punctations.

.. warning::
   The *PUK* is subject to the restriction of a retry counter.
   Please refer to the chapter `Retry Counter <access_control.html#retry-counter>`__ to learn more.

1. Connect the Nitrokey 3 with your computer.
2. On the terminal enter ``nitropy nk3 piv --experimental change-puk``.


Retry Counter
-------------

The retry counter is used for the *PIN* and *PUK*.
The counter decrements for every failed login attempt.
A retry counter of zero means that there are no attempts left.

The *PIN* has a retry counter of 3 attempts.
If these attempts are used up, the *PIN* must be unlocked with the *PUK*.

To unblock the *PIN*, use the command ``nitropy nk3 piv --experimental reset-retry-counter``.
This command requires the *PUK*.

The *PUK* has a retry counter of 3 attempts.
If these attempts are used up, the PIV Card can not be used anymore and must be reset to factory defaults.
Please refer to the chapter `Factory Reset <factory_reset.html>`__ to learn more.


Management Key (MGM)
--------------------

The management key is used for management operations.

Before you can perform management operations you must authenticate with the management key.
The authentication is done with ``nitropy nk3 piv --experimental admin-auth``.

The management key can be changed with ``nitropy nk3 piv --experimental change-admin-key``.
