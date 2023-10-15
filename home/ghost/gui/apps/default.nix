{ inputs, ... }: {
  imports = [
    inputs.schizofox.homeManagerModule

    ./games
    ./firefox
    # ./schizofox
    ./telegram
    ./webcord
    # ./spotify
  ];
}
