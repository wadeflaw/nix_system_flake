#!/usr/bin/env bash

cd $HOME

export _JAVA_AWT_WM_NONREPARENTING=1

export XCURSOR_SIZE=24

export XCURSOR_THEME=LyraQ-cursors

export XDG_CURRENT_DESKTOP=Hyprland

export XDG_SESSION_DESKTOP=Hyprland

export QT_AUTO_SCREEN_SCALE_FACTOR=1

export MOZ_ENABLE_WAYLAND=1

export MOZ_DBUS_REMOTE=1

export QT_QPA_PLATFORM="wayland-egl;xcb"

export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export QT_QPA_PLATFORMTHEME=qt5ct

export XDG_SESSION_TYPE=wayland

export WINIT_UNIX_BACKEND="wayland"

# export NO_AT_BRIDGE="1"

export SDL_VIDEODRIVER="wayland,x11"

export CLUTTER_BACKEND=wayland

export GDK_BACKEND="wayland,x11"

export gtksetted=0

export TERM="alacritty"
export BROWSER="firedragon"
export EDITOR="nvim"

# export GTK_USE_PORTAL=1

exec dbus-run-session Hyprland
