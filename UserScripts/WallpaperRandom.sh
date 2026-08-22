#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for Random Wallpaper ( CTRL ALT W)

PICTURES_DIR="$(xdg-user-dir PICTURES 2>/dev/null || echo "$HOME/Pictures")"
wallDIR="$PICTURES_DIR/wallpapers"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
backend_helper="$SCRIPTSDIR/WallpaperBackend.sh"

# shellcheck source=~/.config/hypr/scripts/WallpaperBackend.sh
. "$backend_helper"

focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

mapfile -d '' PICS < <(find -L "${wallDIR}" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.pnm" -o -name "*.tga" -o -name "*.tiff" -o -name "*.webp" -o -name "*.bmp" -o -name "*.farbfeld" -o -name "*.gif" \) -print0)

if [[ ${#PICS[@]} -eq 0 ]]; then
  notify-send -i "$HOME/.config/swaync/images/error.png" "Wallpaper folder empty" "$wallDIR has no supported images"
  exit 1
fi

RANDOMPICS="${PICS[$((RANDOM % ${#PICS[@]}))]}"


# Transition config
FPS=30
TYPE="random"
DURATION=1
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"


wallpaper_ensure_daemon --format xrgb
wallpaper_img -o "$focused_monitor" "$RANDOMPICS" $SWWW_PARAMS

"$SCRIPTSDIR/WallustSwww.sh" &&
sleep 2
"$SCRIPTSDIR/Refresh.sh"
