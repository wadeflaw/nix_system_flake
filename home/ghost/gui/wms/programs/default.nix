{pkgs, ...}:{
  imports = [
    ./rofi
    ./imv
  ];
  
  home.packages = with pkgs; [
    # wm
    # screenshots
    grimblast
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
