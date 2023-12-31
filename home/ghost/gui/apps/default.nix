{ inputs
, pkgs
, ... 
}: {
  imports = [

    ./games
    ./browsers
    ./messaging
    ./note_taking
    # ./spotify
  ];

  home.packages = with pkgs; [
    gimp
    vscodium
    # plasma5Packages.kamoso
    deluge-gtk
    # transmission-gtk

    # tor-browser-bundle-bin
    # mullvad-browser
    keepassxc
    gparted
    pavucontrol
    distrobox
    # cinnamon.nemo
    # obs-studio
    mpv
  ];
}
