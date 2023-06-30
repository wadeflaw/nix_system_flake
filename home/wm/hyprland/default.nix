{ inputs
, pkgs
, lib
, ...
}: {
  imports = [
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
  };

  xdg.configFile = {
    "hypr/hyprland.conf".source = ./hyprland.conf;
    "hypr/binds.conf".source = ./binds.conf;
    "hypr/rules.conf".source = ./rules.conf;
    "hypr/autostart".source = ./autostart;
    "hypr/themes/mocha.conf".source = ./mocha.conf;
    "hypr/themes/screenShader.frag".source = ./screenShader.frag;
    "hypr/scripts".source = ./scripts;
  };
}
