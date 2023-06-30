{ inputs
, pkgs
, ...
}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };

  xdg.configFile = {
    "waybar/mocha.css".source = ./mocha.css;
    "waybar/style.css".source = ./style.css;
    "waybar/config".source = ./config.jsonc;
  };
}
