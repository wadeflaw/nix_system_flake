{pkgs, ...}: {
  home.packages = with pkgs;
    [
      gparted
      # desktop
      keepassxc
      gtklock
      pavucontrol
      firedragon
      steam
      telegram-desktop
      webcord
      gajim
      transmission-gtk
      libreoffice-fresh

      # media
      mpv
      mpvpaper
      mousai
      playerctl
      imv
      ffmpeg
      yt-dlp
    ]
    ++ [
      # nur.repos.aleksana.gtkcord4
      # nur.repos.aleksana.go-musicfox
    ];
}
