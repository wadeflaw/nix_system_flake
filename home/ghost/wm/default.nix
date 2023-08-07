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
    ./x11.nix
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
    wl-clipboard
    # wf-recorder
    glib
    wayland
    xdg-utils
    brightnessctl
    polkit
    # locker
  ];
}
