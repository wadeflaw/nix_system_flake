{pkgs, ...}: {
  imports = [./dconf.nix];
  # home.packages = with pkgs.gnome; [
  #   gnome-shell
  #   zenity
  #   mutter
  #   gpaste
  #   cheese
  #   pomodoro
  #   gnome-panel
  #   gnome-applets
  #   gnome-tweaks
  #   dconf-editor
  #   gnome-session
  #   gnome-keyring
  #   gnome-bluetooth
  #   gnome-backgrounds
  # ];

  home.packages = with pkgs.gnomeExtensions;
    [
      zoom-wayland-extension
      space-bar
      user-themes
      aylurs-widgets
      remove-app-menu
      inactivity
      logo-menu
      sound-output-device-chooser
      quick-settings-tweaker
    ]
    ++ (with pkgs; [
      gnome-extension-manager
    ]);
}
