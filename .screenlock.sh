#!/bin/bash

# Take a screenshot of the screen
scrot /tmp/screen.png

# Create the pixel effect on the screenshot
convert -scale 10% -scale 1000% /tmp/screen.png /tmp/screen.png

# Pause Spotify
sp pause

# Turn on i3lock program with the screenshot as background
i3lock -i /tmp/screen.png

# Remove the screeshot when login
rm /tmp/screen.png
