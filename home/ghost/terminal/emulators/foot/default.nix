{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  inherit (config.colorscheme) colors;
in {
  home.packages = with pkgs; [
    libsixel # for displaying images
  ];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        app-id = "foot";
        title = "foot";
        locked-title = "no";

        term = "xterm-256color";
        font = "JetBrainsMonoNL NF Medium:size=12";
        pad = "5x5";
        # dpi-aware = "yes";
        vertical-letter-offset = "-0.75";
        # notify = ''notify-send -a ''${app-id} -i ''${app-id} ''${title} ''${body}'';
      };
      colors = {
        # alpha = "0.85";
        foreground = "${colors.base05}"; # Text
        background = "${colors.base00}"; # Base

        regular0 = "${colors.base03}"; # Surface 1
        regular1 = "${colors.base08}"; # red
        regular2 = "${colors.base0B}"; # green
        regular3 = "${colors.base0A}"; # yellow
        regular4 = "${colors.base0D}"; # blue
        regular5 = "${colors.base0F}"; # pink
        regular6 = "${colors.base0C}"; # teal
        regular7 = "${colors.base06}"; # Subtext 0
        # Subtext 1 ???
        bright0 = "${colors.base04}"; # Surface 2
        bright1 = "${colors.base08}"; # red
        bright2 = "${colors.base0B}"; # green
        bright3 = "${colors.base0A}"; # yellow
        bright4 = "${colors.base0D}"; # blue
        bright5 = "${colors.base0F}"; # pink
        bright6 = "${colors.base0C}"; # teal
        bright7 = "${colors.base07}"; # Subtext 0
      };
      cursor = {
        style = "underline";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
