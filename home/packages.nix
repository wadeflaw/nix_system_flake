{ inputs
, pkgs
, chaotic
, ...
}: {
  home.packages = (with pkgs; [

    gparted
    # desktop
    keepassxc
    gtklock
    pavucontrol
    firedragon
    steam
    telegram-desktop
    gajim
    transmission-gtk
    libreoffice-fresh

    # media
    mpv
    mpvpaper
    playerctl
    imv
    ffmpeg
    yt-dlp

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
  ] ++ [
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
  ]);
}
