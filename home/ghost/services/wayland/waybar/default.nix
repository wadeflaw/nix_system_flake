{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    systemd.enable = true;
    enable = true;
  };

  xdg.configFile = let
    inherit (config.colorscheme) colors;
    bg = colors.base00;
    fg = colors.base05;
  in {
    "waybar/config".source = ./config.jsonc;
    # TODO font config
    "waybar/style.css".text = ''
            * {
              font-family: "Jost *";
              font-weight: bold;
              font-size: 14px;
            }

            window#waybar {
              background-color: #${colors.base01};
              margin-bottom: 40px;
            }

      #tray menu {
              background: #${bg};
              color: #${colors.base05};
            }

            tooltip {
              background: #${bg};
              border: 1px solid #${colors.base06};
            }

            button {
              border-radius: 12px 12px 12px 12px;
            }

      #workspaces {
              padding-right: 10px;
              border-right: 2px #${colors.base01};
              padding: 0px 15px 0px 15px;
            }

      #workspaces button {
              padding: 0 10px;
              color: #${fg};
              border-radius: 12px 12px 12px 12px;
              margin-bottom: 4px;
              margin-top: 4px;
              margin-left: 10px;
            }

      #workspaces button:hover {
              background: #${bg};
              color: #${colors.base06};
              border-radius: 12px 12px 12px 12px;
            }
      #workspaces button.active {
              color: #${colors.base01};
              background-color: #${colors.base06};
              border-radius: 12px 12px 12px 12px;
              padding: 0px 15px 0px 15px;
            }

      #workspaces button.focused {
              background-color: #${bg};
              color: #${colors.base06};
              border-radius: 12px 12px 12px 12px;
            }

      #workspaces button.urgent {
              background-color: #${colors.base08};
              color: #${bg};
              border-radius: 12px 12px 12px 12px;
            }

      #window {
              padding-left: 30px;
            }

      #clock {
              color: #${bg};
              background-color: #${colors.base06};
              font-style: initial;
              border-right: 5px;
              border-left: 5px;
              border-radius: 12px 12px 12px 12px;
              padding: 0px 15px 0px 15px;
              margin-bottom: 4px;
              margin-top: 4px;
            }
      #cpu {
              background-color: #${colors.base06};
              color: #${bg};
              border-right: 5px;
              border-left: 5px;
              padding: 0px 15px 0px 0px;
              margin-bottom: 4px;
              margin-top: 4px;
            }
      #memory {
              background-color: #${colors.base06};
              color: #${bg};
              margin-bottom: 4px;
              margin-top: 4px;
            }
      #language {
              background-color: #${colors.base06};
              color: #${bg};
              padding: 0px 15px 0px 15px;
              border-radius: 0px 12px 12px 0px;
              margin-bottom: 4px;
              margin-top: 4px;
            }
            /* #pulseaudio, */
      #wireplumber {
              padding: 0px 15px 0px 15px;
              background-color: #${colors.base06};
              color: #${bg};
              border-radius: 12px 0px 0px 12px;
              margin-bottom: 4px;
              margin-top: 4px;
            }

      #custom-separator {
              color: #${bg};
              background-color: #${colors.base01};
            }

      #tray {
              padding-left: 10px;
              padding-right: 10px;
              padding: 0px 10px;
            }
    '';
  };
}
