{
  lib,
  pkgs,
  conf,
  inputs,
  self,
  ...
}: {
  imports = [
    ./services
    ./terminal
    ./gui
    ./themes
    ./nix
  ];
  # ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = conf.user;
    homeDirectory = "/home/${conf.user}";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
