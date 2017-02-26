#!/bin/bash
## Settings ##

fifo="/tmp/panel.fifo"

dimensions="x24"
fg_color="#FFFFFF"
bg_color="#1D1D1D"
font="ProFont"
icon_font="-Wuncon-Siji-Medium-R-Normal--10-100-75-75-C-80-ISO10646-1"
font_size="10"

##########
## Init ##
##########

if [ "$(pgrep -cx lemonbar)" -gt 0 ]; then
    printf "%s\n" "Panel is already running." >&2
    exit 1;
fi

# TODO - check dependecies

printf "Creating FIFO in %s\n" "$fifo" >&2
[ -e "$fifo" ] && rm -f "$fifo"
mkfifo "$fifo"

###############
## Functions ##
###############
get_workspace() {
    glyph="\ue135"
    ws_name=$(i3-msg -t get_workspaces |
        jq '.[] | select(.focused==true) | .name' |
        sed -e 's/^"//' -e 's/"$//')
    echo "workspace:%{B#FFAC00}%{F#000} $glyph $ws_name  %{B-}%{F-}%{O20}"
}

get_song() {
    glyph="\ue1a6"
    current_song=$(ncmpcpp --current-song="%t - %a - %b" 2>/dev/null)
    if [[ ! -z "$current_song" ]]; then
        echo -e "song:%{F#FFAC00}$glyph%{F-} $current_song %{O10}"
    fi
}

get_network() {
    network="$(iwgetid -r)"
    [ -z "$network" ] && glyph="\ue046" || glyph="\ue046"
    # TODO handle ethernet connection
    echo -e "network:%{F#FFAC00}$glyph%{F-} $network %{O10}"
}

get_battery() {
    current=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    [ "$status" == "Discharging" ] && glyph="\ue20f" || glyph="\ue20e"
    echo -e "battery:%{F#FFAC00}$glyph%{F-} $current %{O5}"
}

get_volume() {
    current_volume=$(amixer get Master |
                            grep -E -o "[0-9]+%" |
                            tail -n 1 | tr -d '%')
    is_mute=$(amixer get Master | grep -o "off")
    [ -z "$is_mute" ] && glyph="\ue050" || glyph="\ue052"
    echo "volume:%{F#FFAC00}$glyph%{F-} $current_volume%{O15}"
}

get_date() {
    glyph="\ue225"
    current_date=$(date +"%A, %b %d")
    echo -e "date:%{B#FFAC00}%{F#000} $current_date $glyph %{B-}%{F-}"
}

get_time() {
    glyph="\ue0a3"
    current_time=$(date +"%H:%M")
    echo -e "time:%{F#FFAC00}$glyph%{F-} $current_time"
}

##################
## Subprocesses ##
##################

while :; do get_workspace; sleep 0.5s; done > "$fifo" &
while :; do get_volume; sleep 1s; done > "$fifo" &
while :; do get_song; sleep 2s; done > "$fifo" &
while :; do get_battery; sleep 30s; done > "$fifo" &
while :; do get_date; sleep 1m; done > "$fifo" &
while :; do get_time; sleep 30s; done > "$fifo" &
while :; do get_network; sleep 40s; done > "$fifo" &

##################
## Draw the bar ##
##################
while read -r line; do
    case $line in
        time:*)
            current_time=${line:5}
            ;;
        date:*)
            current_date=${line:5}
            ;;
        volume:*)
            volume=${line:7}
            ;;
        battery:*)
            battery=${line:8}
            ;;
        network:*)
            network=${line:8}
            ;;
        song:*)
            song=${line:5}
            ;;
        workspace:*)
            workspace=${line:10}
            ;;
        *)
            ;;
    esac 
    echo -e \
        "%{S1}%{l}${workspace}${song}" \
        "%{c}${current_time}" \
        "%{r}${battery}${volume}${network}${current_date}"

done < "$fifo" | lemonbar \
    -g "$dimensions" \
    -f "$icon_font" \
    -f "$font:size=$font_size" \
    -B "$bg_color" \
    -F "$fg_color" | bash; exit

