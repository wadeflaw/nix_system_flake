{ pkgs, inputs, ... }: {
  programs = {
    dconf.enable = true;
    nm-applet.enable = true;
    zsh.enable = true;
    neovim.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
    #   steam.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wireguard-tools
    home-manager
    unzip
  ];
}

