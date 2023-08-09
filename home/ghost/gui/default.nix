{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./firefox
    ./telegram
    ./webcord
    ./apps
    ./wms
    ./rofi
    ./xdg
  ];

  home.packages = with pkgs; [
    # (inputs.wrapper-manager.lib.build {
    #   inherit pkgs;
    #   modules = [
    #     (import ./telegram)
    #   ];
    # })
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
