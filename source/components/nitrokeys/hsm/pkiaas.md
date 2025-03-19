PKIAAS
======

For a description of PKIAAS, please see the [release announcement](https://www.smartcard-hsm.com/2018/02/13/pki-as-a-service.html).

A middleware will also be needed to connect your HSM plugged in your local computer to the remote PKIAAS server, see this [OpenCard Framework description](https://www.openscdp.org/ocf/index.html).

Installation
------------

### client configuration

We will need:

- a web browser to access the PKIAAS interface
- a jar file of the Open Card Framework (OCF)

Download ocf-cc.jar from the [OpenSCDP website](https://www.openscdp.org/ocf/ocf-cc.jar).


### PKIAAS server

We will be using the [docker installation](https://github.com/CardContact/deploy-pki-as-a-service).

On a Debian 12 host:

```
sudo apt install git
sudo apt install docker.io
sudo apt install iptables-legacy
sudo update-alternatives --config iptables
sudo service docker start
```

Fetch the docker deployment resources:

```
git clone https://github.com/CardContact/deploy-pki-as-a-service.git
cd deploy-pki-as-a-service
```

By the time of writing this guide, PKIAAS doesn't support setting arbitrary CRL endpoint, and doesn't handle OCSP at all. At most, we can set in a configuration file the Fully Qualified Domain Name (FQDN) behind which the crl will later be found.

Copy the application configuration file, and edit it to change de "serverURL" - amongs other settings - according to your needs:

```
cp pkiaas/etc/template/configuration.js env/etc/configuration.js
vim env/etc/configuration.js
```
```
Config.global = {
  serverURL: "{{ pkiaas_global_server_url }}",
  allowResetDB: false,
  allowDevHSM: false
}
```

Edit docker-compose.yml so that:

- the configuration file is loaded read-only as a volume, instead of building additional layers at each configuration change
- container is linked to two ports of our host
  - port 80 is needed for the CRL endpoint to look like http://<crl_host_fqdn>/se/crl/1
  - port 8080 is needed for OCF to successfully connect personnal HSM to http://localhost:8080/rt

```
vim docker-compose.yml
```
```
     volumes:
       - logs:/usr/share/pkiaas/logs
       - ./pkiaas/etc/configuration.js:/usr/share/pkiaas/etc/configuration.js:ro
   pkiaas-test:
       ports:
         - 80:8080
         - 8080:8080
```

We're good to go

```
docker-compose up
```


Usage
-----

### Access to the portal

Open your web browser to http://<docker_host_fqdn>

### Listing devices

As before we will be dealing with to kind of HSM:

- CA HSM to protect the root CA
- personnal HSM to perform authentication

Use `-l` option of ocf-cc.jar to list the HSM plugged in your computer:

```
> java -jar ocf-cc.jar -l
SLF4J: No SLF4J providers were found.
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See https://www.slf4j.org/codes.html#noProviders for further details.
OCF1.2;IBM Reference Implementation with OpenSCDP extensions 2.0.2.0.35
Available card terminals:
 Nitrokey Nitrokey HSM 0
```

TrustCenter preparation
-----------------------

### Account activation

This step is required only the first time we connect to PKIAAS.

For now, we will only plug in the PKIAAS admin's personnal HSM.

```
java -jar ocf-cc.jar -r "Nitrokey Nitrokey HSM 0" -v
```

In the web browser, reload the page. A java window appears asking for the PIN of the HSM. Type it in and confirm.

An e-mail adress is asked. Give yours, and you should receive and activation code. You might as well check out your docker logs to find the same code.

Enter the activation code when asked, tick the checkboxes you woul'd like for your notification preferences, and click "Submit".

Now we see the home page.

### TrustCenter creation

Before we are able to actually manage our CA, we have to create a "TrustCenter". In the navigation bar, click on Home / Create Trust Center Subject.

The different roles available in PKIAAS are described. Here is an excerpt:

> When creating a TrustCenter three roles are created and initially assigned to the person creating the TrustCenter:
>
> -TrustCenter Manager - responsible for managing roles.
> -TrustCenter Operator - responsible for operating the TrustCenter
> -Registration Officer - responsible for processing certification requests.
> -Certification Officer - responsible for managing keys and issuing certificates.
>
> As part of this service request you can assign a SmartCard-HSM token to the TrustCenter. Assigning a SmartCard-HSM is important to establish a link between the HSM's identity and the TrustCenter, so that when the SmartCard-HSM is remotely connected, it can be correctly allocated to the entity. Multiple HSMs can be assigned and assigments can be withdrawn by opening the service request again.

For our use cases, all roles will be given to the same person.

Click on "Start Request", then fill in the form:

```
Unique Name : <your organization name>
Operation Mode : Private
```

Click on "Save", then on "Submit".

### CA device registration

We have to tell to PKIAAS which device to use for our CA.

- stop the ocf client
- unplug the personnal HSM
- plug the CA HSM
- connect the CA HSM with the following command: `java -jar ocf-cc.jar -r "Nitrokey Nitrokey HSM 0" -v`

On the home page:

- click on "Create TrustCenter Subjet (<your organization name>)"
- keep "operation mode" set to "private"
- click on "Add Token"

Do the same with the second HSM you have to backup your CA!

Now you can stop the OCF, as we will have to use a different URL to connect the CA HSM to PKIAAS.


Using the CA HSM
----------------

This steps will allow key custodians to authenticate against the CA HSM, wich will be necessary to do anything useful with the device.

### Connecting HSM

From now on, We'll keep the CA HSM plugged most of the time, while we will have to frequently plug and unplugg personnal HSM. In order to avoid confusion and connectivity issues, we recommend the run two sessions of OCF in parallel.

Always connect your CA device first:

- make sure no HSM is currently plugged in
- plug your CA HSM, so it will be detected as "Nitrokey Nitrokey HSM 0"
- connect your CA HSM with `java -jar ocf-cc.jar -r "Nitrokey Nitrokey HSM 0" http://<fqdn_machine_pkiaas>/rt/hsm`

When you'll have to perform authentication, do like so:

- plug the personnal HSM that will be used for authentication, so it will be detected as "Nitrokey Nitrokey HSM 1"
- connect the deivce with `java -jar ocf-cc.jar -r "Nitrokey Nitrokey HSM 1" -v`

### M-of-n authentication

In the navigation bar, go to Views / Subjects. In the table, dind your TrustCenter and click on its ID at the beggining of the line.

If necessary, reload the page. There is a line showing your CA device, with the numbers of public keys currently authenticated.

Click on "Authenticate", then
- plug one of the personnal HSM
- reload the page
- if the CA HSM is shown instead of the personnal HSM, click on "Enumerate key"
- pick the key used for authentication (it is recognizable by its label)
- click on "Authenticate"
- ask the key custodian to enter their PIN in the java windows
- unplug the personnal HSM.

Reiterate until the quorum is reached. There, the "Authenticate" button will be replaced by a "Logout" button. Do not click on it!


Root CA creation
----------------

### Root CA request and signature

In the navigation bar, go to Views / Subjects, then click on your TrustCenter ID.

In the navigation bar, a new section appears. Click on CA / Create Signer, then on "Start Request". Fill in the form:

```
Issuing CA: Self-signed Root CA (this value can't be changed)
Trust Center: <your organization name> (this value can't be changed)
```
```
### CA Certificate Definitions
Expires after (days): 4380 (root CA will be valid for 12 years)
Subordinate CAs: 1 (one level of intermediate CA will be allowed)

### Certification Authority Data
Distinguished Name: C = <country>, ST = <state>, L = <locality>, O = <organization>, OU = <organizational unit>, CN = <root CA name>

### Key Specification
Key Specification: EC secp384r1 SHA-256

### Subject certificate Definitions
Key Specification: EC secp384r1 SHA-256
Expires after (days): 1825 (intermediate CA will be valid for 5 years)
Subject DN Rule: c=${issuer.c},st=${issuer.st},l=${issuer.l},o=${issuer.o},cn=${servicerequest.commonName}
upported Profiles: SubCA / TLSServer / TLSClient / EmailAndTLSClient

### CRL Definitions
Expires after: 365 (key custodians will meet at least once a year to sign a new certificate revocation list)
```

If the CA HSM is plugged in and pubkeys authentication went well, then we can:

- click on "Save"
- click on "Submit"
- click on "Create Signer"

The HSM lights up and a first entry appears in the list of certificates on screen. Congratulations, your root CA has just been created!

### Root CA certificate export

In the navigation bar, go to Subjects / TrustCenter.

The root CA should be visible here. Click on it. Certificate details are shown. At the bottom of the page, click on "Download Certificate".

This is the file your machines will have to trust to verify the certificates delivered by your external intermediate CA.


Sharing access to PKIAAS
------------------------

### Allow additionnal personnal HSM to access the CA

The first personnal HSM you used to connect to PKIAAS has been registered with the TrustCenter. To avoid the risk of being locked out, it's best to give access to a second key custodian.

In the navigation bar, go to Views / Subjects, and click on the ID of the TrustCenter.

In the navigation bar, a "CA" menu appears. Click it, then "Enroll person".

On the new page, click on "Start Request", then fill in the form:

```
Name: <personnal id>
email: <e-mail adress>
CA: <root CA name>
```

- click on "Create"
- replace the device currently plugged in with the device to register
- click on "Identify token"
- a HSM ID should appear, looking similar to /DESRCACC1/DEDINK01/DENK0105102
- if this device is not authenticated, restart the OCF client and reload the web page
- click on "Save"

### Associate the personnal HSM with the relevant roles

Now, the device must be given the right permissions to actually being able to sign the certificates.

In the navigation bar, click on View / Subjects, then click on the ID right before the newly registered custodian.

In the navigation bar, a "Subject" menu appears. Click on it, then "Manage role". On the new page:

- click on "Start Request"
- select all roles
- click on "Save"
- click on "Apply".

Note: authentication relies upon a certificate flashed right on the device. It is independant of the key pairs we generated earlier with `Smart Card Shell`. Those certificates will still be present on the device even in case of a renitialization, but flashing the device will erase them.


Signing with the root CA
------------------------

There are basically three things you might want to do with this root CA:

- signing intermediate CA
- revoking intermediate CA
- updating the revocation list

Before anything, make sure your HSM arer connected and authenticated as described earlier at section "Using the CA HSM".

### Sign an intermediate CA

This requires you already have a `.csr` for the intermediate CA you intend to sign.

In the navigation bar, go to Home / Request Certificate (PKCS #10). Then:

- pick the root CA and click on "Start Request"
- click on "Browse", pick the `.csr` file
- click on "Upload"
- review the settings. Name can be changed but that's no obligation.
- click on "Save", then on "Submit"
- as a "registration officer", approve your own request

In the navigation bar, go to Views / Service Requests. Then:

- as a "certification officer", click the ID matching the line with "PKCS10ServiceRequest" et "Produce"
- review the request
- click on "Issue Certificate"
- click on "Accept Certificate"

### Intermediate CA certificate export

In the certificate list, click on the intermediate authority name. At the bottom of the page, use the "Download Certificate" button.

And voilà! You can return this certificate to the person in charge of this intermediate CA.

### Revoke an intermediate CA

From the home page, find the line "Request Certificate" matching the intermediate CA to revoke. Click on it.

Verify the certificate description, and if you are sure confirm by clicking "Revoke Certificate".

### Update certificate revocation list

Each time a certificate is revoked, or when the CRL reaches its end of life, a new CRL must be signed.

In the navigation bar, go to Views / Subjects, then click on your TrustCenter ID.

In the navigation bar, click on CA / Issue CRL, then:

- click on "Start Request"
- select your root CA
- click on "Select"
- click on "Issue"

The new crl can be fetched by clicking "Download CRL", or through the command line:

```
wget http://<docker_host_fqdn>/sr/crl/1 -O root-ca.crl
```

CRL content can be displayed with openssl:

```
openssl crl -in root-ca.crl -text -noout
```

