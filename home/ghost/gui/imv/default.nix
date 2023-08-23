{config, ...}:
let
  inherit (config.colorscheme) colors;
in
{
  programs.imv = {
    enable = true;
    settings = {
      options.background = "#${colors.base00}";
      aliases.x = "close";
    };
  };
}
