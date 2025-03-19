Getting started with PKIAAS
===========================

This guide describes how to set up a PKI made of :

-  an offline root CA, used only to sign intermediate CAs and revocation
   list. It is kept secure on a HSM.
-  intermediate CAs, used for automatic certificate delivery through
   online services (like ADCS, EJBCA, OpenBao, and so on). Those have a
   higher risk of compromission as they are not kept secure on a HSM.

Security considerations
-----------------------

In order to keep access to our CA in case the HSM is lost or faulty, we
will backup the material to a secondary HSM. We will protect ourselves
from unauthorized copying, by using shared control over key replication,
with an m-of-n scheme. A secret will be split and shared between key
custodians.

We also want to have shared control over the use of the CA, so we will
also rely upon a m-of-n scheme, with pubkeys authentication. Pubkey
authentication will be possible by the mean of personnal HSM devices
distributed to key custodians.

One thing to do is to define how many people will be involved in those
m-of-n schemes, and what is the quorum to reach. We suggest the number
of required parts to be greater than the number to additional parts. A
quorum of 3 people needed out of 5 key custodians is a common ration.

Requirements
------------

The following devices will be involved:

-  two Nitrokey HSM 2 for the root CA and its backup
-  five Nitrokey HSM 2 for personnal authentication
-  we also suggest to keep one spare device, just in case

Our setup will involve:

-  the certificate operator personnal machine, to run

   -  SmartCard Shell, a java based graphical user interface to
      initialize the devices
   -  OCF, to connect your HSM devices to the remote CA web app

-  a docker server, on which will be deployed

   -  PKIAAS, a java based web app to sign the root CA and deliver
      intermediate certificates

Both SmartCard Shell and PKIAAS are developped by CardContact, the
company that makes the chip embedded in Nitrokey HSM 2. Details on how
to install this software will be given later in this guide.

Procedure
---------

From now on, we will speak of “personnal HSM” and “CA HSM” because of
their distinct purposes.

The following guide will involve a ``certificate operator``, in charge
of doing the technical steps, and ``key custodians``, whom will have to
enter their PIN when required.

`Prepare your HSM with Smart Card Shell <smart-card-shell>`__

`Build your PKI with PKIAAS <pkiaas>`__
