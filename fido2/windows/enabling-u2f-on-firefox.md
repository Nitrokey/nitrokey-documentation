# Enabling U2F on Firefox

Firefox supports logging in with the Nitrokey FIDO U2F since version 60. Unfortunately, one needs to enable the support for versions older than 67. The following instructions explain how to enable this setting.

At first click on the address field and type in 'about:config' like shown below. You are informed that you potentially break something. Please confirm and type in 'u2f' in the search form appearing after it.

![img1](./images/enabling-u2f-on-firefox/1.png)

Double-click on the appearing entry, so that the value changes from 'false' to 'true' like seen above. Firefox now accepts the Nitrokey FIDO U2F. You can close the tab afterwards.