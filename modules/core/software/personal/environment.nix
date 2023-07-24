{
  pkgs,
  conf,
  ...
}: {
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    neovim.enable = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
  };
  environment.systemPackages = with pkgs; [
    btrfs-snap

    # not work if subvolumes name isn't start with @, ex: @ - /, @home - /home
    # timeshift
  ];
  environment.variables = {
    FLAKE_PATH = "${conf.fl_path}";
    __GL_THREADED_OPTIMIZATIONS = "1";
    mesa_glthread = "true";
  };
}
