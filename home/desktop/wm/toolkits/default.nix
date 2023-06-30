{
  inputs,
  pkgs,
  ...
}: {
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
  gtk = {
    enable = true;
    font = {
      name = "Jost*";
      size = 11;
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "pink";
      };
      name = "Papirus-Dark";
    };
    theme = {
      name = "Catppuccin-Mocha-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "standard";
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "LyraQ Cursors";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "menu:";
    };
  };

  home.pointerCursor = {
    package = pkgs.lyraq-cursors;
    name = "LyraQ-cursors";
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };
  qt = {
    enable = true;
    #   platformTheme = "gnome";
    #style = {
    #  name = "adwaita-dark";
    #  package = pkgs.adwaita-qt;
    #};
  };
}
