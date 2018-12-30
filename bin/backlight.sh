#!/bin/sh

#-----------------------------------------------------------
# AUTHOR        : Adrien CARBONARO
# DATE          : 17/10/2018
# DESCRIPTION   : Increase/Decrease keyboard backlight
# PARAMETERS    : $1 : backlight intensity
#                 "inc" -> increase, dec -> "decrease"
# RETURN        : 0
#-----------------------------------------------------------

INTENSITY=$(cat /sys/class/leds/smc::kbd_backlight/brightness)

if [ $# != 0 ]
then
    if [ $1 = "inc" ]
    then
        INTENSITY=$((INTENSITY+10))
        echo $INTENSITY
    elif [ $1 = "dec" ]
    then
        INTENSITY=$((INTENSITY-10))
        echo $INTENSITY
    else
        INTENSITY=$INTENSITY
        echo $INTENSITY
    fi

fi

echo $INTENSITY > "/sys/class/leds/smc::kbd_backlight/brightness"
