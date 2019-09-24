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
$ setxkbmap [-device device_id] [-model model] [-layout layout] [-variant variant]
```

To get `device_id`, use `xinput`.

```bash
$ setxkbmap -device 12 -model pc105 -layout fr
```

### Programs

In this dotfiles, use `bin/workkeyboard` or `bin/drevokeyboard` programs as examples to set specific keyboard each time you plug it.

### Links

Arch Wiki : https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration
