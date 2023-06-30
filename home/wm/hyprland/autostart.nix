{ pkgs
, lib
, ...
}: {
pkgs.writeShellScriptBin "autostart.sh" ''
#!/usr/bin/env bash

#function xdg_portal {
#       if [[ ! `pidof xdg-desktop-portal-hyprland` ]]; then
#               sleep 1
#               killall xdg-desktop-portal-hyprland
#               killall xdg-desktop-portal-wlr
#               killall xdg-desktop-portal
#               killall xdg-desktop-portal-gtk
#               /usr/lib/xdg-desktop-portal-hyprland &
#               sleep 2
#               /usr/lib/xdg-desktop-portal &
#       fi
#}

#xdg_portal &

        wl-paste --type text --watch cliphist store & #Stores only text data
        wl-paste --type image --watch cliphist store & #Stores only image data

        kwalletd5 &
        foot --server &

# wallpaper
        if [[ ! `pidof swww-daemon` ]]; then
                swww init &
        fi

# notification daemon
        if [[ ! `pidof dunst` ]]; then
                dunst &
        fi

# autentification agent
        if [[ ! `pidof polkit-gnome-authentication-agent-1` ]]; then
                /nix/var/nix/profiles/per-user/$USER/home-manager/home-path/libexec/polkit-gnome-authentication-agent-1 &
        fi

# sound
        if [[ ! `pidof pipewire` ]]; then
                pipewire &
        fi

        if [[ ! `pidof pipewire-pulse` ]]; then
                pipewire-pulse &
        fi

        if [[ ! `pidof wireplumber` ]]; then
                wireplumber &
        fi

#function launch_waybar {
#    waybar -c ~/.config/waybar_minimal/config.jsonc -s ~/.config/waybar_minimal/style.css
#}

        if [[ ! `pidof waybar` ]]; then
               waybar &
        fi

# mpd
        if [[ ! `pidof mpd` ]]; then
                mpd ~/.config/mpd/mpd.conf && mpDris2 -c ~/.config/mpDris2/mpDris2.conf &
        fi

# if [[ ! `pidof hyprland-per-window-layout` ]]; then
#         $HOME/.config/hypr/scripts/hyprland-per-window-layout &
# fi

# if [[ ! `pidof eww` ]]; then
#     eww -c ~/.config/eww daemon && eww -c ~/.config/eww open bar &
# fi

# desktop portal
# if [[ ! `pidof xdg-desktop-portal-wlr` ]]; then
#   /usr/lib/xdg-desktop-portal-wlr &
# fi

# syncthing
# if [[ ! `pidof syncthing` ]]; then
#         syncthing &
# fi
#
# themes
        notify-send "Hello ghost! 😈"
'';
}
