# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */
# Script for YouTube Search
# Opens rofi in dmenu mode and searches YouTube

rofi_config="$HOME/.config/rofi/config-searchYoutube.rasi"

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
    exit 0
fi

# Open rofi with dmenu and pass the input to xdg-open for YouTube search
echo "" | rofi -dmenu -config "$rofi_config" -p "Search:" | xargs -I{} xdg-open "https://www.youtube.com/results?search_query={}"

