{
  lib,
  pkgs,
  ...
}:
# with lib; let
#   inherit (config.colorscheme) colors;
# in
{
  xdg.configFile."zathura/catppuccin-mocha".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/zathura/main/src/catppuccin-mocha";
    hash = "sha256-/HXecio3My2eXTpY7JoYiN9mnXsps4PAThDPs4OCsAk=";
  };
  programs.zathura = {
    enable = true;
    extraConfig = ''
      include catppuccin-mocha
      set adjust-open "best-fit"
      set pages-per-row 1
      set scroll-page-aware "true"
      set scroll-full-overlap 0.01
      set scroll-step 100

      set zoom-min 10
      set guioptions ""


      set recolor "true"
      set recolor-reverse-video "true"
      set recolor-keephue "true"


      set render-loading "false"
      set scroll-step 200
      unmap f
      map f toggle_fullscreen
      map [fullscreen] f toggle_fullscreen

    '';
  };
}
