# Play a sound on notification

*doc by Adrien CARBONARO - 16/01/2018*

## canberra-gtk-play

`canberra-gtk-play` can play a sound event. It can be usefull to play a sound on notification with dunst or when a script is finished with success.

## Sound location

Sounds are located in `/usr/share/sounds/freedesktop/stereo`.
You can symlink a file in an other location. example:

```bash
sudo ln -s /usr/share/sounds/freedesktop/stereo/message.oga /home/you/my_sound.oga
```

Some sounds are included in `sounds/`

## Example

With `-i`, `canberra-gtk-play` will search in `/usr/share/sounds/freedesktop/stereo`.

```bash
canberra-gtk-play -i bell
canberra-gtk-play -i message
canberra-gtk-play -i audio-volume-change
canberra-gtk-play -i screen-capture
canberra-gtk-play -i power-plug
canberra-gtk-play -i complete
canberra-gtk-play -i device-added
canberra-gtk-play -i device-added
```

With `-f`, `canberra-gtk-play` will search a specific file.

```bash
canberra-gtk-play -f /home/you/my_sound.oga
```

