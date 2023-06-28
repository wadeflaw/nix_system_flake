{ inputs
, pkgs
, lib
, ...
}: {
  imports = [
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    swww
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hypr-contrib.packages.${pkgs.system}.hyprprop
    hyprpicker
    rofi-wayland
    wlogout
    grim
    slurp
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    xdg-utils
    plasma5Packages.kwallet
    brightnessctl
    polkit
    mate.mate-polkit
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
    "hypr/hyprland.conf".source = ./config/hyprland.conf;
    "hypr/binds.conf".source = ./config/binds.conf;
    "hypr/rules.conf".source = ./config/rules.conf;
    "hypr/autostart".source = ./config/autostart;
    "hypr/themes/mocha.conf".source = ./config/mocha.conf;
    "hypr/themes/screenShader.frag".source = ./config/screenShader.frag;
    "hypr/scripts".source = ./config/scripts;
  };
}
