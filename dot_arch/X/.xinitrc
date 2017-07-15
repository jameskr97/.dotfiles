# Set display to proper resolution 
xrandr --output DVI-D-2 --mode 1920x1080 # Center
xrandr --output DVI-D-1 --right-of DVI-D-2 --mode 1920x1080 # Rightmost
xrandr --output HDMI-1 --left-of DVI-D-2 --mode 1920x1080 # Leftmost

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # Load Xresources
[[ -f ~/.fehbg ]] && ~/.fehbg # Set wallpaper

# Run bspwm
exec bspwm
