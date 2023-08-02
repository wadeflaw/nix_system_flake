{
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = [
      pkgs.nur.repos.ilya-fedin.kotatogram-desktop
      pkgs.telegram-desktop
    ];
    activation = {
      myActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
        TG_PATH="$HOME/.local/share/KotatogramDesktop/tdata"

        files=("experimental_options.json" "kotato-settings-custom.json" "shortcuts-custom.json")

        for file in "''${files[@]}"; do

        filepath="$TG_PATH/$file"

          if [ -e "$filepath" ]; then
            rm $filepath
          else
            mkdir -p $TG_PATH
            cp -r $FLAKE_PATH/home/$USER/gui/telegram/tdata/$file $TG_PATH
            chmod 0644 $TG_PATH/$file
            exit
          fi
            mkdir -p $TG_PATH
            cp -r $FLAKE_PATH/home/$USER/gui/telegram/tdata/$file $TG_PATH
            chmod 0644 $TG_PATH/$file
        done
      '';
    };
  };
}
