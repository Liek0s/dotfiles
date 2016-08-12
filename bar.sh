#!/bin/bash

# OPTIONS
WIDTH=""
HEIGHT="28"
FONT=""

BDWIDTH="5"

BGCOLOR="#1F1F1F"
FGCOLOR="#FFAC00"
BDCOLOR="#D89200"

# functions

# get_current_active_window() {
    
# }

get_user() {
    echo "%{B#333333}%{O10} \ue1f0 $USER %{O10}%{B-}"

}

get_workspaces() {
    local workspaces="%{O15}"
    while read -r workspace; do
        set -f
        glyph="\ue1bc"
        array=($workspace)
        if [[ ${array[1]} = "*" ]]; then
            glyph="\ue1c2"
        fi
        workspaces=$workspaces"$glyph%{O5}"
        unset -f
    done < <(wmctrl -d) && echo $workspaces
}

get_battery() {
    glyph=""
    current_cap=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(cat /sys/class/power_supply/BAT0/status)
    if [[ status -eq 'Discharging' ]]; then
        glyph="\ue239"
    elif [[ current_cap -lt 25 ]]; then
        glyph="\ue236"
    elif [[ current_cap -gt 25 && current_cap -lt 50 ]]; then
        glyph="\ue237"
    else
        glyph="\ue238"
    fi
    echo "$glyph $current_cap% %{O15}"
}

get_volume() {
    current_volume=$(amixer get Master |
                            grep -E -o "[0-9]+%" |
                            tail -n 1 | tr -d '%')
    
    is_mute=$(amixer get Master | grep -o "off")

    if [[ ! -z $is_mute ]]; then
        glyph="\ue052"
    elif [[ current_volume -gt 50 ]]; then
        glyph="\ue050"
    else
        glyph="\ue051"
    fi
    echo "$glyph $current_volume%{O20}"
}

get_time() {
    glyph=""
    echo "\ue151 $(date +"%H:%M")%{O25}"
}

get_date() {
    glyph=""
    echo "%{B#333333}  \ue266 $(date +"%A, %b %d")  %{B-}%{O10}"
}


draw() {
    while true; do
        echo -e \
             "%{Sf}%{l}$(get_user)%{c}$(get_workspaces)%{r}$(get_volume)$(get_battery)$(get_date)$(get_time)" \
             "%{Sl}%{l}$(get_user)%{c}$(get_workspaces)%{r}$(get_volume)$(get_battery)$(get_date)$(get_time)"
        sleep 1s;
    done
}

main() {
    draw | lemonbar -g "${WIDTH}x${HEIGHT}"    \
                    -B "$BGCOLOR"              \
                    -F "$FGCOLOR"              \
                    -U "$BDCOLOR"              \
                    -u "$BDWIDTH"              \
                    -f "-ypn-envypn-medium-r-normal--13-130-75-75-c-90-iso8859-1"  \
                    -f "-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1"

}

main
