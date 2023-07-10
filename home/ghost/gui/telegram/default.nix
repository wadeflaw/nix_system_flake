{lib, ...}: let
  myActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
    cp -r ./tdata $HOME/.local/share/KotatogramDesktop/
    # $DRY_RUN_CMD ln -s $VERBOSE_ARG \
    #     ${builtins.toPath ./link-me-directly} $HOME
  '';
in {
  home.activation = {
    myActivationAction = lib.hm.dag.entryAfter ["writeBoundary"] ''
      cp -r $FLAKE_PATH/home/ghost/gui/telegram/tdata $HOME/.local/share/KotatogramDesktop/
      # $DRY_RUN_CMD ln -s $VERBOSE_ARG \
      #     ${builtins.toPath ./link-me-directly} $HOME
    '';
  };
  # home.file.".local/share/KotatogramDesktop/tdata".source = ./tdata;
}
