{pkgs ? import <nixpkgs> {}}: {
  lyraq-cursors = pkgs.callPackage ./lyraq-cursors {};
  catppuccin-grub = pkgs.callPackage ./catppuccin-grub.nix {};
  rofi-calc-wayland = pkgs.callPackage ./rofi-calc-wayland.nix {};
  rofi-emoji-wayland = pkgs.callPackage ./rofi-emoji-wayland.nix {};
  invidtui = pkgs.callPackage ./invidtui {};
}
