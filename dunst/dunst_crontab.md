# Send desktop notifications with cron

[*Article from Christophe Vu-Brugier - 27-03-2015*](https://www.enodev.fr/posts/send-desktop-notifications-with-cron.html)

At work, I tend to check my mailbox too often. That's unnecessary. As an experiment, I have decided to check it once every hour. Since I don't want to spend "brain cycles" remembering when I should check my mailbox, I have added a cron task to display a notification every hour.

Desktop notifications on Linux can be displayed with a command line utility named `notify-send`:

```bash
$ notify-send "Hi ${USER}!" "it's time to check your email." --icon=dialog-information
```

The notification is displayed by the notification server which is either part of your desktop environment or standalone. I personally use `dunst` because my window manager, `i3`, has no built-in notification server.

However, when notify-send is invoked by `cron`, nothing is displayed. The script invoked by `cron` cannot communicate with the desktop environment because the `DBUS_SESSION_BUS_ADDRESS` variable is not set.

As a consequence, you have to retrieve the value of the `DBUS_SESSION_BUS_ADDRESS` for your session. You can do that by parsing the `/proc/$PID/environ` pseudo file of your window manager (`i3` in my case):

```bash
$ grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pidof i3)/environ | cut -d= -f2-
unix:abstract=/tmp/dbus-ajRnZ5v7g9,guid=f8761603e1845a282e104e1a5515bcec
```

I wrote the following shell script named remind-email to grab the bus address of the D-Bus session and display a desktop notification:

```bash
#!/bin/sh

export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pidof i3)/environ | cut -d= -f2-)
notify-send "Hi ${LOGNAME}!" "it's time to check your email." --icon=dialog-information
```

The script is invoked every hour by the following cron entry (use `crontab -e` to edit your cron tables):

```bash
0 * * * * /home/foo/bin/remind-email
```

