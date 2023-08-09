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
    # ./gnome
    # ./vscode
  ];

  home.packages = with pkgs; [
    # (inputs.nix-gaming.packages.${pkgs.system}.osu-stable.override {
    #   # wine = inputs.nix-gaming.packages.${pkgs.system}.wine-ge;
    #   wine = pkgs.wine-staging;
    #   location = "$HOME/.osu";
    # })
    gimp

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
