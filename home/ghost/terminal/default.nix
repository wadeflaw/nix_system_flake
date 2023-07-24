{pkgs, ...}: {
  imports = [
    ./shell
    ./tools
    ./neofetch
    ./zellij
    ./zathura
    # ./tmux
    ./emulators
    # ./nvim/config
    ./btop
    ./cava
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
  ];
}
