{ pkgs
, inputs
, ...
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
    vscodium
    plasma5Packages.kamoso
    deluge-gtk

    # tor-browser-bundle-bin
    # mullvad-browser
    keepassxc
    gparted
    pavucontrol
    distrobox

    # TODO
    # ayuagram
    # cinnamon.nemo
    steam
    obs-studio
    mpv
    imv
    obsidian
    logseq
    # invidtui
    # mpvpaper
    # mousai
    # spotify
    # discord
    # gajim
    # transmission-gtk
    # libreoffice-fresh
    # element-desktop-wayland
  ];
}
