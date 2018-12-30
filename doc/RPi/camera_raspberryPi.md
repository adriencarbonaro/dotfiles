# Surveillance Camera + motion detection with Raspberry Pi and IP Camera
This tuto helps install an IP Camera on Ethernet and manage it with Motion and a Raspberry Pi

## Installing Camera

**1.** Install the camera and configure it's IP to get it static.

**2.** Find the url of streaming

## Install Motion

First get your RPi up to date :
```
sudo apt-get update
sudo apt-get upgrade
```

Install Motion :
```
sudo apt-get install motion
```

## Configure Motion on the Raspberry Pi

To get sure that Motion is always working, edit the `/etc/default/motion` file and modify the line "start_motion_daemon" :
```
start_motion_daemon=yes
```

Then modify the `/etc/motion.conf` (if you don't find it, try `/etc/motion/motion.conf`) :
```
# Activate the daemon
daemon on
# Use /tmp/motion.log to store logs
logfile /tmp/motion.log
# Set the résolution (adapt the resolution to your camera's resolution)
width 1280
height 720
# Set the framerate, the number of images per second
framerate 2
# Set the number of images saved before and after a movement
pre_capture 2
post_capture 2
# Allow internet connection to the camera 
stream_localhost off
```

Now we have to recognise the camera on the network with the Raspberry. Normally, the camera IP is static now. If the camera is able to do RSTP streaming, find the link and enter it (example below): 

```
netcam_url rtsp://[IP ADDRESS]/live1.sdp/
``` 

It is the most difficult part of the tuto to find the netcam value because it depend a lot on the camera used and the manufacturer choice.

## Configure email alerts
Install `mutt` :

```
sudo apt-get install mutt
```

Create a file named `.muttrc` and edit it like this for a gmail client :

```
# Name of expeditor
set realname = "pi"

# Activate TLS if available on the server
set ssl_starttls=yes

# Always use SSL for connection to the server
set ssl_force_tls=yes

# Configuration of imap (Only if you want to be able to read emails on the Pi)
set spoolfile=imaps://imap.gmail.com:993/
set imap_user = "XXXXXXXX@gmail.com"
set imap_pass = "PASSWORD"

# Configuration SMTP
set smtp_url = "smtp://XXXXXXXX@gmail.com@smtp.gmail.com:587/"
set smtp_pass = "PASSWORD"
set from = "XXXXXXXX@gmail.com"
set use_envelope_from=yes

# Local info, date 
set locale="fr_FR" 
set date_format="%A %d %b %Y à %H:%M:%S (%Z)" 
set locale="iso-8859-15"
```

Change the permissions for the .muttrc file :

```
chown pi:pi .muttrc
chmod 600 .muttrc
```

Test :

```
echo 'It works !' | mutt -s 'Test' your_email_address
```

You should receive an email.

Go back in `/etc/motion/motion.conf` and type in this two lines :

to send an email when there is a movement :
```
on_event_start echo 'Alert' | mutt -s 'Detection alert %d/%m/%Y à %H:%M:%S' your_email_address
```

to send an email with the video of the movement at the end of it :
```
on_movie_end echo 'Captured video' | mutt -s 'Captured video for previous event' -a %f -- your_email_address
```


## Author & update
**Adrien CARBONARO** 30/04/2018 15:50

## Links

Motion :

- https://doc.ubuntu-fr.org/motion
- https://raspbian-france.fr/video-surveillance-raspberry-pi-camera/ 
- https://www.linux.com/learn/how-operate-linux-spycams-motion
- https://knowledge.parcours-performance.com/recapitulatif-raspberry-pi-motion-deux-cameras/

Mutt : 

- https://www.inzecloud.net/index.php/2014/11/30/raspberry-pi-camera-de-video-surveillance-recevoir-des-alertes-mails/