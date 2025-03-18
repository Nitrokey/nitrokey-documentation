Nitrokey HSM 2
==============

.. contents:: :local:

This documentations describes how to use Nitrokey HSM2 devices. Nitrokey HSM 2 can be used to keep an offline root CA secure.

For building a Public Key Infrastructure (PKI), you might want to protect the use of your root CA with m-of-n authentication. If so, interacting with your Nitrokeys requires the use of graphical components called SmartCard Shell and PKIAAS. Please refer to this guide: `Getting Started <getting-started-with-pkiaas.html#getting-started>`__

If m-of-n authentication is not mandatory for you, then your devices can be used through command line tools provided by the OpenSC project. Please refer to this page `Getting Started <getting-started-with-opensc.html#getting-started>`__

.. toctree::
   :maxdepth: 1
   :glob:

   Getting Started with PKIAAS <getting-started-with-pkiaas>
   Getting Started with OpenSC <getting-started-with-opensc>
   Frequently Asked Questions <faq>

or check out the features:

* `HSM <../features/hsm/index.html>`_
