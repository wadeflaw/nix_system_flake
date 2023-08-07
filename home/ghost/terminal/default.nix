{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./tools
    ./shell
    ./emulators
    ./editors
  ];

  # extra packages
  home.packages = with pkgs; [
    # invidtui
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
  programs.gpg.homedir = "${config.xdg.configHome}/gnupg";
}
