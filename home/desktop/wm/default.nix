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
    ./terminals
    ./toolkits
  ];

  home.packages = with pkgs; [
    # wm
    swww
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hypr-contrib.packages.${pkgs.system}.hyprprop
    hyprpicker
    rofi-wayland
    wlogout
    grim
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
    mate.mate-polkit
  ];
}
