{
  config,
  # pkgs,
  ...
}: {
  programs.waybar = {
    systemd.enable = true;
    enable = true;
    style = import ./style.nix {inherit config;};
  };

  xdg.configFile = {
    "waybar/config".text = import ./config.nix {inherit config;};
    # TODO font config
  };
}
