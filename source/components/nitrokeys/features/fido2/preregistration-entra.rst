Nitrokey Pre-registration with Entra ID
=======================================

.. product-table:: nk3 passkey fido2

.. contents:: :local:

The Nitrokey 3 and Nitrokey Passkey support Pre-registration of credentials to Microsoft Entra for seamless employee onboarding in enterprise scenarios.

Setup
-----

A Microsoft Entra Application is required to allow for programmatic registration of user credentials. Here we offer you the guide to set up the same provided you have appropriate privileges for the same.

1. Login to Entra Admin portal at https://entra.microsoft.com/. Take a note of the primary domain. You will need it later. Go to App Registrations on the left blade.

    .. figure:: ./images/prereg-entra/entra-home.png
        :alt: Entra Admin Portal

2. Select New registration.

    .. figure:: ./images/prereg-entra/entra-appreg.png
        :alt: App registration

3. Create a new app and set a name. Click on 'Register'.

    .. figure:: ./images/prereg-entra/entra-appreg-review.png
        :alt: App registration

4. Take a note of the Client ID and Tenant ID here. You will need it later. Go to API Permissions on the app blade.

    .. figure:: ./images/prereg-entra/apphome.png
        :alt: App home


5. Click on Add a permission.

    .. figure:: ./images/prereg-entra/appperms.png
        :alt: App home


6. Select Microsoft Graph.

    .. figure:: ./images/prereg-entra/addperms.png
        :alt: App home

7. Select Application Permissions.

    .. figure:: ./images/prereg-entra/apiperms.png
        :alt: App home

8. Search for `UserAuthenticationMethod.ReadWrite.All` and select it.

    .. figure:: ./images/prereg-entra/authmethodrw.png
        :alt: App home

9. Search for `User.ReadWrite.All` and select it (Only if you want to be able to create users from `pynitrokey`). Click on the Add Permissions button.

    .. figure:: ./images/prereg-entra/userrw.png
        :alt: App home

10. Verify the Granted permissions.

    .. figure:: ./images/prereg-entra/permsadded.png
        :alt: App home

11. Click on Grant admin consent and approve it.

    .. figure:: ./images/prereg-entra/grantadminconsent.png
        :alt: App home

12. Go back to the app home and select Certificates and secrets from the left blade

    .. figure:: ./images/prereg-entra/apphomesecret.png
        :alt: App home

13. Click New Client secret

    .. figure:: ./images/prereg-entra/newclientsecret.png
        :alt: App home

14. Add a name and expiry, followed by clicking Add

    .. figure:: ./images/prereg-entra/secretparams.png
        :alt: App home

15. Make a note of the Client Secret (You will not be able to view it later.)

    .. figure:: ./images/prereg-entra/gensecret.png
        :alt: App home

16. Click on Authentication methods from the left blade.

    .. figure:: ./images/prereg-entra/homeauthmethod.png
        :alt: App home

17. Select Passkey (FIDO2).

    .. figure:: ./images/prereg-entra/authmethods.png
        :alt: App home

18. Click on the Configure tab.

    .. figure:: ./images/prereg-entra/authfido2.png
        :alt: App home

19. Click on Default Passkey profile

    .. figure:: ./images/prereg-entra/configfido2.png
        :alt: App home

20. Uncheck Enforce Attestation (Only if you are using a Nitrokey that does not have a FIDO Alliance certification. At the time of writing this document, only the NK3AM has this certification.)

    .. figure:: ./images/prereg-entra/configpasskeyprofile.png
        :alt: App home

21. Click Save.

    .. figure:: ./images/prereg-entra/disableattestation.png
        :alt: App home

22. You have taken note of the Tenant ID, Client ID, Client Secret and Primary Domain as a part of the process. Make a `config.json` file with the information. An example is shown below.

    .. code-block:: json

        {
            "tenant": "49d2c4c8-9144-49ea-b5f3-fc11b848cd72",
            "client": "e9f25c9c-3870-4aa8-9659-a40f09de093e",
            "secret": "************************************",
            "domain": "Cryptane.onmicrosoft.com"
        }

    .. figure:: ./images/prereg-entra/configjson.png
        :alt: App home

Usage
-----

You may use the `pynitrokey` utility to pre-register a Nitrokey for an user in your tenant.

    .. code-block:: shell-session

        nitropy fido2 preregister entra -c config.json <username> --create-user

Here the `<username>` could be the Email ID of the user (User principal in terms of Microsoft) or a part of it till before the `@` sign.
The `--create-user` flag directs the tool to create the user if it does not exist in the Entra Tenant.

    .. figure:: ./images/prereg-entra/terminal.png
        :alt: App home

Follow `Sample login to Microsoft with Nitrokey <passwordless-microsoft#sample-login-to-microsoft-with-the-nitrokey-fido2>`__ for signing in with this newly pre-registered nitrokey.

Verification
------------

You may verify the pre-registered credential from the Entra admin portal following the steps.

1. Go to the Users option from the left blade on Entra admin center.

    .. figure:: ./images/prereg-entra/entra-home-user.png
        :alt: alt

2. If the user was created with the `--create-user` flag you may be able to find the entry on the list. If it is a pre-existing user, it would also be there. Click on the user to which the credential was enrolled.

    .. figure:: ./images/prereg-entra/userlist.png
        :alt: alt

3. Click on Authentication methods on the user blade.

    .. figure:: ./images/prereg-entra/userdetails.png
        :alt: alt

4. The enrolled credential with first 5 characters of the Nitrokey UUID would be visible. You may click the triple dots and then on View details to see detailed information about the enrolled credential.

    .. figure:: ./images/prereg-entra/userauthmethods.png
        :alt: alt

5. Additional information about the credential would be visible. You may validate the same.

    .. figure:: ./images/prereg-entra/userpasskey.png
        :alt: alt
