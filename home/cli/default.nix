{pkgs, ...}: {
  imports = [
    ./shell
    ./neofetch
    ./zellij
    ./zathura
    # ./nvim/config
    ./btop
    ./cava
  ];

  # extra packages
  home.packages = with pkgs; [
    wget
    unzip
    calc
    git
    btop
    fzf
    timer
    libnotify
    lolcat
    neovim-tanish2002
  ];
}
