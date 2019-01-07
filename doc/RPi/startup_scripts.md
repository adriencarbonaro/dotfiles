# Execute a script at RPi startup.

## Introduction

The folder handling startup scripts is `/etc/init.d/`. At startup, each program in this folder is executed. The file `/etc/init.d/rc.local` will launch the script `/etc/rc.local`. We will work on this file for our script.

## Execution rights

Before executing our script, we must check its execution rights. The execution rights for a script must be at least `rwxr-xr-x` or in octal `755`. If the script isn't executable, type in `sudo chmod +x /path/to/script`.

## `/etc/rc.local`

**Warning : You must place the script path before `exit 0`**. Just type in the absolute path of the script : `sudo /path/to/script`. If the script must create a file during it's execution, he will create it with `root` rights, as it is the startup process that creates it. You have `sudo` before the script path so it has the rights to create and write to files.

## Internet connection

If the script needs an internet connection, we must let the RPi connect to internet before launching our script. To do that, type in `sudo raspi-config`. The go to `boot options` and `wait for network at boot`. The select `Yes`. The RPi will now wait until it is connected to internet to launch scripts.

## infinite loop script (while loop)

If the script is an infinite loop (allowing the RPi to be autonomous), add the symbol `&` at the end of the line `sudo /path/to/file`. That way, you indicate to `rc.local` that it must do a fork, which is a parallel process. It is needed to avoid `rc.local` running endlessly without reaching `exit 0`, which would break the boot process.

## Example `/etc/rc.local`

```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
 
# Our script.
/home/pi/bin/script &
 
exit 0
```
