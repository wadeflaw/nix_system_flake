{pkgs, ...}: {
  imports = [
    ./telegram
    ./firefox
  ];

  home.packages = with pkgs; [
    gimp
    keepassxc
    gparted
    pavucontrol
    cinnamon.nemo
    steam
    telegram-desktop
    webcord-vencord
    obs-studio
    nur.repos.ilya-fedin.kotatogram-desktop
    mpv
    imv
    # invidtui
    # mpvpaper
    # mousai
    # spotify
    # discord
    # gajim
    # transmission-gtk
    # libreoffice-fresh
    # element-desktop-wayland
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
  ];
}
