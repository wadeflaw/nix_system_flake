{ pkgs, ... }:
let
  neovim-config = pkgs.fetchgit {
    url = "https://codeberg.org/ghosty/astronvimconf";
#   sha256 = "sha256-ocUF1aqqEVYdGbE3aiJtNaCNOTqXfNmDwUKrMke1e4M=";
  };
in
{
 xdg.configFile."nvim".source = neovim-config;
 programs.neovim.enable = true;
}
