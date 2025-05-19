
# Set wallpaper before launching DWM
# feh --bg-scale ~/.config/wallpapers/skull.png &
feh --bg-fill ~/.config/wallpapers/earth.jpeg &

// Currently needs "upower" installed to work
update_status() {
    BATTERY=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}')
    
    # Get volume level using pactl
    VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
    MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    [[ "$MUTE" == "yes" ]] && VOLUME="Muted"

    DATE=$(date "+%a %I:%M %p")  # Example: Sun 07:45 PM
    xsetroot -name "Vol: $VOLUME | Bat: $BATTERY | $DATE"
}

# Run once immediately
update_status

# Listen for volume changes
pactl subscribe | while read -r event; do
    case "$event" in
        *"sink"*) update_status ;;
    esac
done &

# Update every full minute
while true; do
    sleep $((60 - $(date +%S)))
    update_status
done &  # Run in the background

# Enable tap-to-click
xinput set-prop "DELL0A6E:00 06CB:CE81 Touchpad" "libinput Tapping Enabled" 1

exec dwm  # Start DWM
