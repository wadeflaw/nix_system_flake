{ inputs, ... }: {
  imports = [
    inputs.schizofox.homeManagerModule

    ./games
    ./zathura
    ./firefox
    # ./schizofox
    ./telegram
    # ./webcord
    # ./spotify
  ];
}
