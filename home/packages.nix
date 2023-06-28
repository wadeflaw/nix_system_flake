{ inputs
, pkgs
, chaotic
, ...
}: {
  home.packages = (with pkgs; [
    #! desktop
    keepassxc
    gtklock
    pavucontrol
    firedragon
    steam
    telegram-desktop
    gajim
    transmission-gtk
    libreoffice-fresh

    #! media
    mpv
    playerctl
    imv
    ffmpeg
    yt-dlp
  ] ++ [
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
  ]);
}
