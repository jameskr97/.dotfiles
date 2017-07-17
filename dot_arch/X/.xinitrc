# Set display to proper resolution 
xrandr --output DVI-D-0 --mode 1920x1080 # Center
xrandr --output DVI-D-1 --right-of DVI-D-0 --mode 1920x1080 # Rightmost
xrandr --output HDMI-0 --left-of DVI-D-0 --mode 1920x1080 # Leftmost
xrandr --output Virtual-1 --mode 1440x900

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # Load Xresources
[[ -f ~/.fehbg ]] && ~/.fehbg # Set wallpaper
[[ -f ~/.config/polybar/launch.sh ]] && ~/.config/polybar/launch.sh # Run polybar
compton & # Run compton


# Run bspwm
exec bspwm
