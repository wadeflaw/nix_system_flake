{pkgs, ...}: {
  imports = [
    ./shell
    ./neofetch
    ./zellij
    ./zathura
    ./nvim
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
  ];
}
