{ pkgs
, config
, inputs
, ...
}: {
  environment.packages = with pkgs; [
    # neovim
    # ranger
    # tmux
    vim
    git
    neofetch
    # gcc
    # openssh
    # git
    # python312
    # lua
  ];

  programs.ssh.enable = true;

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  time.timeZone = "Europa/Kyiv";
  user.shell = "${pkgs.zsh}/bin/zsh";

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    registry = {
      n.flake = inputs.nixpkgs;
      m.flake = inputs.master;
      s.flake = inputs.stable;
    };
  };
  system.stateVersion = "23.05";

  # home-manager.config =
  #   { pkgs, ... }:
  #   {
  #     home.stateVersion = "22.05";
  #     imports = [
  #       # ../../home/misato/programs/shell
  #       # ../../home/misato/programs/neofetch
  #       # ../../home/misato/programs/ranger
  #       # ../../home/misato/programs/tmux
  #     ];
  #   };
}
