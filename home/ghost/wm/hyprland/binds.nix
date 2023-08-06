{
  lib,
  pkgs,
  inputs,
  ...
}: let
  getExe = lib.getExe;

  hyprctl = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl";

  grimblast = "${inputs.hypr-contrib.packages.${pkgs.system}.grimblast}/bin/grimblast --notify --scale 1 ";

  gamemode = pkgs.writeShellScriptBin "gamemode" (builtins.readFile ./scripts/gamemode);

  nightmode = pkgs.writeShellScriptBin "nightmode" (builtins.readFile ./scripts/nightmode);
  # brightness = pkgs.writeShellScriptBin "brightness" (builtins.readFile ./scripts/brightness);
  #
  # volume = pkgs.writeShellScriptBin "volume" (builtins.readFile ./scripts/volume);
in {
  xdg.configFile."hypr/binds.conf".text = ''
     input {
       kb_layout = us,ru
       kb_variant =
       kb_model =
       kb_options = grp:alt_shift_toggle,caps:swapescape
     # altwin:swap_alt_win
       kb_rules =
       follow_mouse = 1
       repeat_rate = 35
       repeat_delay = 350

       touchpad {
           natural_scroll = no
       }

       sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
     }

     bind = $mod,          Return,  exec, $term
     bind = $mod,          T, exec, [workspace 2 silent;float;noanim] $term
     bind = $mod,		       D, exec, rofi -show drun
     bind = $mod,		       R, exec, ${hyprctl} reload
     bind = $mod,		       W, killactive,
     bind = $modCTRLSHIFT, Q, exit,
     bind = $mod,			     S, togglefloating,
     bind = $mod,          F, fullscreen
     bind = $modSHIFT,	   T, pseudo, # dwindle
     bind = $mod,		       Y, togglesplit, # dwindle
     bind = $mod,		       B, exec, $term -e ${pkgs.bluetuith}/bin/cliphist
    #bind = $modSHIFT,     P, exec, $scripts/waylogout
     bind = CTRLSHIFT,     L, exec, ${getExe pkgs.gtklock}
     bind = $modSHIFT,		 E, exec, rofi -show emoji
     bind = $modSHIFT,		 C, exec, rofi -show calc

     bind = $mod,          U, pin
     bind = $mod,      	   G, togglegroup
    binde = $mod,          Tab, changegroupactive, f
    binde = $modSHIFT,     Tab, changegroupactive, b

     bind = $modSHIFTCTRL, K, exec, [workspace 3] kotatogram-desktop
     bind = $mod,          N, exec, [float      ] $term -e ${pkgs.networkmanager}/bin/nmtui
     bind = $mod,          C, exec, ${pkgs.cliphist}/bin/cliphist list | rofi -dmenu -display-columns 2 | ${pkgs.cliphist}/bin/cliphist decode | wl-copy
     bind = ALT,           G, exec, ${getExe gamemode}
     bind = ALT,           N, exec, ${getExe nightmode}

     bind = $mod,          h, movefocus, l
     bind = $mod,          l, movefocus, r
     bind = $mod,          k, movefocus, u
     bind = $mod,          j, movefocus, d

     bind = $modCTRL,      h, swapwindow, l
     bind = $modCTRL,      l, swapwindow, r
     bind = $modCTRL,      k, swapwindow, u
     bind = $modCTRL,      j, swapwindow, d

     $moverate = 55

    binde = $modCTRL,      h, moveactive, -$moverate 0
    binde = $modCTRL,      l, moveactive, $moverate 0
    binde = $modCTRL,      k, moveactive, 0 -$moverate
    binde = $modCTRL,      j, moveactive, 0 $moverate

    binde = $modSHIFT,     h, resizeactive, -$moverate 0
    binde = $modSHIFT,     l, resizeactive, $moverate 0
    binde = $modSHIFT,     k, resizeactive, 0 -$moverate
    binde = $modSHIFT,     j, resizeactive, 0 $moverate

     bind = ,XF86AudioRaiseVolume,    exec, volume -i 7
     bind = ,XF86AudioLowerVolume,    exec, volume -d 7
     bind = ,XF86AudioMute,           exec, volume mute
     bind = ,XF86AudioPlay,           exec, ${getExe pkgs.playerctl} play-pause

     # pause all
     bind = ,F8,                 exec, ${getExe pkgs.playerctl} -a pause

     bind = ,XF86MonBrightnessDown,   exec, brightness set 7%-
     bind = ,XF86MonBrightnessUp,     exec, brightness set +7%

     bind = ,Print,                   exec, ${grimblast} copy screen
     bind = ALT, Print,               exec, ${grimblast} copy area

     # workspace binds
     bind = $mod,       E, movetoworkspace, +1
     bind = $mod,       Q, movetoworkspace, -1

    # binds mod + [shift +] {1..10} to [move to] ws {1..10}
    ${
      builtins.concatStringsSep "\n" (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $mod, ${ws}, workspace, ${toString (x + 1)}
            bind = $mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}
            bind = CTRL SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
          ''
        )
        10)
    }
    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
  '';
}
