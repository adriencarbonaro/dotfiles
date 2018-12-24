#--------------------------------------------------------
# Polybar launch program
#--------------------------------------------------------
# Author: Adrien CARBONARO
#--------------------------------------------------------
# accent color for polybar is set in 
# * /etc/init.d/accent_color.sh
# * /bin/accent (present in git repo dotfiles)
#--------------------------------------------------------

# Terminate already runnning bars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch carbo bar
polybar carbo &

