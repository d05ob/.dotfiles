# Set wallpaper before launching DWM
feh --bg-scale ~/.config/wallpapers/skullt.png &

# Update status bar with battery and time
while true; do
    BATTERY=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')  # Get battery percentage

    DATE=$(date "+%Y-%m-%d %H:%M:%S")
    xsetroot -name "Bat: $BATTERY | $DATE"

    sleep 10
done &  # Run in the background

exec dwm  # Start DWM

