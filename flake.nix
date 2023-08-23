{
  outputs = {
    self,
    nixpkgs,
    home-manager,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
        # "aarch64-linux"
        # "i686-linux"
        # ...
      ];

      imports = [
        # add self back to inputs, I depend on inputs.self at least once
        {config._module.args._inputs = inputs // {inherit (inputs) self;};}

        # parts and modules from inputs
        inputs.flake-parts.flakeModules.easyOverlay
        inputs.treefmt-nix.flakeModule

        # parts of the flake
        # ./pkgs
      ];

      flake = let
        conf = import ./modules/config;

        # inherit (self) outputs;
        lib = import ./lib/nixpkgs {inherit nixpkgs lib inputs;};
      in {
        overlays = import ./overlays {inherit inputs;};

        nixosConfigurations = import ./hosts {
          inherit nixpkgs self conf lib inputs;
        };

        homeConfigurations = import ./home {
          inherit nixpkgs home-manager lib self conf inputs;
        };
      };

      perSystem = {
        config,
        inputs',
        pkgs,
        system,
        ...
      }: {
        imports = [
          {
            _module.args.pkgs = import nixpkgs {
              config.allowUnfree = true;
              config.allowUnsupportedSystem = true;
              inherit system;
            };
          }
        ];

        devShells.default = inputs'.devshell.legacyPackages.mkShell {
          name = "nyx";
          commands = (import ./lib/flake/devShell).shellCommands;
          packages = with pkgs; [
            # inputs'.ragenix.packages.default # let me run agenix commands in the flake repository and only in the flake repository
            config.treefmt.build.wrapper
            nil # nix ls
            # alejandra # formatter
            git # flakes require git, and so do I
            glow # markdown viewer
            statix # lints and suggestions
            deadnix # clean up unused nix code
          ];
        };

        # provide the formatter for nix fmt
        formatter = pkgs.alejandra;

        # configure treefmt
        treefmt = {
          projectRootFile = "flake.nix";

          programs = {
            alejandra.enable = true;
            deadnix.enable = false;
            shellcheck.enable = true;
            stylua.enable = true;
            rustfmt.enable = true;
            shfmt = {
              enable = true;
              # https://flake.parts/options/treefmt-nix.html#opt-perSystem.treefmt.programs.shfmt.indent_size
              # 0 causes shfmt to use tabs
              indent_size = 0;
            };
          };
        };
      };
    };

  inputs = {
    # powered by
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # a tree-wide formatter
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "unstable";
    };
    neovim-conf = {
      url = "git+file:/etc/nixos/nixvim";
      inputs.nixpkgs.follows = "unstable";
      inputs.nixvim = {
        follows = "nixvim";
        inputs.nixpkgs.follows = "unstable";
      };
      # inputs.nil.follows = "nil";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "unstable";
    };

    # Rust overlay
    # rust-overlay = {
    #   url = "github:oxalica/rust-overlay";
    #   inputs.nixpkgs.follows = "unstable";
    # };

    # Nix Language server
    # nil = {
    #   url = "github:oxalica/nil";
    #   inputs.nixpkgs.follows = "unstable";
    #   inputs.rust-overlay.follows = "rust-overlay";
    # };

    # helix = {
    #   url = "github:SoraTenshi/helix/new-daily-driver";
    #   inputs = {
    #     # rust-overlay.follows = "rust-overlay";
    #     nixpkgs.follows = "unstable";
    #   };
    # };

    # Easy color integration
    nix-colors = {
      url = "github:misterio77/nix-colors";
      inputs.nixpkgs-lib.follows = "unstable";
    };

    wallpkgs = {
      url = "github:NotAShelf/wallpkgs";
      inputs.nixpkgs.follows = "unstable";
    };

    spicetify = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "unstable";
    };

    # Hyprland stuff
    hyprland.url = "github:hyprwm/Hyprland";
    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "unstable";
    };
    hyprpicker.url = "github:hyprwm/hyprpicker";
    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "unstable";
    };

    # ragenix = {
    #   url = "https://github.com/yaxitech/ragenix";
    #   inputs.nixpkgs.follows = "unstable";
    # };

    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "unstable";
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

    shlyupa-nur = {
      url = "github:ilya-fedin/nur-repository";
      # inputs.nixpkgs.follows = "unstable";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  nixConfig = {
    substituters = [
      "https://cache.privatevoid.net"
      "https://notashelf.cachix.org"
      "https://ilya-fedin.cachix.org"
      "https://helix.cachix.org"
      "https://cache.nixos.org" # funny binary cache
      "https://nixpkgs-unfree.cachix.org" # unfree-package cache
      "https://nix-community.cachix.org" # nix-community cache
      "https://hyprland.cachix.org" # hyprland
      "https://nixpkgs-wayland.cachix.org" # automated builds of *some* wayland packages
      "https://nix-gaming.cachix.org" # nix-gaming
      "https://nyx.chaotic.cx"
    ];
    trusted-public-keys = [
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
      "notashelf.cachix.org-1:VTTBFNQWbfyLuRzgm2I7AWSDJdqAa11ytLXHBhrprZk="
      "ilya-fedin.cachix.org-1:QveU24a5ePPMh82mAFSxLk1P+w97pRxqe9rh+MJqlag="
      "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];
  };
}
