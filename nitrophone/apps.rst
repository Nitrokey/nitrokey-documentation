Apps
****

App Store
#########

For very high security requirements, you should use as few apps as possible to
provide a small attack surface. If instead you want to use the NitroPhone as an
everyday smartphone with more apps we recommend:

1. Install the `F-Droid <https://f-droid.org/F-Droid.apk>`__ App Store. This has
   exclusively open source apps that do without drastic tracking and without
   advertising. Here you will find thousands of apps from a wide variety of fields.
   If you are looking for an app, check F-Droid first.

2. If the apps in F-Droid are not enough for you, open F-Droid and install
   Aurora Store. In Aurora Store, you can install all apps from Google Play Store.

3. Many apps work without Google Play Services. However, if you want to use apps
   that require Google Play Services, you can install `Google Play Services in a sandbox <https://grapheneos.org/usage#sandboxed-google-play>`__ as follows.

   1. Open Graphenes app repository client: *Home screen -> Apps*
   2. Install the 3 core Google Play Apps ("Google Play store", "Google Play Services", "Google Services Framework").
   3. Disable batterie optimization for Google Play Services (for Push to work properly). From the home screen, select: *Settings -> Apps -> Google Play services > Battery > Unrestricted*
   4. Open the Google Play Store once and press "Sign in" to start the
      initialization. You don't have to finish the sign in and a real login is not
      necessary. This is solely to initialize the software.

.. hint::
   To prevent some apps from accessing Google Play Services, install
   Google Play Services in a separate profile. To do this, create a new
   dedicated user profile and install the Google Play Services there. Using
   a work profile together with *Shelter* is also possible, but without as
   much isolation.

.. Important::

   The Google Play Store cannot install and update apps due to the sandbox.
   Instead, always use F-Droid (for open source apps) or Aurora Store (for apps
   from Google Play Store) to install apps.

Recommended Apps
################

* Browser: The pre-installed browser Vanadium is hardened and therefore recommended for high security. For ad-blocking, we recommend `DNS-based ad-blocking <https://grapheneos.org/faq#ad-blocking>`__.
* Email: K9-mail and OpenKeyChain (for OpenPGP encryption) or FairEmail.
* VPN: Orbot uses the free TOR network. Mullvad VPN and IVPN are paid VPN services.
* Backup: The integrated backup (Seedvault) and Nextcloud. Choose Settings -> System -> Backup.
* Messenger:
   * `Signal <https://signal.org/android/apk/>`__ is secure and now widely used. It can also be downloaded without an app store.
   * `Element <https://element.io/>`__ does not require a central infrastructure and allows the use of own servers. An own account can be registered for free at `NitroChat <https://nitro.chat>`__ for example.
   * `Briar <https://briarproject.org/>`__ is a peer-to-peer messenger without any server at all, which can be used without internet with contacts nearby.
* Contacts and calendar synchronization: DAVx5 supports CalDAV, CardDAV and WebCAL.
* One-time password generator (2FA, OTP): `Aegis Authenticator <https://github.com/beemdevelopment/Aegis>`__.
* Regarding camera app, see `here <https://grapheneos.org/usage#camera>`__.

Permissions of Individual Apps
##############################

To check or change the permissions on network access and sensors for a specific app:

*Long press on the respective app icon -> app info -> permissions*

Car Sharing Apps
################

Some car sharing apps (such as SHARE NOW) use Bluetooth-based location service to unlock a car in the proximity. To enable this choose: Settings -> Location -> Location Services -> Bluetooth scanning -> on
