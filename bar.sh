#!/bin/bash

# OPTIONS
WIDTH=""
HEIGHT="24"

BDWIDTH="5"

BGCOLOR="#1D1D1D"
FGCOLOR="#FFAC00"
BDCOLOR="#D89200"

# functions

get_workspace() {
    glyph="\ue135"
    ws_name="$(i3-msg -t get_workspaces | python wsbar 2>/dev/null)"
    echo "%{B#FFAC00}%{F#1D1D1D} $glyph $ws_name  %{B-}%{F-}%{O20}"
}

get_current_song() {
    glyph="\ue1a6"
    current_song="$(ncmpcpp --current-song="%t - %a - %b" 2>/dev/null)"
    if [[ ! -z "$current_song" ]]; then
        echo "$glyph  %{F#FFF}$current_song%{F-}"
    fi
}

get_network() {
    glyph="\ue046"
    network="$(iwgetid -r)"
    if [[ -z "$network" ]]; then
        echo "\ue21b %{O10}"
    else
        echo "$glyph %{F#FFF}$network%{F-}%{O15}" 
    fi
}

get_battery() {
    current_cap=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    if [[ "$status" == "Discharging" ]]; then
        glyph="\ue20f"
    else
        glyph="\ue20e"
    fi
    echo "$glyph %{F#FFF}$current_cap%{F-} %{O5}"
}

get_volume() {
    current_volume=$(amixer get Master |
                            grep -E -o "[0-9]+%" |
                            tail -n 1 | tr -d '%')
    
    if [[ ! -z $(amixer get Master | grep -o "off") ]]; then
        glyph="\ue052"
    else
        glyph="\ue050"
    fi
    echo "$glyph %{F#FFF}$current_volume%{F-}%{O15}"
}

get_time() {
    glyph="\ue0a3"
    echo "%{F#FFAC00}$glyph %{F#FFF}$(date +"%H:%M:%S")%{F-}%{O15}"
}

get_date() {
    glyph="\ue225"
    echo "%{B#FFAC00}%{F#000}  $glyph $(date +"%A, %b %d")  %{B-}"
}


draw() {
    while true; do
        left="%{l}$(get_workspace)$(get_current_song)"
        center="%{c}$(get_time)"
        right="%{r}$(get_battery)$(get_volume)$(get_network)$(get_date)"
        echo -e "%{S0}$left$right$center%{S1}$left$right$center"
        sleep 1s;
    done
}

main() {
    draw | lemonbar -g "${WIDTH}x${HEIGHT}"    \
                    -B "$BGCOLOR"              \
                    -F "$FGCOLOR"              \
                    -U "$BDCOLOR"              \
                    -u "$BDWIDTH"              \
                    -f "-Wuncon-Siji-Medium-R-Normal--10-100-75-75-C-80-ISO10646-1" \
                    -f "ProFont:size=10"
}


if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    printf "%s\n" "The status bar is already running." >&2
    exit 1
fi

main
