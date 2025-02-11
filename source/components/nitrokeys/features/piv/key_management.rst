Key Management
==============

.. product-table:: nk3


Key Slots
---------

The PIV smart card can hold certificates for different purposes.
For each purpose the private key and its corresponding certificate are stored in a key slot.

+-------+------------------------+-------------------------------------------------------+
| Slot  | Application            | Description                                           |
+=======+========================+=======================================================+
| 82-95 | Retired Key Management | The private keys and certificates in these slots were |
|       |                        | used for key management applications and are still    |
|       |                        | there to provide backward compatibility.              |
+-------+------------------------+-------------------------------------------------------+
| 9a    | Authentication         | The private key and certificate in this slot          |
|       |                        | are used to authenticate the cardholder.              |
+-------+------------------------+-------------------------------------------------------+
| 9c    | Signature              | The private key and certificate in this slot          |
|       |                        | are used to sign emails and files.                    |
+-------+------------------------+-------------------------------------------------------+
| 9d    | Key Management         | The private key and certificate in this slot          |
|       |                        | are used to encrypt emails and files.                 |
+-------+------------------------+-------------------------------------------------------+
| 9e    | Card Authentication    | The private key and certificate in this slot          |
|       |                        | are used for physical operations, such as building    |
|       |                        | access or time recording. Support from the respective |
|       |                        | system is a prerequisite.                             |
+-------+------------------------+-------------------------------------------------------+

Algorithms
----------

PIV uses asymmetric and symmetric algorithms. The asymmetric algorithms are used for the user private keys and the symmetric algorithms for the management key.

Supported asymmetric key algorithms:

* RSA 2048
* nistp256

Supported symmetric key algorithms:

* AES 256
* 3DES (TDES)

.. warning::
   It is not recommended to use the 3DES (TDES) algorithm.

Management Key
--------------

For compatibility reasons, the default management key is the following 3DES (TDES) key (24 bytes in hexadecimal):

::

    0102030405060708 0102030405060708 0102030405060708 

Key Generation
--------------

The PIV smart card can generate a new private key on the Nitrokey.

The command below will create a private key in key slot ``9a`` for the user with the subject name ``John Doe`` and subject alternative name ``jd@nitrokey.local``.

::

   nitropy nk3 piv generate-key --key-slot 9a --subject-name "John Doe" --subject-alt-name-upn "jd@nitrokey.local"
