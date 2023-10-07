{ pkgs
, config
, inputs
, ...
}: {
  environment = {
    packages = with pkgs; [
      neovim
      tmux
      git
      neofetch
      gcc
      openssh
      # python312
      # lua

      # Some common stuff that people expect to have
      diffutils
      findutils
      utillinux
      tzdata
      hostname
      man
      gnugrep
      gnupg
      gnused
      gnutar
      bzip2
      gzip
      xz
      zip
      unzip
    ];
  };

  imports = [ ./ssh ];
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

  home-manager.config = { pkgs, ... }: {
    home.stateVersion = "22.05";
    programs.ssh.enable = true;
    # imports = [
    #   # ../../home/misato/programs/shell
    #   # ../../home/misato/programs/neofetch
    #   # ../../home/misato/programs/ranger
    #   # ../../home/misato/programs/tmux
    # ];
  };
}
