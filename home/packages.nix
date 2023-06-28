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

    #! cli
    kitty
    wget
    unzip
    calc
    git
    btop
    fzf
    timer
    libnotify
    lolcat
    zathura

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
