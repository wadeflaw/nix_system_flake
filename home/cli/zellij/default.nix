{ pkgs, ... }: {
 xdg.configFile."zellij".source = ./config;
 programs.zellij.enable = true;
}
