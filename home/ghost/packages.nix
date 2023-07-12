{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # desktop
    keepassxc
    gparted
    gtklock
    pavucontrol
    librewolf-wayland
    cinnamon.nemo
    steam
    telegram-desktop
    webcord
    gajim
    transmission-gtk
    libreoffice-fresh
    element-desktop-wayland

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
