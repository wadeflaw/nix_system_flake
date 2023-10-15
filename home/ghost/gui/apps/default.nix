{ inputs, ... }: {
  imports = [
    inputs.schizofox.homeManagerModule

    ./games
    ./firefox
    # ./schizofox
    # ./spotify
  ];

  home.packages = with pkgs; [
    gimp
    vscodium
    plasma5Packages.kamoso
    deluge-gtk
    # transmission-gtk

    # tor-browser-bundle-bin
    # mullvad-browser
    keepassxc
    gparted
    pavucontrol
    distrobox
    # cinnamon.nemo
    obs-studio
    mpv
  ];
}
