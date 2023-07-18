{lib, ...}: {
  home.activation = {
    myActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
      TG_PATH="$HOME/.local/share/KotatogramDesktop/tdata"
      pwd
      # cp -r $FLAKE_PATH/home/ghost/gui/telegram/tdata $TG_PATH
      # chmod -R 0644 $TG_PATH
    '';
  };
}
