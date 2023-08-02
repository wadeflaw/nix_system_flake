{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      rust-lang.rust-analyzer

      #nix
      kamadorueda.alejandra

      #neovim binds
      asvetliakov.vscode-neovim
    ];
  };
}
