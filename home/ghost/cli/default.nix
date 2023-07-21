{pkgs, ...}: {
  imports = [
    ./shell
    ./neofetch
    ./zellij
    ./zathura
    # ./tmux
    ./terminals
    ./nushell
    # ./nvim/config
    ./btop
    ./cava
  ];

  # extra packages
  home.packages = with pkgs; [
    ripgrep
    exa
    slides
    wget
    unzip
    calc
    gnumake
    git
    btop
    fzf
    timer
    libnotify
    lolcat
    socat
    neovim
  ];
}
