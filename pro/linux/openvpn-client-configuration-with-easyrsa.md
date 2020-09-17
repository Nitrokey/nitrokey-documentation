# OpenVPN Client Configuration

This guide shows how to configure OpenVPN clients to login using a [Nitrokey Pro 2](https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3). For key management we will be using [Easy-RSA](https://github.com/OpenVPN/easy-rsa), a utility that has been evolving alongside OpenVPN. 

To sign the certificates, we will use a [Nitrokey HSM 2](https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3) set up as [Certificate Authority](https://docs.nitrokey.com/hsm/linux/creating-certificate-authority.html#creating-the-intermediate-certificate-authority), however this guide does not cover the set up of the CA itself (it is clear and [well documented here](https://docs.nitrokey.com/hsm/linux/creating-certificate-authority.html#sign-a-server-certificate)).

We will use Easy-RSA, because it seems to provide some flexibility, and allows key management via external PKIs. We will use it on the server to issue the signing request, and repeat the same process on the client. The Certificate Signing Requests will be signed by the CA on the Nitorkey HSM, and re-transmitted to the server and the client. 

We can decompose the instructions of the guide as following:

	Server Side
	
		1. Install OpenVPN
		2. Install Easy-RSA
		3. Create a Public Key Infrastructure (PKI) for the OpenVPN server
		4. Create the server's Certificate Signing Request and the server's key
		5. Sign and retrieve the server's Certificate `
		6. Configure the OpenVPN Server 
		7. Start the OpenVPN Server
	
	Client side 
	
		1. Install OpenVPN and Easy-RSA
		2. Create a Public Key Infrastructure (PKI) for the OpenVPN client
		3. Create the client's Certificate Signing Request and the client's Key
		4. Sign and issue the client's certificate
		5. Import the client certificate on the Nitrokey from the CA machine
		6. Retrieve the chain certificate from the CA machine 
		7. Configure the client to interact with the Nitrokey 
		8. Start the OpenVPN client

------

## Prerequisites

In the following documentation we will require 3 different machines as following:

- OpenVPN server (v. 2.5) on Debian 10 (EC2 virtual machine - AWS)
- OpenVPN client (v. 2.4.9) on Fedora 30 (local machine)
- The Certificate Authority will be accessible from a standalone machine with Fedora 30 (local machine) 

To interact with the devices we will require [OpenSC 0.20](https://github.com/OpenSC/OpenSC/wiki) installed on the client and CA machine (the local machines). You can follow the instructions to set it up in [this link (*Unix)](https://github.com/OpenSC/OpenSC/wiki/Compiling-and-Installing-on-Unix-flavors). 

To download the dependencies on Fedora machines we can this instruction:

```bash
su -c 'dnf install readline-devel openssl-devel libxslt docbook-style-xsl pcsc-lite-devel automake autoconf libtool gcc zlib-devel'
```

For Debian Linux, more recent OpenSC packages are available [here](https://github.com/Nitrokey/opensc-build).

We will use the following Nitrokeys for physical key management:

- An authentication key using the [Nitrokey Pro 2 (pdf)](https://www.nitrokey.com/files/doc/Nitrokey_Pro_factsheet.pdf)

- A Certificate Authority (CA) using the [Nitrokey HSM 2 (pdf)](https://www.nitrokey.com/files/doc/Nitrokey_HSM_factsheet.pdf)

As a reminder, to build a Certificate Authority on Nitrokey HSM 2, you may follow the instructions available [in the documentation](/hsm/linux/creating-certificate-authority.html#sign-a-server-certificate). 

Alternatively you may set up your own CA on a [on a separate machine](https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04), or use the OpenVPN tutorial which also relies on [Easy-RSA](https://openvpn.net/community-resources/setting-up-your-own-certificate-authority-ca/). The last 2 options rely on software solutions for key management. 

------

## Server side

#### 1. Install OpenVPN

1. ##### First we need to enable IP Forwarding by editing `/etc/sysctl.conf` file
```bash
$ editor /etc/sysctl.conf
```
2. ##### Uncomment or edit accordingly the following line
```bash
net.ipv4.ip_forward=1
```
3. ##### Close after saving it, and enter this command
```bash
$ sysctl -p
```
Once IP forwarding is done, we will need to download the latest release of OpenvPN for our Debian 10 server, according to [these instructions](https://community.openvpn.net/openvpn/wiki/OpenvpnSoftwareRepos?__cf_chl_jschl_tk__=62f18d28588ed33f3c599052099bf7e46feb1378-1599355462-0-AXDsohY5kUawZr5f8zhAXWpKu5VPhIRdq9_e91od4P57mQ1ark9iUC72WozqlGT7OJpJBp5Dn9nxKCPxW7eOU6gqq8s7GY02YXtfSWjsfVRsilbZszJwK-_HtzZrDMx6g1REseNP9NUwj402W70xcVAiQrRJBuYqOal9Q3JIEywbW_XRrEIWEMsklfKgq5Dq6N_UAb14YgR__-G0VoNiH6cGvhzZgZ_puEjIy2yF4gm0RUrO7exX5SX3jUwf3xT9htaH1DHoYqe8cxOngl7NyY8JG4zjhhxCe4beGOi0FHlimW2TqtGoeN85-aoGMSp9gA): 

4. ##### Change to root and download the GPG key that signed the package

```bash
$ sudo -s 
# wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
```
5. ##### Add the URL of the adequate OpenVPN packages to the `sources.list` file 

```bash
# echo "deb http://build.openvpn.net/debian/openvpn/release/2.5 buster main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
# exit
```

We downloaded OpenVPN 2.5 as "password prompt" requires at least OpenVPN [version 2.4.8](https://community.openvpn.net/openvpn/ticket/1215?__cf_chl_jschl_tk__=92b2a9776b54ce71b2f15e4d3f62dbdb5ee68f5f-1599568561-0-AY906nmSrFwe8EfT2PKawtrgl2NF72nwMrG9mp57SgIAqFmzxHiqod7ED0oVbimJlDD2xzLNLbQU6iUlVImbo8Q25qpDJVJ56YHbE4JKQSusHiwS8GLMm8Di9Gk6k63_qN5SDot-ABpgFoNcaRUHGZQ0fVYKYXZDf5E_0ZAOjPWsD2FXLfc7atx53t9scbdGF1p7xl2VRFcBoy2l7KgvvZU589YNs1wsRG62neISVpM-9E-s9CuccSAX8y3ZQfZUq7et9QIdgaSK9g-PhFqKWJhZLFkmTwR0wmYbKXjhxQ6j) to login.

6. ##### Next we download OpenVPN

```bash
$ sudo apt install openvpn
```
If you want to check the version, it possible by calling `--version` and print the following: 
```bash
$ sudo openvpn --version
OpenVPN 2.5_beta3 x86_64-pc-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Sep  1 2020
library versions: OpenSSL 1.1.1d 10 Sep 2019, LZO 2.10
Originally developed by James Yonan
Copyright (C) 2002-2018 OpenVPN Inc <sales@openvpn.net>
Compile time defines: enable_async_push=no enable_comp_stub=no enable_crypto_ofb_cfb=yes enable_debug=yes enable_def_auth=yes enable_dependency_tracking=no \ enable_dlopen=unknown enable_dlopen_self=unknown enable_dlopen_self_static=unknown enable_fast_install=needless enable_fragment=yes enable_iproute2=yes \ enable_libtool_lock=yes enable_lz4=yes enable_lzo=yes enable_maintainer_mode=no enable_management=yes enable_multihome=yes enable_pam_dlopen=no enable_pedantic=no \ enable_pf=yes enable_pkcs11=yes enable_plugin_auth_pam=yes enable_plugin_down_root=yes enable_plugins=yes enable_port_share=yes enable_selinux=no \ enable_shared=yes enable_shared_with_static_runtimes=no enable_silent_rules=no enable_small=no enable_static=yes enable_strict=no enable_strict_options=no \ enable_systemd=yes enable_werror=no enable_win32_dll=yes enable_x509_alt_username=yes with_aix_soname=aix with_crypto_library=openssl with_gnu_ld=yes \ with_mem_check=no with_sysroot=no
```

#### 2. Install Easy-RSA

To build the PKI, we will download the latest version of Easy-RSA on the server and client machines. To get the latest release, go to the [Releases page on the official EasyRSA GitHub project](https://github.com/OpenVPN/easy-rsa/releases), copy the download link for the file ending in ```.tgz```, and then paste it into the following command:

##### 1. Download the latest release

```bash
$ cd ~
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.7/EasyRSA-3.0.7.tgz
```
##### 2. Extract the tarball

```bash
$ cd ~
$ tar xvf EasyRSA-3.0.7.tgz
$ mv EasyRSA-3.0.7/ Easy-RSA/ # rename folder
```
#### 3. Create a PKI for OpenVPN server

Before you can create your OpenVPN server’s private key and certificate, you need to create a local Public Key Infrastructure directory on your OpenVPN server. You will use this directory to manage the server and clients’ certificate requests, instead of making them directly on your CA server.

To build a PKI directory on your OpenVPN server, you’ll need to populate a file called `vars` with some default values. 

##### 1. Create a `vars` file

```bash
$ touch ~/Easy-RSA/vars
$ cd Easy-RSA/
$ editor vars
```

##### 2. Once the file is opened, paste in the following two lines

```bash
set_var EASYRSA_ALGO "ec"
set_var EASYRSA_DIGEST "sha512
```

These are the only two lines that you need in this `vars` file on your OpenVPN server since it will not be used as a Certificate Authority. They will ensure that your private keys and certificate requests are configured to use Elliptic Curve Cryptography (ECC) to generate keys, and secure signatures for your clients and OpenVPN server. 

In regards to the choice of the cryptographic algorithms, I follow the model in [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-centos-8), and you can customize these according to your specific needs. 

##### 3. Initialize the PKI

Once you have populated the `vars` file you can proceed with creating the PKI directory. To do so, run the easyrsa script with the init-pki option:

```bash
$ ./easyrsa init-pki
```
After you’ve initialized your PKI on the OpenVPN server, you are ready to move on to the next step, which is creating an OpenVPN server certificate request and private key.

#### 4. Create `server.req` and `server.key`

Now that your OpenVPN server has all the prerequisites installed, the next step is to generate a key pair composed of a private key (to keep secret), and a Certificate Signing Request (`.csr`) on your OpenVPN server. 

In general terms, on systems where we generate a key and request, these files are left unencrypted by using the `nopass` argument, since servers usually need to start up without any password input. This generates an *unencrypted key*, so mind *protect its access and file permissions* carefully.

::: tip Configuration notes from OpenVPN:

1. The server, and each client, must have their own cert and key file. The server and all clients will use the same CA file.
2. Server certificate should have the following:

-  `keyUsage:  digitalSignature, keyEncipherment`
-  `extendedKeyUsage: serverAuth`

:::

##### 1. Create the signing request for the server

Navigate to the `~/Easy-RSA` directory on your OpenVPN Server as your non-root user, and enter the following commands:

```bash
$ cd Easy-RSA/
$ ./easyrsa gen-req server nopass
```
This will create a private key for the server and a certificate request file called `server.req`. 

Once you have a signed certificate, you’ll transfer it back to the OpenVPN server.

##### 2. Copy the key to the OpenVPN server directory

```bash
$ sudo cp /home/admin/EasyRSA-3.0.7/pki/private/server.key /etc/openvpn/server/
```

After completing these steps, you have successfully created a private key for your OpenVPN server. You have also generated a Certificate Signing Request for the OpenVPN server. 

::: tip File extensions for certificate signing requests

The file extension that is adopted by the CA and HSM tutorial indicates the creation of a `.csr` file, however Easy-RSA creates certificate signing requests with a `.req` extension. 

We will use interchangeably both extensions, while making sure that we transfer the right files to the Certificate Authority, and generate a final certificate with a `.crt` extension.

:::

In the next section of this guide, we will sign a `.req` file with our CA on deployed on the HSM 2 device. For this purpose, I will use a dedicated machine to sign the requests. 

#### 5. Sign and retrieve `server.crt` 
The following instructions require the transfer of the `server.req` (or `server.csr`) file to the CA system.

The transfer itself is not security sensitive, though it is wise to verify if the received file matches the sender's copy, if the transport is untrusted. 

In order to go through these steps, I will extensively rely on [these instructions](/hsm/linux/creating-certificate-authority.html#creating-the-intermediate-certificate-authority), to sign the certificate signing requests, once we generated them with Easy-RSA.

##### 1. Sign the `server.req` file

On the local machine dedicated to access the HSM, we will use the tools provided by Opensc 0.20 in order to sign the `.req` file, and send it back to the OpenVPN server. We assume we have transferred the file from the server machine to the CA machine. 

First we start by plugging the HSM Nitrokey, and enter this instruction for listing the keys available.

1. Query the list of available devices

```bash
$ p11tool --list-all
```

​	**(Required step)** If this is the first time you sign a certificate with the CA, you might want to retrieve the URI of the CA's private key from the HSM, and include it in the config file. 

- The key's URI should be in this format:

```bash
pkcs11:model=PKCS%2315%20emulated;manufacturer=www.CardContact.de;serial=DENK0104068;token=SmartCard-HSM%20%28UserPIN%29%00%00%00%00%00%00%00%00%00;id=%E0%16%1C%C8%B6%F5%D6%6A%C6%83%5E%CD%EC%B6%23%FC%05%06%A6%75;object=root;type=private
```

2. Create `openvpn/` directory under `certificate-authority/`

```bash
$ mkdir/opt/certificate-authority/
$ cd /opt/certificate-authority/
```
3. Sign the `server.req`

```bash
$ openssl ca -config sign_server_csrs.ini -engine pkcs11 -keyform engine -days 375 -notext -md sha512 -create_serial -in server.req -out /home/user/pki/issued/server.crt 
```

##### 2. Retrieve the `server.crt` file to the server machine

1. Transfer the signed certificates to the server

From the CA machine, copy the files `server.crt` and `chain.crt` to the OpenVPN server. In this example we will use the `scp` command as following:

```bash
$ scp openvpn/{server.crt,chain.crt} admin@your_openvpnserver_ip:/tmp
```

2. Place the certificates on the server's directory

```bash
$ mv /tmp/{server.crt,chain.crt} /etc/openvpn/server
```
::: warning CA Certificate and `chain.crt` 

In the above, the CA returns the signed sever certificate, and includes the CA certificate ```CA.crt``` which is the ```chain.crt``` file. This can be done over an insecure channel, though the client is encouraged to confirm if the received `chain.crt` is valid, if the transport is untrusted. 

It is possible to rename the file `chain.crt` file to `CA.crt` on the target machine, however we will use `chain.crt` in the next instructions.

:::

#### 6. Configure the OpenVPN server 

A connection that uses TLS requires multiple [certificates and keys for authentication](https://wiki.teltonika-networks.com/view/OpenVPN_configuration_examples). Now that we issued and signed those, we can place them in the right directories. The breakdown of the certificates and keys that must be located at the root directory are the following: 

	OpenVPN server 
	
		- The root certificate file (`CA.crt` or `chain.crt` in our setup)
		- Server certificate
		- Server key
		- Diffie Hellman Parameters (optional)

On your OpenVPN server, now you can create the configuration file `server.conf` with your favorite text editor. The file can be configured according to your needs, while we make sure to change the server certificate and key sections according the names you chose for the your the files we signed:

```bash 
# OpenVPN Server Certificate - CA, server key and certificate
ca chain.crt
cert server.crt
key server.key
```

Here is the configuration file we can use for testing these instructions:
```bash 
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key  # This file should be kept secret
dh dh.pem
server 10.8.0.0 255.255.255.0
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 208.67.222.222"
push "dhcp-option DNS 208.67.220.220"
keepalive 10 120
tls-auth ta.key 0 # This file is secret
cipher AES-256-CBC
user nobody
group nogroup
persist-key
persist-tun
status /var/log/openvpn/openvpn-status.log
log         /var/log/openvpn/openvpn.log
log-append  /var/log/openvpn/openvpn.log
verb 3
explicit-exit-notify 1
tls-version-min 1.2 # Lower boundary for TLS version 
tls-version-max 1.2 # Higher boundary for TLS version
```

To test if the configuration functions properly, we can use this command:

```bash 
$ sudo openvpn --server --config server.conf
```

#### 7. Start the OpenVPN service on the server

Enable the OpenVPN service by adding it to systemctl, and start it using these commands: 

```bash 
$ sudo systemctl -f enable openvpn@server
$ sudo systemctl start openvpn@server
```

To Double check if the OpenVPN service is active use this command:

```bash 
$ sudo systemctl status openvpn@server
```

The OpenVPN should be running at this point. 

------

## Client side configuration

		1. Install OpenVPN and Easy-RSA
		2. Create a Public Key Infrastructure (PKI) for the OpenVPN client
		3. Create the client's certificate signing request and the client's key
		4. Sign and issue the client's certificate
		5. Import the client certificate on the Nitrokey from the CA machine
		6. Retrieve the chain certificate from the CA machine 
		7. Configure the client to interact with the Nitrokey 
		8. Start the OpenVPN client

#### 1. Install OpenVPN and Easy-RSA
##### 1. Install the software 

We can use directly `dnf install`to install OpenVPN 2.4.9 and Easy-RSA 3.0.7

```bash
$ sudo dnf install openvpn easy-rsa
```

##### 2. Then we create as non-root a directory for Easy RSA called `Easy-RSA` 

```bash
$ mkdir ~/Easy-RSA
```
##### 3. And link it to the Easy RSA package we just installed

```bash
$ ln -s /usr/share/easy-rsa/3/* ~/Easy-RSA/
```

##### 2. Create a PKI for the OpenVPN client

In the same manner we created a PKI on the OpenVPN server, we will create a PKI using Easy-RSA on the client side.

##### 3. Create a `client.req` and `client.key`

In the same manner we issued the key pair on the sever, we generate a key pair for the client which will be composed of the `client.req` file and the `client.key` file. The latter must be kept secret on the client machine. 

##### 4. Sign `client.req` and issue the `client.crt` file

To transfer the `client.req` file to the CA machine, we will use the same method as we did for the `server.req` file.

Once transferred, on the CA machine we sign the certificate signing request file with this command

```bash
$ openssl ca -config sign_server_csrs.ini -engine pkcs11 -keyform engine -days 375 -notext -md sha512 -create_serial -in client.req -out /home/user/pki/issued/client.crt 
```

#### 5. Import `client.crt` on the Nitrokey from the CA machine
/// Some documentation says that we can use the ./pkitool script available with Easy-RSA, to directly initialize a key pair on the Nitrokey, however the pkitool utility seems to be deprecated ///

After creating the `client.crt` file, we plug the Nitrokey Pro 2 device in the CA machine, and import the `.crt` to the Pro 2 device using this command:

```bash
$ pkcs15-init --store-certificate client.crt --id 3
```

You can see if the key is effectively stored on the Nitrokey using this command:

```bash
$ pkcs15-tool --c

```
Or alternatively
```bash
$ pkcs11-tool --list-objects 
```

Fore more commands you can refer to the [OpenSC wiki](https://github.com/OpenSC/OpenSC/wiki/OpenPGP-card). 

#### 6. Retrieve the `chain.crt` file from the CA machine 

While we keep the `client.crt`stored on the nitrokey Pro 2 device, we must retrieve the `chain.crt` file on the client machine, and store it in the adequate directory. We may use `scp` as in the method explained in the server section of this guide. 

#### 7. Configure the client to interact with the Nitrokey

Now back on the client machine, we will plug the Nitrokey Pro and use it to establish the VPN connection with the server.  In general terms, a connection that uses TLS requires multiple certificates and keys for authentication:

	OpenVPN client 
		- The root certificate file (`chain.crt`)
		- Client certificate
		- Client key


For this guide we can the following `client.conf` file, and add the required options to it accordingly:
```bash
client
dev tun
proto udp
remote <server> 1194
resolv-retry infinite
nobind
user nobody
group nobody
persist-key
persist-tun
ca ca.crt
remote-cert-tls server
cipher AES-256-CBC
verb 3
redirect-gateway def1
tls-version-min 1.2 # Lower boundary for TLS version 
tls-version-max 1.2 # Higher boundary for TLS version
```

##### 1. Determine the correct object

Each PKCS#11 provider can support multiple devices. In order to view the available object list you can use the following command:


```
$ openvpn --show-pkcs11-ids /usr/lib64/pkcs11/opensc-pkcs11.so 

The following objects are available for use.
Each object shown below may be used as parameter to
--pkcs11-id option please remember to use single quote mark.

Certificate
       DN:             CN=client
       Serial:         E53DA75C5B8F1518F520BCEF0128C09F
       Serialized id:  pkcs11:model=pkcs11:model=PKCS%NNNN%20emulated;token=User%20PIN%20%28OpenPGP%20card%29;manufacturer=ZeitControl;serial=000NNNNNN;id=%03

```

Each certificate/private key pair have unique `Serialized id` string. The serialized id string of the requested certificate should be specified, in the configuration file. We can do this by adding the `pkcs11-id` option using single quote marks.

```bash 
pkcs11-id 'pkcs11:model=pkcs11:model=PKCS%NNNN%20emulated;token=User%20PIN%20%28OpenPGP%20card%29;manufacturer=ZeitControl;serial=000NNNNNN;id=%03'
```

##### 2. Add retrieved Serialized ID to the configuration file

Using your favorite text editor, open the server.conf file, and add the following lines, while taking care to insert your own `Serialized id`:

```bash 
pkcs11-providers /usr/lib64/pkcs11/opensc-pkcs11.so
pkcs11-id 'pkcs11:model=pkcs11:model=PKCS%NNNN%20emulated;token=User%20PIN%20%28OpenPGP%20card%29;manufacturer=ZeitControl;serial=000NNNNNN;id=%03'
```

For additional [settings related to OpenVPN](https://openvpn.net/community-resources/how-to/) authentication, you may also add few lines to handle key maganagement, although it is optional.

::: details Click to view the code
```bash
# nitrokey config
	
pkcs11-providers /usr/lib64/pkcs11/opensc-pkcs11.so
pkcs11-id 'pkcs11:model=pkcs11:model=PKCS%NNNN%20emulated;token=User%20PIN%20%28OpenPGP%20card%29;manufacturer=ZeitControl;serial=000NNNNNN;id=%03'
# pkcs11-pin-cache 300
# daemon
# auth-retry nointeract
# management-hold
# management-signal
# management 127.0.0.1 8888
# management-query-passwords
pkcs11-cert-private 1 # Prompt for PIN
```
::: 

###### Optional step

If you need to test the configuration, with and without the token on the Nitrokey, you may add lines to the same `client.conf` and comment/uncomment the relevant lines according to your needs:
::: details Click to view the code
```bash
# non_nitrokey login

# cert client.crt
# key client.key
# tls-auth ta.key 1
```
:::

##### 3. Configure the OpenVPN client

The final configuration file `client.conf` should look like this one:
```bash
client
dev tun
proto udp
remote <server> 1194
resolv-retry infinite
nobind
user nobody
group nobody
persist-key
persist-tun
ca ca.crt
remote-cert-tls server
cipher AES-256-CBC
verb 3
redirect-gateway def1
tls-version-min 1.2 # Lower boundary for TLS version 
tls-version-max 1.2 # Higher boundary for TLS version
	
# nitrokey login
	
pkcs11-providers /usr/lib64/pkcs11/opensc-pkcs11.so
pkcs11-id 'pkcs11:model=pkcs11:model=PKCS%NNNN%20emulated;token=User%20PIN%20%28OpenPGP%20card%29;manufacturer=ZeitControl;serial=000NNNNNN;id=%03'
# pkcs11-pin-cache 300
# daemon
# auth-retry nointeract
# management-hold
# management-signal
# management 127.0.0.1 8888
# management-query-passwords
pkcs11-cert-private 1 # Prompt for PIN
	
# OR
	
# non_nitrokey login
	
# cert client.crt
# key client.key
# tls-auth ta.key 1
```

##### 4. Known issues

There are some known issues related to OpenVPN login with OpenSC. Please consult these issues [here](https://github.com/Nitrokey/wiki/wiki/3rd-Party-Issues).

#### 8. Start the OpenVPN client

##### 1 Start the OpenVPN service on the client

Enable the OpenVPN service, and start it using these commands: 

```bash 
$ sudo systemctl -f enable openvpn-server@server.service
$ sudo systemctl start openvpn-server@server.service
```

To double check if the OpenVPN service is active use this command:

```bash 
$ sudo systemctl status openvpn-server@server.service
```

##### 2 Enter your User PIN

When executing OpenVPN client, Nitrokey's PIN needs to be entered:
```bash 
$ sudo openvpn --client --config client.conf 
Fri Sep 11 17:42:01 2020 OpenVPN 2.4.9 x86_64-redhat-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Apr 24 2020
Fri Sep 11 17:42:01 2020 library versions: OpenSSL 1.1.1g FIPS  21 Apr 2020, LZO 2.08
Fri Sep 11 17:42:01 2020 PKCS#11: Adding PKCS#11 provider '/usr/lib64/pkcs11/opensc-pkcs11.so'
Enter User PIN (OpenPGP card) token Password: ******
```

Unfortunately OpenVPN doesn't seem to be able to establish a handshake and stops at an error as reported [here](https://support.nitrokey.com/t/nitrokey-pro-with-openssl-1-1-1-tls-1-3-and-rsa-based-certificates/2180/2), [here](https://support.nitrokey.com/t/openvpn-openssl-error-141f0006/2637) and [here](https://community.openvpn.net/openvpn/ticket/1215?__cf_chl_jschl_tk__=92b2a9776b54ce71b2f15e4d3f62dbdb5ee68f5f-1599568561-0-AY906nmSrFwe8EfT2PKawtrgl2NF72nwMrG9mp57SgIAqFmzxHiqod7ED0oVbimJlDD2xzLNLbQU6iUlVImbo8Q25qpDJVJ56YHbE4JKQSusHiwS8GLMm8Di9Gk6k63_qN5SDot-ABpgFoNcaRUHGZQ0fVYKYXZDf5E_0ZAOjPWsD2FXLfc7atx53t9scbdGF1p7xl2VRFcBoy2l7KgvvZU589YNs1wsRG62neISVpM-9E-s9CuccSAX8y3ZQfZUq7et9QIdgaSK9g-PhFqKWJhZLFkmTwR0wmYbKXjhxQ6j)

::: warning error output

`$ sudo openvpn --client --config client.conf` 
`Fri Sep 11 17:42:01 2020 OpenVPN 2.4.9 x86_64-redhat-linux-gnu [SSL (OpenSSL)] [LZO] [LZ4] [EPOLL] [PKCS11] [MH/PKTINFO] [AEAD] built on Apr 24 2020`
`Fri Sep 11 17:42:01 2020 library versions: OpenSSL 1.1.1g FIPS  21 Apr 2020, LZO 2.08`
`Fri Sep 11 17:42:01 2020 PKCS#11: Adding PKCS#11 provider '/usr/lib64/pkcs11/opensc-pkcs11.so'`
`Enter User PIN (OpenPGP card) token Password: ******`
`Fri Sep 11 17:42:12 2020 TCP/UDP: Preserving recently used remote address: [AF_INET]18.157.180.240:1194`
`Fri Sep 11 17:42:12 2020 Socket Buffers: R=[212992->212992] S=[212992->212992]`
`Fri Sep 11 17:42:12 2020 UDP link local: (not bound)`
`Fri Sep 11 17:42:12 2020 UDP link remote: [AF_INET]18.157.180.240:1194`
`Fri Sep 11 17:42:12 2020 NOTE: UID/GID downgrade will be delayed because of --client, --pull, or --up-delay`
`Fri Sep 11 17:42:12 2020 TLS: Initial packet from [AF_INET]18.157.180.240:1194, sid=d79690cf 9e38ce89`
`Fri Sep 11 17:42:12 2020 VERIFY OK: depth=1, CN=server_CA`
`Fri Sep 11 17:42:12 2020 VERIFY KU OK`
`Fri Sep 11 17:42:12 2020 Validating certificate extended key usage`
`Fri Sep 11 17:42:12 2020 ++ Certificate has EKU (str) TLS Web Server Authentication, expects TLS Web Server Authentication`
`Fri Sep 11 17:42:12 2020 VERIFY EKU OK`
`Fri Sep 11 17:42:12 2020 VERIFY OK: depth=0, CN=server`
`Fri Sep 11 17:42:12 2020 OpenSSL: error:141F0006:SSL routines:tls_construct_cert_verify:EVP lib`
`Fri Sep 11 17:42:12 2020 TLS_ERROR: BIO read tls_read_plaintext error`
`Fri Sep 11 17:42:12 2020 TLS Error: TLS object -> incoming plaintext read error`
`Fri Sep 11 17:42:12 2020 TLS Error: TLS handshake failed`
`Fri Sep 11 17:42:12 2020 SIGUSR1[soft,tls-error] received, process restarting`
`Fri Sep 11 17:42:12 2020 Restart pause, 5 second(s)`

:::

In some reported cases it does not prompt for a PIN on the terminal. One workaround would be to use to use this command to login with the PIN:

```bash 
$ telnet 8888 password 'User PIN (OpenPGP card) token' <PIN>
```
Alternatively, you could [recompile OpenVPN](https://forums.openvpn.net/viewtopic.php?t=23318) client with systemd support disabled, and it will prompt you for the PIN as expected. 

Another option, would be to login to your OpenVPN instance with the Viscosity client which provides a better user experience especially for entering the PIN. 
