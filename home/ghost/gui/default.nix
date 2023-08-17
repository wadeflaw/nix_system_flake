{ pkgs
, inputs
, ...
}: {
  imports = [
    ./firefox
    ./telegram
    ./webcord
    ./spotify
    ./games
    ./apps
    ./wms
    ./rofi
    ./xdg
  ];

  home.packages = with pkgs; [
    gimp

    tor-browser-bundle-bin
    mullvad-browser
    keepassxc
    gparted
    pavucontrol
    # cinnamon.nemo
    steam
    obs-studio
    mpv
    imv
    logseq
    # invidtui
    # mpvpaper
    # mousai
    # spotify
    # discord
    gajim
    # transmission-gtk
    # libreoffice-fresh
    # element-desktop-wayland
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
  ];
}
