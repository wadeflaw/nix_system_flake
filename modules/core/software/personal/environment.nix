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
    #   steam.enable = true;
  };
  environment.systemPackages = with pkgs; [
    btrfs-snap
    timeshift
  ];
  environment.variables = {
    FLAKE_PATH = "${conf.fl_path}";
    BROWSER = "firefox";
    __GL_THREADED_OPTIMIZATIONS = "1";
    mesa_glthread = "true";
  };
}
