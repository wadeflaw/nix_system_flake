{
  pkgs,
  # inputs,
  ...
}: {
  home.packages = with pkgs; [
    # desktop
    # invidtui
    spotify
    keepassxc
    gparted
    gtklock
    pavucontrol
    cinnamon.nemo
    steam
    telegram-desktop
    webcord-vencord
    discord
    gajim
    transmission-gtk
    avidemux
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
    # inputs.unstable.legacyPackages.${pkgs.system}.bat
    # nur.repos.aleksana.gtkcord4
    # nur.repos.aleksana.go-musicfox
    nur.repos.ilya-fedin.kotatogram-desktop
  ];
}
