#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme="adrien/launcher.rasi"

rofi \
    -matching fuzzy \
    -no-lazy-grab \
    -show drun \
    -modi run,drun,filebrowser \
    -theme $dir/$theme

