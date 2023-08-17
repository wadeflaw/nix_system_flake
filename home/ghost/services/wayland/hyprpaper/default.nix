{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  monitors = ["eDP-1"];

  hyprpaper = inputs.hyprpaper.packages.${pkgs.system}.default;
  wallpkgs = inputs.wallpkgs.packages.${pkgs.system};
in {
  config = lib.mkIf (config.wayland.windowManager.hyprland.enable) {
    systemd.user.services.hyprpaper = {
      Unit = {
        Description = "Hyprland wallpaper daemon";
        Requires = ["graphical-session.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe hyprpaper}";
        Restart = "on-failure";
      };
      Install.WantedBy = ["hyprland-session.target"];
    };
    xdg.configFile."hypr/hyprpaper.conf" = {
      text = let
        wallpaper = "${wallpkgs.catppuccin}/share/wallpapers/catppuccin/01.png";
      in ''
        preload=${wallpaper}
        ${builtins.concatStringsSep "\n" (builtins.map (monitor: ''wallpaper=${monitor},${wallpaper}'') monitors)}
        "eDP-1"
        ipc=off
      '';
    };
  };
}
