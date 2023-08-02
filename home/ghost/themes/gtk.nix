{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "pink";
      };
      name = "Papirus-Dark";
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "compact";
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "${config.home.pointerCursor.name}";
    };
    font = {
      name = "Jost*";
      size = 11;
    };
    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
  };
  home = {
    packages = with pkgs; [
      glib # gsettings
      (catppuccin-gtk.override {
        size = "compact";
        accents = ["pink"];
        variant = "mocha";
      })
      (catppuccin-papirus-folders.override {
        accent = "pink";
        flavor = "mocha";
      })
      # font
      twemoji-color-font
      noto-fonts
      ipafont
      jetbrains-mono
      jost
      noto-fonts-cjk
      noto-fonts-emoji
      (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    sessionVariables = {
      # set GTK theme as specified by the catppuccin-gtk package
      GTK_THEME = "${config.gtk.theme.name}";

      # gtk applications should use filepickers specified by xdg
      GTK_USE_PORTAL = "1";

      XCURSOR_SIZE = "24";
      XCURSOR_THEME = "${config.home.pointerCursor.name}";
    };
    pointerCursor = {
      package = pkgs.lyraq-cursors;
      name = "LyraQ-cursors";
      size = 24;
      x11.enable = true;
      gtk.enable = true;
    };
  };

  # programs.dconf.enable = config.gtk.enable;
  fonts.fontconfig.enable = true;
}
