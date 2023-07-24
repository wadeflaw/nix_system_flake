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
    # ./terminals
    ./toolkits
  ];

  home.packages = with pkgs; [
    # wm
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hypr-contrib.packages.${pkgs.system}.hyprprop
    hyprpicker
    rofi-wayland
    wlogout
    grim
    swww
    slurp
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    xdg-utils
    plasma5Packages.kwallet
    brightnessctl
    polkit
    polkit_gnome
    gtklock
  ];
}
