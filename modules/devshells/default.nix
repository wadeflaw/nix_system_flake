{
  pkgs,
  inputs,
  ...
}: {
  devShells.default = inputs.devshell.legacyPackages.mkShell {
    name = "nyx";
    commands = (import ./lib/flake/devShell).shellCommands;
    packages = with pkgs; [
      # inputs.agenix.packages.default # let me run agenix commands in the flake repository and only in the flake repository
      # config.treefmt.build.wrapper
      nil # nix ls
      alejandra # formatter
      git # flakes require git, and so do I
      glow # markdown viewer
      statix # lints and suggestions
      deadnix # clean up unused nix code
    ];
  };
}
