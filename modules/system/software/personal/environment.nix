{ pkgs
, conf
, inputs
, ...
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
  environment = {
    systemPackages = with pkgs; [
      git
      btrfs-snap
      wl-clipboard

      # not work if subvolumes name isn't start with @, ex: @ - /, @home - /home
      # timeshift
    ];
    # memoryAllocator.provider = "jemalloc";
    variables = {
      FLAKE_PATH = "${conf.fl_path}";
      __GL_THREADED_OPTIMIZATIONS = "1";
      mesa_glthread = "true";
    };
  };
}
