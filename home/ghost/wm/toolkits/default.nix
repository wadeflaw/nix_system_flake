{pkgs, ...}: {
  imports = [
    ./qt.nix
    ./gtk.nix
  ];
  home.packages = with pkgs; [
    twemoji-color-font
    noto-fonts
    ipafont
    jetbrains-mono
    jost
    noto-fonts-cjk
    noto-fonts-emoji
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    package = pkgs.lyraq-cursors;
    name = "LyraQ-cursors";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };
}
