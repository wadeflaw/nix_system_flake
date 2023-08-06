{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hyprland
    ./waybar
    ./rofi
    ./dunst
    ./gtklock
    ./xdg
    ./variables
  ];

  home.packages = with pkgs; [
    # wm
    # screenshots
    grimblast
    swww
    slurp

    hyprprop
    hyprpicker
    grim
    playerctl
    cliphist
    # wf-recorder
    glib
    wayland
    xdg-utils
    brightnessctl
    polkit
    # locker
  ];
}
