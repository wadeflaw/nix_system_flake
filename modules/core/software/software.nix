{ ... }: {
  imports = [
    ./personal
    ./network.nix
    ./pipewire.nix
    ./security.nix
    ./nix-settings.nix
  ];
}
