# Tutos Raspberry Pi

## Lancer un programme automatiquement au démarrage

### Crée l'executable compatibe RPi (en C)

On crée le programme grâce à Sublime Text sur la machine principale (ordinateur).
On le compile grâce au cross-compiler *arm-linux-gnueabi-gcc*
Pour l'installer : `sudo apt-get install arm-linux-gnueabi-gcc`

### Se connecter à la carte RPi pour copier l'executable

On se connecte à la RPi en utilisant `ssh pi@192.168.x.x` (192.168.x.x étant l'adresse IP de la carte sur le réseau local).
La carte demande un mot de passe (par défaut raspberry). S'il est correct le nom sur le terminal change et passe de `utilisateur@Ordinateur` à `pi@raspberry`

### Copier le fichier executable sur la carte RPi

avec la fonction `scp` (copie par ssh) : `scp [executable] pi@192.168.x.x:nom_executable_sur_la_carte`

À Partir d'ici, on peut executer le programme sur la RPi.
Maintenant il faut le rendre executable au boot, c'est à dire au démarrage de la carte.

### Configurer la carte RPi pour executer le programme au boot

Le dossier gérant les programmes au démarrage est `/etc/init.d`. Au démarrage, chaque programme contenu dans ce dossier est executé.
Le fichier `/etc/init.d/rc.local` va lancer le programme `/etc/rc.local`. On va donc modifier le programme `/etc/rc.local`.
Il faut placer l'execution du programme juste avant `exit 0`. Il suffit d'écrire le chemin vers le programme en vérifiant bien qu'il est executable et en vérifiant les droits d'executions.
On écrit donc `sudo /chemin/vers/le/programme`. Si le programme doit créer un fichier pour écrire dedans, il créera ce fichier en lui donnant les droits de root. Il faut donc écrire `sudo` avant l'execution du fichier pour avoir les droits de modifier ce fichier les prochaines fois.

Si le programme a besoin d'une connexion à internet, il faut que la carte aie le temps de se connecter au Wifi ou Ethernet pour que le programme s'execute correctement. Pour cela, il faut se rendre dans le panneau de configuration de la RPi en tapant `sudo raspi-config`. Ensuite il faut se rendre dans `boot options` et `wait for network at boot` et enfin on l'active en selectionnant `Yes`. La carte attendra de se connecter au Wifi pour lancer les programmes, notament le notre.

Si le programme est une boucle infinie (permettant à la carte d'être autonome), il faut ajouter le symbole `&` à la fin `sudo /chemin/vers/le/programme` pour indiquer au programme de faire un fork, c'est à dire de créer un processus parallel pour éviter que le fichier `rc.local` tourne infiniement sans atteindre le `exit 0`. Si c'est le cas le programme se stoppe sans executer notre programme.

### Liens

Cross compilation : 
- http://rco.fr.nf/index.php/2016/06/15/compilation-cross-compilation-et-astuces-pour-raspberry-pi-2/

Lancer programme au boot :
- http://www.pihomeserver.fr/2013/05/27/raspberry-pi-home-server-lancer-un-programme-automatiquement-au-demarrage/
- https://www.raspberrypi.org/forums/viewtopic.php?f=65&t=177807
- https://askubuntu.com/questions/299792/why-is-the-command-in-etc-rc-local-not-executed-during-startup