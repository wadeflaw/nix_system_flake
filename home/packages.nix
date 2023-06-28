{ inputs
, pkgs
, chaotic
, ...
}: {
  # imports = [ chaotic.nixosModules.default ];

  home.packages = (with pkgs; [
    #! desktop
    #   chromium
    #   ungoogled-chromium
    google-chrome-beta
    keepassxc
    gtklock
    cinnamon.nemo
    pavucontrol
    gparted
    firedragon
    steam
    mousai
    #   kotatogram-desktop
    element-desktop
    telegram-desktop
    discord-canary
    spotify
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
    mpd
    ncmpcpp
    yt-dlp
    inputs.stable.legacyPackages."x86_64-linux".bat

    # image editor
    # rawtherapee
    # darktable
    # gimp

    #   font-manager
    # lxappearance
    # glib

  ] ++ [
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
  ]);
}
