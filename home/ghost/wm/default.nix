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
    ./xdg
    ./variables
  ];

  home.packages = with pkgs; [
    # wm
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hypr-contrib.packages.${pkgs.system}.hyprprop
    hyprpicker
    grim
    swww
    playerctl
    slurp
    cliphist
    # wf-recorder
    glib
    wayland
    xdg-utils
    brightnessctl
    polkit
    gtklock
  ];
}
