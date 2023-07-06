{
  inputs,
  pkgs,
  lib,
  ...
}: let
  getexe = lib.getExe;

  autostart = pkgs.writeShellScriptBin "autostart" ''
        #!/bin/env bash
        ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store & #Stores only text data
        ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store & #Stores only image data


        if [[ ! `pgrep kwalletd5` ]] then
          ${pkgs.libsForQt5.kwallet}-bin/bin/kwalletd5 &
        fi

    # terminal
        if [[ ! `pgrep foot` ]]; then
          ${pkgs.foot}/bin/foot --server &
        fi

    # wallpaper
        if [[ ! `pgrep swww-daemon` ]]; then
          ${getexe pkgs.swww} init &
        fi

    # notification daemon
        if [[ ! `pgrep dunst` ]]; then
          ${getexe pkgs.dunst} &
        fi

    # sound
        if [[ ! `pgrep pipewire` ]]; then
          ${getexe pkgs.pipewire} &
        fi

        if [[ ! `pgrep pipewire-pulse` ]]; then
          ${pkgs.pipewire}-pulse/bin/pipewire-pulse &
        fi

        if [[ ! `pgrep wireplumber` ]]; then
          ${getexe pkgs.wireplumber} &
        fi

        if [[ ! `pgrep waybar` ]]; then
          ${getexe pkgs.waybar} &
        fi

          ${getexe pkgs.libnotify} "Hello ghost! 😈"
  '';
in {
  imports = [
    ./variables.nix
    ./themes.nix
    ./binds.nix
    ./rules.nix
    inputs.hyprland.homeManagerModules.default
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
    extraConfig = ''
      #monitor=,preferred,auto,1
      monitor  = eDP-1,1920x1080@60,0x0,1
      monitor  = HDMI-A-1,disabled

      $term    = ${pkgs.foot}/bin/footclient
      $mod     = SUPER
      $mod2    = ALT

      exec     = bash ${autostart}/bin/autostart

      source   =    $HOME/.config/hypr/rules.conf
      source   =    $HOME/.config/hypr/binds.conf
      source   =    $HOME/.config/hypr/themes/mocha.conf

      general {
         gaps_in                 = 6
         gaps_out                = 12
         border_size             = 3.5
         col.active_border       = $mauve $pink $lavender 45deg
         col.inactive_border     = $surface1
         col.group_border_active = $mauve
         col.group_border        = $surface0

         layout = dwindle
      }

      decoration {
         rounding            = 6
         blur                = false
         blur_size           = 3
         blur_passes         = 2
         blur_ignore_opacity = true
         drop_shadow         = false
         shadow_range        = 55
         shadow_render_power = 4
         col.shadow          = $mantle
         shadow_offset       = -12, 12
         screen_shader       = $HOME/.config/hypr/themes/screenShader.frag
      }

      animations {
         enabled   = yes
         bezier    = myBezier, 0.05, 0.9, 0.1, 1.05

         animation = windows,     1, 2,  default
         animation = windowsOut,  1, 2,  default
         animation = border,      1, 2,  default
         animation = borderangle, 1, 2,  default
         animation = fade,        1, 2,  default
         animation = workspaces,  1, 2,  default
      }

      dwindle {
         pseudotile        = yes
         preserve_split    = yes
         no_gaps_when_only = true
      }

      master {
         new_is_master     = true
      }

      gestures {
         workspace_swipe   = true
      }

      misc {
         render_titles_in_groupbar = false
         groupbar_gradients        = false
         disable_hyprland_logo     = true
         disable_splash_rendering  = true
         vrr                       = 1
         disable_autoreload        = true
         enable_swallow            = true
         swallow_regex             = kitty|Alacritty|foot
         # swallow_exception_regex  = ^()
      }

      binds {
         allow_workspace_cycles = true
      }

      debug {
         disable_logs = true
         disable_time = true
      }
    '';
  };
}
