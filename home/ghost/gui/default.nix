{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./imv
    ./apps
    ./wms
    ./rofi
    ./xdg
  ];

  home.packages = with pkgs; [
    gimp
    plasma5Packages.kamoso
    deluge-gtk

    # tor-browser-bundle-bin
    # mullvad-browser
    keepassxc
    gparted
    pavucontrol

    # TODO
    # ayuagram
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
