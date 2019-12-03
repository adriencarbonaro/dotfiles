# Drive mount configuration

## `/etc/fstab`

In `/etc/fstab` you can specify disks by their **UUID** in order to mount them automatically. You must specify a disk UUID, a mountpoint (where to mount the drive) and options.

To get the drive's UUID, use `blkid` or `lsblk -f`.

### Example :

```bash
UUID=4821-0000  /media/adrien/tilde      vfat       nofail,rw,nosuid,nodev,relatime,uid=1000,gid=1000,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,showexec,utf8,flush,errors=remount-ro,uhelper=udisks2 0 0
```

This will mount device with *UUID 4821-0000* in `/media/adrien/tilde`.

### Options :

**nofail** : At boot time, if the drive is not present, no error shall be thrown and the computer can boot normally.
**rw** : Read / Write permission.
**uid=1000, gid=1000** : Specify the user priviledges to the first user (1000 means the first user created, so the owner of the computer).

#### Links

- https://wiki.archlinux.org/index.php/Fstab
- https://askubuntu.com/questions/14365/mount-an-external-drive-at-boot-time-only-if-it-is-plugged-in
