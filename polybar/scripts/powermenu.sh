#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme="adrien/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""
yes=''
no=''

# Confirmation
confirm_cmd() {
    rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 325px;}' \
    -theme-str 'mainbox {children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {font: "Iosevka 1.3 25"; horizontal-align: 0.5;}' \
	-theme-str 'textbox {horizontal-align: 0.5;}' \
	-dmenu \
	-p 'Confirmation' \
	-mesg 'Are you Sure ?' \
	-theme ${dir}/${theme}
}

confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == $yes ]]; then
            systemctl poweroff
		elif [[ $ans == $no ]]; then
			exit 0
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == $yes ]]; then
            systemctl reboot
		elif [[ $ans == $no ]]; then
			exit 0
        fi
        ;;
    $lock)
		sl
        ;;
    $suspend)
		scr_sleep
		;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == $yes ]]; then
            i3-msg exit
		elif [[ $ans == $no ]]; then
			exit 0
        fi
        ;;
esac

