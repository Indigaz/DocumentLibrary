# BeltonM&C - Communication with Remote *nix Servers

Mac, Linux, and Unix computers all use a similar POSIX toolset.  This allows them to easily interface and communicate with each other.  M$ Windows is a different beast.  In this intro, we will go over how to interface with a remote Ubuntu (Linux-based distribution) server using both a *nix (short for Unix or Linux [Mac is Unix-based]) and Windows computer.

`ssh` and PuTTY are both SSH clients.  SSH stands for "Secure Shell".  SSH clients connect to a remote machine and allow you to issue commands as if you were physically typing them on a keyboard attached to the remote machine.  *nix systems have the `ssh` client installed by default.  Windows users need to download the Putty SSH client.  Visit the [downloads page](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) on the PuTTY website and download the "Windows installer for everything except PuTTYtel" installer.

## Keypairs
We could use a password to authenticate ourselves to the remote server, but passwords are a weak form of security.  Besides, they are kind of lame.  We are going to use an encryption key instead.  Why?  Because encryption keys are super secure and also bad-ass.

Notice I said "pair".  That's wright, we are tecnically creating 2 keys: a public key and a private key.  The public key we will place on the remote server.  The private key we will keep on our computer AND GUARD WITH OUR LIFE!  Seriously, if soneone gets you private key, they essentially know your password.  That's like telling your x your password to your bank account...sorta.

### Creating a keypair on *nix
```bash
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -C "[your e-mail address here]"
# It will ask you what to name the key files; name them something identifiable like "beltonmc_rsa"
# It will ask you if you want to password protect your key; it is up to you; I do for keys to important stuff
```
Two files should have been created: `[whateverYouNamedYourKey]` and `[whateverYouNamedYourKey].pub`.  The `.pub` key is your public key.

### Creating a keypair on Windows
