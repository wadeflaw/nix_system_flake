{pkgs, ...}: {
  imports = [
    ./tools
    ./shell
    ./emulators
    ./editors
  ];

  # extra packages
  home.packages = with pkgs; [
    timer
    ripgrep
    exa
    bat
    slides
    wget
    unzip
    calc
    gnumake
    btop
    fzf
    libnotify
    lolcat
    socat
    neovim
    ffmpeg
    yt-dlp
    # playerctl
  ];
}
