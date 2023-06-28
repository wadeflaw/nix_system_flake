#!/bin/env sh
export HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '2p' | awk '{print $2}')
    if [ $HYPRGAMEMODE = 1 ]; then
        hyprctl --batch "\
            keyword animations:enabled 0;\
            keyword decoration:drop_shadow 0;\
            keyword decoration:blur 0;\
            keyword general:gaps_in 0;\
            keyword general:gaps_out 0;\
            keyword general:border_size 1;\
            keyword decoration:rounding 0"
        hyprctl notify -1 5000 "rgb(f5c2e7)" "Gamemode enabled. ^"
        exit
        else if [ $HYPRGAMEMODE = 0 ] ; then
        hyprctl notify -1 5000 "rgb(f5c2e7)" "Gamemode disabled. ^" 
        fi
    fi
hyprctl reload

