#!/usr/bin/env bash

gnome-terminal --save-config=/home/benoit/bash_config

LINES=($(grep -n '\[Terminal' /home/benoit/bash_config | cut -d: -f1))
for ((i=0; i<$(grep '\[Terminal' /home/benoit/bash_config | wc -l); i++))
do
    TITLE=$(xprop -id $WINDOWID WM_NAME | sed -e 's/WM_NAME(STRING) = "//' -e 's/"$//';xdotool key ctrl+Page_Down;)
    sed -ri "$((${LINES[$i]}+$i))s/.*/&\nTitle=$TITLE/" /home/benoit/bash_config
done

