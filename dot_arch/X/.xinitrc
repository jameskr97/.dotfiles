# Set display to proper resolution (this is VM specific though...)
xrandr --output Virtual-1 --mode 1440x900 &

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources # Load Xresources
[[ -f ~/.fehbg ]] && ~/.fehbg # Set wallpaper

# Run i3
exec i3
