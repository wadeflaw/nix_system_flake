{ pkgs ? import <nixpkgs> { } }: {
  lyraq-cursors = pkgs.callPackage ./lyraq-cursors { };
  catppuccin-grub = pkgs.callPackage ./catppuccin-grub { };
}
