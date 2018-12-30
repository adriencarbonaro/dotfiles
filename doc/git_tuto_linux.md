# Git Tuto Linux

## Clone a repository on a local machine using SSH

Git allows to connect, pull, commit push on a repository without always log in in the terminal.

To make it work, you must add an SSH Key to the profile so Git recognise the machine.

### Generating a new SSH key

**1.** Open a terminal

**2.** Paste that text substituing the email address with your GitHub address : 

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

This creates a new ssh key, using the provided email as a label.

**3.** When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.

`Enter a file in which to save the key (/home/you/.ssh/id_rsa): [Press enter]`

**4.** At the prompt, type a secure passphrase. For more information, see "Working with SSH key passphrases". 

If it is just for personnal use or between friends, you don't really need a passphrase.

### Adding your SSH key to the ssh-agent

Before adding a new SSH key to the ssh-agent to manage your keys, you should have checked for existing SSH keys and generated a new SSH key.

**1.** Start the ssh-agent in the background.

```
eval "$(ssh-agent -s)"
Agent pid 59566
```

**2.** Add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace *id_rsa* in the command with the name of your private key file.

```
ssh-add ~/.ssh/id_rsa
```

**3.** Add the SSH Key to the GitHub client

You must add the public key in the client (file is `id_rsa.pub`).

https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/la-connexion-securisee-a-distance-avec-ssh