{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # desktop
    spotify
    keepassxc
    gparted
    gtklock
    pavucontrol
    cinnamon.nemo
    steam
    telegram-desktop
    webcord
    discord
    gajim
    transmission-gtk
    libreoffice-fresh
    element-desktop-wayland
    obs-studio

    # media
    mpv
    mpvpaper
    mousai
    playerctl
    imv
    ffmpeg
    yt-dlp
    gimp
    inputs.unstable.legacyPackages.${pkgs.system}.bat
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
    nur.repos.ilya-fedin.kotatogram-desktop
  ];
}
