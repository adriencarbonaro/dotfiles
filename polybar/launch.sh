#################################
# Polybar launch program
# Run by i3 at startup
#################################
# Author: Adrien CARBONARO
#################################

# Set random hex color
#random_color="#$(openssl rand -hex 3)"
random_color="#88FF88"

# Export label for wifi because %{F#AABBCC}text%{F-}
# is not possible inside polybar config
export BAR_MODULE_LABEL="%{F$random_color}%essid%%{F-} %local_ip% "

# Export polybar accent color for icons and wifi name
# Color is set randomly in this script
export POLYBAR_ACCENT_COLOR=$random_color


# Launch carbo bar
polybar carbo
