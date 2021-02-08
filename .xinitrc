# set Last Background
nitrogen --restore &

#brightness
xrandr --output eDP1 --brightness .7 --scale 1.0x1.0 &
redshift-gtk -O 5000 -g .8 &

xrdb ~/.Xresources &

mpd &

#### Trackpad
modprobe -r usbmouse &
modprobe bcm5974 &

# set en,ar keymap
setxkbmap -layout us,ar 
# alt+shift switch keymap
setxkbmap -option 'grp:alt_shift_toggle' &

dunst &
//xcompmgr &
// Android Studio
export _JAVA_AWT_WM_NONREPARENTING=1

dwm
