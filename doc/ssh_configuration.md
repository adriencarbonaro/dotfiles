# SSH Configuration

## Generate SSH keypair

To generate a set of public/private keys, use this command :

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

This creates a new ssh key, using the provided email as a label.

```
Generating public/private rsa key pair.
```

When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.

```
Enter a file in which to save the key (/home/you/.ssh/id_rsa): [Press enter]
```

At the prompt, you can type a secure passphrase if you want to secure your local ssh location. If you are using your computer alone, you don't have to use a password. Just type [Enter] if you don't want to use a password. 

```
Enter passphrase (empty for no passphrase): [Type a passphrase]
Enter same passphrase again: [Type passphrase again]
```

## Connect to host (Github, Gitlab, RPi, Server) without password

### Github / Gitlab

In *Github* or *Gitlab*, you can add your **public** key in your personal settings. The file containing your public key is in `/home/you/.ssh/id_rsa.pub` unless you changed the default location.

**Warning** : Do never add your **private** key.

* https://github.com/settings/keys on *Github*.

* https://gitlab.com/profile/keys on *Gitlab*.

You will now be able to *clone*, *push* and *pull* without putting your password.

### Server (RPi, NAS)

You can add your public key to a NAS or a RPi like on Github / Gitlab. Just add the key from `/home/client/id_rsa.pub` to `/home/server/.ssh/authorized_keys`.

`client` is the computer you want to connect from and `server` is the NAS or RPi.
