{ pkgs ? import <nixpkgs> { } }:
with pkgs; {
  lyraq-cursors = callPackage ./lyraq-cursors { };
  catppuccin-grub = callPackage ./catppuccin-grub.nix { };
  rofi-calc-wayland = callPackage ./rofi-calc-wayland.nix { };
  rofi-emoji-wayland = callPackage ./rofi-emoji-wayland.nix { };
  spotify-wrapped = callPackage ./spotify-wrapped.nix { };
  invidtui = callPackage ./invidtui { };
  pwvucontrol = callPackage ./pwvucontrol { };
}
