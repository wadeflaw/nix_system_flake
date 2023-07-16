{lib, ...}: {
  home.activation = {
    myActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
      # chmod -R 0644 $FLAKE_PATH/home/ghost/gui/telegram/tdata
      # cp -r $FLAKE_PATH/home/ghost/gui/telegram/tdata $HOME/.local/share/KotatogramDesktop/tdata
    '';
  };
  # home.file.".local/share/KotatogramDesktop/tdata".source = ./tdata;
}
