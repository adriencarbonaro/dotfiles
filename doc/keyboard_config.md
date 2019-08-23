# Keyboard configuration

## GUI configuration

```bash
$ sudo dpkg-reconfigure keyboard-configuration
```

## Using localectl

```bash
$ localectl [--no-convert] set-x11-keymap layout [model [variant [options]]]
```

Example : 

```bash
$ localectl --no-convert set-x11-keymap cz,us pc104 ,dvorak grp:alt_shift_toggle
```

## setxkbmap

```bash
$ setxkbmap [-device device_id] [-layout layout] [-variant variant]
```

### Links

Arch Wiki : https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration
