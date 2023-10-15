{
  pkgs,
  lib,
  # conf,
  # config,
  # inputs,
  # self,
  ...
}:
with lib; let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "0f2c393b11dd8174002803835ef7640635100ca3";
    hash = "sha256-iUnLLAQVMXFLyoB3wgYqUTx5SafLkvtOXK6C8EHK/nI=";
  };
in {
  # imports = [
  #   inputs.arrpc.homeManagerModules.default
  # ];

  home.packages = with pkgs; [
    webcord-vencord # webcord with vencord extension installed
  ];

  xdg.configFile = {
    "WebCord/Themes/mocha" = {
      source = "${catppuccin-mocha}/themes/mocha.theme.css";
    };

    # TODO copy config script from telegram, and modify it for cheking changes
    # if [[ $(diff config.json $HOME/.config/WebCord/config.json) ]]; then echo true; fi
    # share my webcord configuration across devices
    # "WebCord/config.json".source = ./config.json;
    # config.lib.file.mkOutOfStoreSymlink
    #     myActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    #   TG_PATH="$HOME/.local/share/KotatogramDesktop/tdata"
    #
    #   files=("experimental_options.json" "kotato-settings-custom.json" "shortcuts-custom.json")
    #
    #   for file in "''${files[@]}"; do
    #
    #   filepath="$TG_PATH/$file"
    #
    #     if [ -e "$filepath" ]; then
    #       rm $filepath
    #     else
    #       mkdir -p $TG_PATH
    #       cp -r $FLAKE_PATH/home/$USER/gui/telegram/tdata/$file $TG_PATH
    #       chmod 0644 $TG_PATH/$file
    #       exit
    #     fi
    #       mkdir -p $TG_PATH
    #       cp -r $FLAKE_PATH/home/$USER/gui/telegram/tdata/$file $TG_PATH
    #       chmod 0644 $TG_PATH/$file
    #   done
    # '';
  };

  # services.arrpc.enable = true;
}
