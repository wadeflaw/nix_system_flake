{
  self,
  pkgs,
  config,
  ...
}: {
  xdg.configFile."rofi/themes".source = ./config/themes;
  programs.rofi = {
    enable = true;
    # TODO: only override with plugins if system is wayland-enabled
    package = pkgs.rofi-wayland.override {
      plugins = with self.packages.${pkgs.system};
        [
          pkgs.rofi-rbw
        ]
        ++ [
          rofi-calc-wayland
          rofi-emoji-wayland
        ];
    };
  };
  xdg.configFile."rofi/config.rasi".text = let
    inherit (config.colorscheme) colors;
    bg = colors.base00;
    fg = colors.base05;
  in
    with colors;
    # TODO global gui and term Font
      ''
        configuration{
            location: 1;
            modi: "drun,filebrowser,calc,emoji";
            lines: 5;
            font: "Jost* 11";
            show-icons: true;
            icon-theme: "ePapirus-Dark";
            terminal: "${config.defaultApplications.terminal.desktop}";
            drun-display-format: "{icon} {name}";
            location: 0;
            disable-history: false;
            hide-scrollbar: true;
            display-drun: "Apps";
            location: 1;
        }

        @theme "themes/decayce"

        element-text, element-icon , mode-switcher {
            background-color: inherit;
            text-color:       inherit;
        }

        window {
            height:		 62%;
            width:		 32%;
            orientation: horizontal;
            border: 1.7px;
            border-color: #${base06};
            border-radius: 0px;
            background-color: #${bg};
            padding: 0px;
            margin: 90px;
        }

        mainbox {
            background-color: #${bg};
        }

        inputbar {
            children: [entry];
            background-color: #${bg};
            border-radius: 5px;
            padding: 0px;
        }

        prompt {
            background-color: #${base06};
            padding: 6px;
            text-color: #${bg};
            border-radius: 3px;
            margin: 0px 0px 0px 0px;
        }

        textbox-prompt-colon {
            expand: false;
            str: ":";
        }

        entry {
            padding: 6px;
            margin: 5px 0px 0px 5px;
            text-color: #${fg};
            background-color: #${bg};
        }

        listview {
            border: 0px 0px 0px;
            margin: 10px 35px 0px 10px;
            background-color: #${bg};
        }

        element {
            padding: 2px;
            background-color: #${bg};
            text-color: #${fg}  ;
        }

        element-icon {
            size: 20px;
        }

        element selected {
            background-color:  #${base02} ;
            text-color: #${base06}  ;
            border-radius: 10px;
        }

        mode-switcher {
            spacing: -7;
        }

        button {
            padding: 10px;
            background-color: #${bg};
            text-color: #${base02};
            vertical-align: 0.5;
            horizontal-align: 0.5;
        }

        button selected {
          background-color: #${bg};
          text-color: #${base06};
        }
      '';
}
