# Nitrokey FIDO2 with Windows

The Nitrokey FIDO2 supports two-factor authentication (2FA) and passwordless authentication:
- With **passwordless authentication**, entering a password is replaced by logging in with the Nitrokey FIDO2 and a PIN.
- With **two-factor authentication** (2FA), the Nitrokey FIDO2 is checked in addition to the password.

The Nitrokey FIDO2 can be used with any current browser.

::: tip IMPORTANT
The Nitrokey App can not be used for the Nitrokey FIDO2.
:::


## Passwordless authentication

1. Open a web page that supports FIDO2 (currently only [Microsoft](https://www.microsoft.com)).
2. Log in to the website and go to "Set up security key" in the security settings of your account.
3. Now you need to set a PIN for your Nitrokey FIDO2.
4. Touch the button of your Nitrokey FIDO2 when prompted.
5. Once you have successfully configured the device, you will need to activate your Nitrokey FIDO2 this way each time you log in, after entering your PIN.


## Two-Factor Authentication (2FA)

1. Open one of the [websites that support FIDO U2F](https://www.dongleauth.info/).
2. Log in to the website and enable two-factor authentication in your account settings. (In most cases you will find a link to the documentation of the supported web service at [dongleauth.info](https://www.dongleauth.info/))
3. Register your Nitrokey FIDO2 in the account settings by touching the button to activate the Nitrokey FIDO2. After you have successfully configured the device, you must activate the Nitrokey FIDO2 this way each time you log in.

Checkout the [various use cases and supported applications](https://www.nitrokey.com/documentation/applications#p:nitrokey-fido2-u2f&os:all).

::: tip NOTE
Google only accepts the Chrome browser for registering the Nitrokey FIDO2 Logging in works fine with Firefox though.
:::
