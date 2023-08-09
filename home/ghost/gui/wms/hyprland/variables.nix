{config, ...}: let
  vars = {
    NIXOS_OZONE_WL = "1";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    # ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";

    # mozilla
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_DBUS_REMOTE = "1";

    # wlroots
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = "1";
    # toolkits
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";

    CLUTTER_BACKEND = "wayland";

    WINIT_UNIX_BACKEND = "wayland";
    _JAVA_AWT_WM_NONEREPARENTING = "1";

    # apps
    TERMINAL = "${config.defaultApplications.terminal.desktop}";
    BROWSER = "${config.defaultApplications.browser.desktop}";
    EDITOR = "${config.defaultApplications.editor.desktop}";
  };
in {
  home.sessionVariables = vars;
  # systemd.user.sessionVariables = vars;
}
