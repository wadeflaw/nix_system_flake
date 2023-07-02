{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    alejandra
    deadnix
    statix
  ];
  programs.neovim = {
    enable = true;
    
  };
}
