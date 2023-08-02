{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [768 600];
    };

    "org/gnome/control-center" = {
      last-panel = "universal-access";
      window-state = mkTuple [980 640];
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/ghost/.local/share/backgrounds/2023-07-30-20-58-45-01.png";
      picture-uri-dark = "file:///home/ghost/.local/share/backgrounds/2023-07-30-20-58-45-01.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/input-sources" = {
      show-all-sources = false;
      sources = [(mkTuple ["xkb" "us"]) (mkTuple ["xkb" "ru"])];
      xkb-options = ["caps:swapescape" "grp:alt_shift_toggle"];
    };

    "org/gnome/desktop/interface" = {
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
      cursor-theme = "LyraQ Cursors";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "Jost* 11";
      gtk-key-theme = "Emacs";
      gtk-theme = "Catppuccin-Mocha-Compact-Mauve-dark";
      icon-theme = "Papirus-Dark";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      disable-while-typing = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///home/ghost/.local/share/backgrounds/2023-07-30-20-58-45-01.png";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "sloppy";
      num-workspaces = 6;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
    };

    "org/gnome/shell" = {
      enabled-extensions = ["windowsNavigator@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "apps-menu@gnome-shell-extensions.gcampax.github.com"];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "44.3";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };
  };
}
