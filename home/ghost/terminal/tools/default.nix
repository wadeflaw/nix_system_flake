{pkgs, ...}: {
  imports = [
    # ./run-transient-services.nix
    ./git.nix
    ./direnv.nix
    ./neofetch
    ./zellij
    ./btop
    ./cava
    ./zathura
    # ./zoxide
  ];
    # extra packages
  home.packages = with pkgs; [
    # invidtui
    timer
    ripgrep
    eza
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
    ffmpeg
    yt-dlp
    # playerctl
  ];
}
