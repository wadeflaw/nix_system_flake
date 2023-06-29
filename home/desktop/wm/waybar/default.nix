{ inputs, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    package = inputs.stable.legacyPackages."x86_64-linux".waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };

  xdg.configFile = {
    "waybar/mocha.css".source = ./mocha.css;
    "waybar/style.css".source = ./style.css;
    "waybar/config".source = ./config.jsonc;
  };
}

