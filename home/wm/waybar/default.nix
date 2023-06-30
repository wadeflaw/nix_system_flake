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
  };

  xdg.configFile = {
    "waybar/mocha.css".source = ./mocha.css;
    "waybar/style.css".source = ./style.css;
    "waybar/config".source = ./config.jsonc;
  };
}
