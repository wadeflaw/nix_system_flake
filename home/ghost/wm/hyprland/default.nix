{
  inputs,
  config,
  conf,
  pkgs,
  lib,
  ...
}: let
  inherit (config.colorscheme) colors;
  nightmode.enable = false;

  pointer = config.home.pointerCursor;

  getexe = lib.getExe;

  autostart = pkgs.writeShellScriptBin "autostart" ''
        ${pkgs.wl-clipboard}/bin/wl-paste --type text  --watch ${pkgs.cliphist}/bin/cliphist store & #Stores only text data
        ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store & #Stores only image data

    # terminal
        if [[ ! `pgrep foot` ]]; then
          ${pkgs.foot}/bin/foot --server &
        fi

    # wallpaper
        if [[ ! `pgrep swww-daemon` ]]; then
          ${getexe pkgs.swww} init &
        fi

  '';
in {
  imports = [
    ./themes.nix
    ./binds.nix
    ./rules.nix
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    plugins = [
      # inputs.hy3.packages.${pkgs.system}.hy3
      # inputs.hypr-plugins.packages.${pkgs.system}.hyprbars
    ];
    xwayland = {
      enable = true;
      hidpi = true;
    };
    enableNvidiaPatches = false;
    systemdIntegration = false;
    extraConfig = ''
      exec-once = ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd PATH DISPLAY WAYLAND_DISPLAY HYPRLAND_INSTANCE_SIGNATURE XDG_CURRENT_DESKTOP && systemctl --user start hyprland-session.target

      #monitor=,preferred,auto,1
      monitor  = eDP-1,1920x1080@60,0x0,1
      monitor  = HDMI-A-1,disabled

      $term    = ${pkgs.foot}/bin/footclient
      $mod     = SUPER
      $mod2    = ALT

      exec     = ${getexe autostart}
      exec-once = hyprctl setcursor ${pointer.name} ${toString pointer.size}; ${getexe pkgs.libnotify} "Hello ${conf.user}! 😈"

      source   =    $HOME/.config/hypr/rules.conf
      source   =    $HOME/.config/hypr/binds.conf

      general {
         gaps_in                 = 0
         gaps_out                = 0
         border_size             = 1
         col.active_border       = 0xff${colors.base0E} 0xff${colors.base0E} 0xff${colors.base07} 45deg
         col.inactive_border     = 0xff${colors.base03}
         col.group_border_active = 0xff${colors.base0E}
         col.group_border        = 0xff${colors.base02}

         # no_focus_fallback = true
         cursor_inactive_timeout = 5
         layout = dwindle
      }

      decoration {
         rounding            = 0
         blur                = true
         blur_size           = 3
         blur_passes         = 2
         blur_ignore_opacity = true
         drop_shadow         = false
         shadow_range        = 55
         shadow_render_power = 4
         col.shadow          = 0xff${colors.base01}
         shadow_offset       = -12, 12
         ${
        if nightmode.enable
        then ''
          screen_shader       = $HOME/.config/hypr/themes/shader_night.frag
        ''
        else ''
          screen_shader       = $HOME/.config/hypr/themes/shader_def.frag
        ''
      }
      }

      # animations {
      #   enabled = true
      #   bezier = smoothOut, 0.36, 0, 0.66, -0.56
      #   bezier = smoothIn, 0.25, 1, 0.5, 1
      #   bezier = overshot, 0.4,0.8,0.2,1.2
      #
      #   animation = windows, 1, 4, overshot, slide
      #   animation = windowsOut, 1, 4, smoothOut, slide
      #   animation = border,1,10,default
      #
      #   animation = fade, 1, 10, smoothIn
      #   animation = fadeDim, 1, 10, smoothIn
      #   animation = workspaces,1,4,overshot,slidevert
      #
      # }
      animations {
         enabled   = false
         bezier    = myBezier, 0.05, 0.9, 0.1, 1.05

         animation = windows,     1, 2,  default
         animation = windowsOut,  1, 2,  default
         animation = border,      1, 2,  default
         animation = borderangle, 1, 2,  default
         animation = fade,        1, 2,  default
         animation = workspaces,  1, 2,  default
      }

      # plugin { hyprbars {
      #     bar_color = 0xff${colors.base02}
      #     bar_height = 19
      #     col.text = 0xff${colors.base05}
      #     bar_text_size = 9
      #     bar_text_font = "Jost*"
      #
      #     col.maximize = 0xff${colors.base0F}
      #     col.close = 0xff${colors.base08}
      #   }
      #   hy3 {
      #     tabs {
      #       height = 5
      #       padding = 8
      #       render_text = false
      #     }
      #     autotile {
      #       enable = true
      #       trigger_width = 0
      #       trigger_height = 0
      #     }
      #   }
      # }
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
         swallow_regex             = kitty|Alacritty|foot|nemo
         cursor_zoom_factor = 0.6
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
