# LAMP 
Serveur Linux contenant Apache, MySQL et PHP.
Installation sur machine UNIX directement (ordinateur sous Ubuntu par exemple) ou sur une carte Raspberry Pi.

## Installation des paquets de LAMP
Pour une installation avec MySQL :
- `sudo apt install apache2 php mysql-server libapache2-mod-php php-mysql`
Pour une installation avec MariaDB (équivalent MySQL plus ouvert, plus performant et 100% compatible avec MySQL) :
- `sudo apt install apache2 php mariadb-server libapache2-mod-php php-mysql`

## Installation des paquets PHP
La plupart des scripts PHP (CMS, forums, applications web en tout genre) utilisent des modules de PHP pour bénéficier de certaines fonctionnalités.
Voici comment installer les modules les plus courants :
`sudo apt install php-curl php-gd php-intl php-json php-mbstring php-mcrypt php-xml php-zip`

## Installation de phpMyAdmin
phpMyAdmin permet d'utiliser les bases de données avec une interface graphique.
Pour l'installer : 
`sudo apt-get install phpmyadmin`
Lors de l'installation, l'assistant vous propose de choisir un serveur `apache2`ou `lighttpd`. Choisissez `apache2`sauf si vous utilisez un serveur différent.
Il vous propose ensuite de choisir un mot de passe.
Vous pouvez à tout moment vous connecter à la base de données en superutilisateur en tapant `sudo mysql`.
Mais pour se connecter à phpMyAdmin, il vous faudra un autre utilisateur, que l'on appellera phpmyadmin.
Pour créer cet utilisateur et lui donner les droits d'accès aux tables de données, tapez d'abord `sudo mysql`pour vous connecter en tant que root.
Ensuite tapez `CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY 'root';` root etant le mot de passe.
Ensuite tapez `GRANT ALL PRIVILEGES ON * . * TO 'phpmyadmin'@'localhost';`.

Si vous n'arrivez pas à créer l'utilisateur et que vous avez une `ERREUR 1396`, tapez ces commandes :
```
drop user phpmyadmin@localhost;
flush privileges;
create user phpmyadmin@localhost identified by 'root'
```
L'utilisateur devrait être crée. Il vous suffit de taper dans un naviguateur `localhost/phpmyadmin` pour vous connecter et ensuite de taper vos identifiant que nous venons de créer.


Liens : 
https://doc.ubuntu-fr.org/lamp


# Auteur et mise à jour
**Adrien CARBONARO**
*20/01/2018 23:16*