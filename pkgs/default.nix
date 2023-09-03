{pkgs, ...}:
with pkgs; {
  lyraq-cursors = callPackage ./lyraq-cursors {};
  catppuccin-grub = callPackage ./catppuccin-grub.nix {};
  rofi-calc-wayland = callPackage ./rofi-calc-wayland.nix {};
  rofi-emoji-wayland = callPackage ./rofi-emoji-wayland.nix {};
  spotify-wrapped = callPackage ./spotify-wrapped.nix {};
  ayuagram = qt6.callPackage ./ayugram-desktop-git {
    inherit
      (darwin.apple_sdk_11_0.frameworks)
      Cocoa
      CoreFoundation
      CoreServices
      CoreText
      CoreGraphics
      CoreMedia
      OpenGL
      AudioUnit
      ApplicationServices
      Foundation
      AGL
      Security
      SystemConfiguration
      Carbon
      AudioToolbox
      VideoToolbox
      VideoDecodeAcceleration
      AVFoundation
      CoreAudio
      CoreVideo
      CoreMediaIO
      QuartzCore
      AppKit
      CoreWLAN
      WebKit
      IOKit
      GSS
      MediaPlayer
      IOSurface
      Metal
      MetalKit
      ;

    stdenv =
      if stdenv.isDarwin
      then darwin.apple_sdk_11_0.stdenv
      else stdenv;

    # tdesktop has random crashes when jemalloc is built with gcc.
    # Apparently, it triggers some bug due to usage of gcc's builtin
    # functions like __builtin_ffsl by jemalloc when it's built with gcc.
    jemalloc = (jemalloc.override {stdenv = clangStdenv;}).overrideAttrs (_: {
      doCheck = false;
    });
  };
  invidtui = callPackage ./invidtui {};
  pwvucontrol = callPackage ./pwvucontrol {};
}
