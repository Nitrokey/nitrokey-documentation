# Automatic Screen Lock at Removal 

This guide will walk you through the configuration of your computer, to automatically lock your session when you remove the Nitrokey.

The configuration requires the creation of two files under two different directories. 

### Requirements

- Ubuntu 20.04 or Debian 10 (Buster), both with [Gnome Display Manager](https://wiki.gnome.org/Projects/GDM) installed. 
- Nitrokey Pro 2, Nitrokey Storage 2, or Nitrokey HSM 2

## Configuration

#### Create the `.rules` file

Go to `/etc/udev/rules.d` 
```bash
$ cd /etc/udev/rules.d
```
With your favorite text editor create a file called `85-nitrokey.rules`

```bash
$ sudo editor 85-nitrokey.rules
```
Add the following line to the file

```bash
ACTION=="remove", ENV{PRODUCT}=="20a0/4108/101" RUN+="/usr/local/bin/gnome-screensaver-lock"
```
Save the file and quit the editor. 

This file sets up a new hardware rule that executes the `gnome-screensaver-lock` at removal of the Nitrokey device. 

You should change the configuration according to the device you are using as following:

```
Nitrokey Pro: `ENV{PRODUCT}=="20a0/4108/101"`
Nitrokey HSM: `ENV{PRODUCT}=="20a0/4230/101"`
Nitrokey Storage: `ENV{PRODUCT}=="20a0/4109/101"`
```
#### Create the `gnome-screensaver-lock` script

Go to `/usr/local/bin`
```bash
$ cd /usr/local/bin
```
With your favorite text editor create a file called `gnome-screensaver-lock`
```bash
$ sudo editor gnome-screensaver-lock
```
Add the following file
```bash
user=`ps axo user:30,comm | egrep "gdm-(wayland|x)" | awk '{print $1}'`

if [ -n $user ]; then
        su $user -c "/usr/bin/dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock"
fi
```
In the first step, this script looks for the user-name of the gnome session, i.e. `user`.

When it is called at Nitrokey removal, the script queries `user`, switches to its session, and locks the screen by prompting the screen-saver screen.         

#### Execute the script

Once all set up, execute the script once, and it will lock the screen. It does not matter if the Nitrokey is plugged or not for this first execution.

## Usage 

By now you can log back to your session by entering your password, and (re)plug you Nitrokey if you did not do it before.

The next time(s) you unplug your Nitrokey from the computer, it will automatically lock the screen. 

