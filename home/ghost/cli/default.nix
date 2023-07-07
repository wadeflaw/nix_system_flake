{pkgs, ...}: {
  imports = [
    ./shell
    ./neofetch
    ./zellij
    ./zathura
    ./tmux
    ./terminals
    # ./nvim/config
    ./btop
    ./cava
  ];

  # extra packages
  home.packages = with pkgs; [
    ripgrep
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
    neovim
  ];
}
