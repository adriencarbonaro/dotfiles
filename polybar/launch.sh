#------------------------------------------------------------
# POLYBAR - Status bar
#
# Polybar launch program
#
# accent color for polybar is set in 
# * /etc/init.d/accent_color.sh
# * /bin/accent (present in git repo dotfiles)
#
# Move this file to $HOME/.config/polybar/config
#------------------------------------------------------------
# Author:       Adrien CARBONARO
# Dotfiles :    www.github.com/adriencarbonaro/dotfiles.git
#------------------------------------------------------------

bar="carbo"

# Terminate already runnning bars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set monitor(s)
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload $bar &
    done
else
    polybar --reload $bar &
fi

