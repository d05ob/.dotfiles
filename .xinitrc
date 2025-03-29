# Set wallpaper before launching DWM
feh --bg-scale ~/.config/wallpapers/skullt.png &

# Update status bar with battery and time
while true; do
    BATTERY=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')  # Get battery percentage

    DATE=$(date "+%Y-%m-%d %H:%M:%S")
    xsetroot -name "Bat: $BATTERY | $DATE"

    sleep 10
done &  # Run in the background

# for tap to click
xinput set-prop "DELL0A6E:00 06CB:CE81 Touchpad" "libinput Tapping Enabled" 1

exec dwm  # Start DWM

