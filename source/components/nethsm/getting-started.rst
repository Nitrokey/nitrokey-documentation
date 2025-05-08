Getting Started
===============

This chapter describes the physical installation and provisioning of the NetHSM.

Verify Sealed Hardware
----------------------

Your NetHSM hardware has been delivered in a sealed packaging.

Please follow the three step process closely to verify that it has arrived safely.

1. Check the wrapping paper for any tears, cuts, holes or broken sealing.

   .. figure:: ./images/package-front.jpg
      :scale: 100
      :alt: Package front side

      Package front side

      |

   .. figure:: ./images/package-back.jpg
      :scale: 100
      :alt: Package back side

      Package back side

      |

   .. figure:: ./images/package-bottom.jpg
      :scale: 100
      :alt: Package bottom side

      Package bottom side

      |

   .. figure:: ./images/package-top.jpg
      :scale: 100
      :alt: Package top side

      Package top side

      |

   .. figure:: ./images/package-left.jpg
      :scale: 100
      :alt: Package left side

      Package left side

2. Check the unique handmade glitter seal on top of the wrapping paper.
   You will receive a picture of it from us after wrapping via e-mail.
   Compare the received picture with the seal.
   If you notice any changes, please contact us to arrange further action.

   .. figure:: ./images/package-top-seal.jpg
      :scale: 100
      :alt: Package sealing

      Package sealing

3. After verifying that the sealing of the wrapping paper is not broken, remove the wrapping paper.
   Finally, check the four seals on the side of the NetHSM hardware.

   .. figure:: ./images/nethsm1-top-with-seal-positions.jpg
      :scale: 100
      :alt: Positions of the four seals

      Positions of the four seals

      |

   .. figure:: ./images/nethsm1-side-with-seal.jpg
      :scale: 100
      :alt: Seal on the side of the chassis

      Seal on the side of the chassis

Hardware Installation
---------------------

The NetHSM hardware chassis is designed to be rack mounted.
Please make sure it is installed in a compatible rack.
Please follow the two step process closely to install the NetHSM hardware.


1. Connect the power cable with the *Power Port*, and the network cable with the *Network Port*.
   Further, press the *Power Switch* to turn on power.

   .. tabs::
      .. tab:: NetHSM 2

         .. figure:: ./images/nethsm2-back-with-labels.png
            :scale: 100
            :alt: Back side of the server

         Back side of the server

         .. important::

            The NetHSM 2 has redundant power supplies, which both need to be supplied with power.
            Undersupply causes the power supply to emit a beep sound.

      .. tab:: NetHSM 1

         .. figure:: ./images/nethsm1-back-with-labels.png
            :scale: 100
            :alt: Back side of the server

         Back side of the server

2. Press the *Power Button* to turn on the NetHSM hardware.
   The *Reset Button* is only for a forced reboot of the NetHSM hardware.
   If the NetHSM hardware is running, the *Power Indicator* on the front will light.

   .. warning::

      Do not use the *BMC Network Port* because it allows wider system access.

   .. tabs::
      .. tab:: NetHSM 2

         .. figure:: ./images/nethsm2-front-with-labels.png
            :scale: 100
            :alt: Front side of the server

            Front side of the server

      .. tab:: NetHSM 1

         .. figure:: ./images/nethsm1-front-with-labels.png
            :scale: 100
            :alt: Front side of the server

            Front side of the server

In an unprovisioned state the NetHSM hardware factory default IP address is ``192.168.1.1``.

You can test the connection to a new NetHSM either by ``ping 192.168.1.1`` or by opening ``192.168.1.1`` in a web browser which requires allowing a security exception because of an invalid, self-signed certificate.

Provisioning
------------

A new or otherwise *Unprovisioned* NetHSM needs to be provisioned first with passphrases and the current time. The *Admin Passphrase* is for the first user account, which is the superuser of the NetHSM. The *Unlock Passphrase* is used to decrypt NetHSM's *User Data*.

.. warning::
   The unlock passphrase cannot be reset without knowing the current value.
   If the unlock passphrase is lost, neither can it be reset to a new value nor can the NetHSM be unlocked.

The initial provisioning is executed as follows.

.. tabs::
   .. tab:: nitropy
      **Optional Options**

      +---------------------------+------------------------------------------------------------+
      | Option                    | Description                                                |
      +===========================+============================================================+
      | ``-t``, ``--system-time`` | The system time to set (Format: ``YYYY-MM-DDTHH:MM:SSZ``)  |
      +---------------------------+------------------------------------------------------------+

      .. note::
         If the time is not passed manually, it will be derived from the system *nitropy* is running on. If the time is passed manually, make sure to pass the time in UTC timezone.

      **Example**

      This example contains the parameter `--no-verify-tls` because typically at this stage the NetHSM uses a self-signed certificate.

      .. code-block:: bash

         $ nitropy nethsm --host $NETHSM_HOST --no-verify-tls provision

      .. code-block::

         Unlock passphrase:
         Repeat for confirmation:
         Admin passphrase:
         Repeat for confirmation:
         Warning: The unlock passphrase cannot be reset without knowing the current value. If the unlock passphrase is lost, neither can it be reset to a new value nor can the NetHSM be unlocked.
         NetHSM localhost:8443 provisioned

   .. tab:: REST API
        Information about the `/provision` endpoint can be found in the `API documentation <https://nethsmdemo.nitrokey.com/api_docs/index.html#/default/POST_provision>`__.

.. warning::
   The default boot mode is *Attended Boot*. Please refer to chapter `Boot Mode <administration.html#boot-mode>`__ to learn more.
