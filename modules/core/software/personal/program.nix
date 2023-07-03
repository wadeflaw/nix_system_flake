_: {
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    neovim.enable = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
    #   steam.enable = true;
  };
}
