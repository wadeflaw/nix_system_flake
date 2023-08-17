{
  outputs =
    { nixpkgs
    , home-manager
    , self
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      conf = {
        host = "nixos";
        user = "ghost";
        passhash = "$y$j9T$lcqsG7EZPy7dSeXRr5lYk.$zLi5zYkjtBzy5nd9KLYQddxy88wD97EHKOCuJgzG1A6";
        fl_path = "/etc/nixos/stable";
        system = "x86_64-linux";
      };

      lib = import ./lib/nixpkgs { inherit nixpkgs lib inputs; };
    in
    {
      overlays = import ./overlays { inherit inputs outputs; };

      nixosConfigurations = {
        ${conf.host} = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit self conf lib inputs outputs; };
          modules = [
            ./hosts/${conf.host}
            # ./modules/core/software/de
          ];
        };
      };

      homeConfigurations = {
        ${conf.user} = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${conf.system};
          extraSpecialArgs = {
            inherit
              self
              conf
              inputs
              outputs
              ;
          };
          modules = [
            ./home/${conf.user}
            ./modules/defaultApps
          ];
        };
      };

      # devShells.default = inputs.devshell.legacyPackages.mkShell {
      #   name = "nyx";
      #   commands = (import ./lib/flake/devShell).shellCommands;
      #   packages = with nixpkgs.legacyPackages.${conf.system}; [
      #     inputs.agenix.packages.default # let me run agenix commands in the flake repository and only in the flake repository
      #     config.treefmt.build.wrapper
      #     nil # nix ls
      #     alejandra # formatter
      #     git # flakes require git, and so do I
      #     glow # markdown viewer
      #     statix # lints and suggestions
      #     deadnix # clean up unused nix code
      #   ];
      # };
    };

  inputs = {
    # nixpkgs
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstable";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming/d10b39b3e525907d904854b86803cf4b102daed9";
      # inputs.nixpkgs.follows = "unstable";
    };

    neovim-conf = {
      url = "git+file:/etc/nixos/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.nil.follows = "nil";
    };

    # wrapper-manager = {
    #   url = "github:viperML/wrapper-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Rust overlay
    # rust-overlay = {
    #   url = "github:oxalica/rust-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Nix Language server
    # nil = {
    #   url = "github:oxalica/nil";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.rust-overlay.follows = "rust-overlay";
    # };

    # helix = {
    #   url = "github:SoraTenshi/helix/new-daily-driver";
    #   inputs = {
    #     # rust-overlay.follows = "rust-overlay";
    #     nixpkgs.follows = "nixpkgs";
    #   };
    # };

    # Easy color integration
    nix-colors = {
      url = "github:misterio77/nix-colors";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    wallpkgs = {
      url = "github:NotAShelf/wallpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland stuff
    hyprland.url = "github:hyprwm/Hyprland/603de16f9a98688b79f19baa24d6e2c0346545f5";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ragenix = {
    #   url = "https://github.com/yaxitech/ragenix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hypr-plugins = {
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };
    # hy3 = {
    #   url = "github:outfoxxed/hy3";
    #   inputs.hyprland.follows = "hyprland";
    # };
    nur.url = "github:nix-community/NUR";

    shlyupa-nur.url = "github:ilya-fedin/nur-repository";
    shlyupa-nur.inputs.nixpkgs.follows = "nixpkgs";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };
}
