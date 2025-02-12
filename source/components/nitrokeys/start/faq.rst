Nitrokey Start FAQ
==================

.. include:: ../../shared-faqs/nitrokeys.rst.inc 

.. faq:: What are the default PINs?

   * **User PIN:** "123456"
   * **Administrator PIN:** "12345678"
   
   We strongly recommend to change these PINs/password to user-chosen values
   before using the Nitrokey.

.. include:: ../../shared-faqs/pins.rst.inc 

.. faq:: Which drivers/tools can be used?

  GnuPG is required for many use cases. It is a command line tool but usually
  you don't need to invoke it directly but use another application with user
  interface.

  Don't use GnuPG in parallel with OpenSC or another PKCS#11 driver because both may interfere and unexpected issues may result.

  Install GPG4Win which contains Gnu Privacy Assistant (GPA) and GnuPG (GPG).
  Start Gnu Privacy Assistant (GPA) or another application such as your email client to use GnuPG.
  Advanced users could use GnuPG directly (command line). Please note: The
  Fellowship smart card is similar to the Nitrokey Pro so that this
  instructions work Nitrokey as well. In general the official documentation
  is recommended.

.. include:: ../../shared-faqs/algos.rst.inc 


.. faq:: Does the Nitrokey Start contain a secure chip or just a normal microcontroller?

   Nitrokey Start is implemented in the microprocessor.

.. faq:: How large is the storage capacity?

   The Nitrokey Start doesn't contain storage capability for ordinary data (it can
   only store cryptographic keys and certificates).

.. faq:: How many keys can I store? 

    The Nitrokey Start can store nine RSA key pairs for three identities. 
    For one identity you need three key pairs for authentication, encryption and
    signing.

.. include:: ../../shared-faqs/hyperlinks.rst.inc 


