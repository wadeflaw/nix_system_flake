{
  lib,
  pkgs,
  inputs,
  ...
}: let
  getExe = lib.getExe;

  hyprctl = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl";

  grimblast = "${getExe inputs.hypr-contrib.packages.${pkgs.system}.grimblast} --notify --scale 1 ";

  rofi = "${getExe pkgs.rofi-wayland}";

  gamemode = pkgs.writeShellScriptBin "gamemode" (builtins.readFile ./scripts/gamemode);

  nightmode = pkgs.writeShellScriptBin "nightmode" (builtins.readFile ./scripts/nightmode);

  brightness = pkgs.writeShellScriptBin "brightness" (builtins.readFile ./scripts/brightness);

  volume = pkgs.writeShellScriptBin "volume" (builtins.readFile ./scripts/volume);
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
     bind = $mod,		       D, exec, ${rofi} -show drun
     bind = $mod,		       R, exec, ${hyprctl} reload
     bind = $mod,		       W, killactive,
     bind = $modCTRLSHIFT, Q, exit,
     bind = $mod,			     S, togglefloating,
     bind = $mod,          F, fullscreen
     bind = $modSHIFT,	   T, pseudo, # dwindle
     bind = $mod,		       Y, togglesplit, # dwindle
     bind = $mod,		       B, exec, $term -e ${getExe pkgs.bluetuith}
    #bind = $modSHIFT,     P, exec, $scripts/waylogout
     bind = CTRLSHIFT,     L, exec, ${getExe pkgs.gtklock}

     bind = $mod,          U, pin
     bind = $mod,      	   G, togglegroup
    binde = $mod,          Tab, changegroupactive, f
    binde = $modSHIFT,     Tab, changegroupactive, b

     bind = $modSHIFTCTRL, K, exec, [workspace 3] kotatogram-desktop
     bind = $mod,          N, exec, [float      ] $term -e ${pkgs.networkmanager}/bin/nmtui
     bind = $mod,          C, exec, ${getExe pkgs.cliphist} list | ${rofi} -dmenu -display-columns 2 | ${getExe pkgs.cliphist} decode | wl-copy
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

     bind = $mod, 1, workspace, 1
     bind = $mod, 2, workspace, 2
     bind = $mod, 3, workspace, 3
     bind = $mod, 4, workspace, 4
     bind = $mod, 5, workspace, 5
     bind = $mod, 6, workspace, 6
     bind = $mod, 7, workspace, 7
     bind = $mod, 8, workspace, 8
     bind = $mod, 9, workspace, 9
     bind = $mod, 0, workspace, 10

     bind = $mod,       E, movetoworkspace, +1
     bind = $mod,       Q, movetoworkspace, -1

     bind = $mod SHIFT, 1, movetoworkspacesilent, 1
     bind = $mod SHIFT, 2, movetoworkspacesilent, 2
     bind = $mod SHIFT, 3, movetoworkspacesilent, 3
     bind = $mod SHIFT, 4, movetoworkspacesilent, 4
     bind = $mod SHIFT, 5, movetoworkspacesilent, 5
     bind = $mod SHIFT, 6, movetoworkspacesilent, 6
     bind = $mod SHIFT, 7, movetoworkspacesilent, 7
     bind = $mod SHIFT, 8, movetoworkspacesilent, 8
     bind = $mod SHIFT, 9, movetoworkspacesilent, 9
     bind = $mod SHIFT, 0, movetoworkspacesilent, 10

     bind = CTRL SHIFT, 1, movetoworkspace, 1
     bind = CTRL SHIFT, 2, movetoworkspace, 2
     bind = CTRL SHIFT, 3, movetoworkspace, 3
     bind = CTRL SHIFT, 4, movetoworkspace, 4
     bind = CTRL SHIFT, 5, movetoworkspace, 5
     bind = CTRL SHIFT, 6, movetoworkspace, 6
     bind = CTRL SHIFT, 7, movetoworkspace, 7
     bind = CTRL SHIFT, 8, movetoworkspace, 8
     bind = CTRL SHIFT, 9, movetoworkspace, 9
     bind = CTRL SHIFT, 0, movetoworkspace, 10

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow

     bind = ,XF86AudioRaiseVolume,    exec, ${getExe volume} up
     bind = ,XF86AudioLowerVolume,    exec, ${getExe volume} down
     bind = ,XF86AudioMute,           exec, ${getExe volume} mute

     bind = ,XF86MonBrightnessDown,   exec, ${getExe brightness} down
     bind = ,XF86MonBrightnessUp,     exec, ${getExe brightness} up

     bind = ,Print,                   exec, ${grimblast} copy screen
     bind = ALT, Print,               exec, ${grimblast} copy area
  '';
}
