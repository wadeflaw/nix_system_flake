{
  # options,
  config,
  lib,
  pkgs,
  ...
}:
# with lib;
# with lib.internal; let
#   cfg = config.home.shell;
# in {
#   options.home.shell = with types; {
#     shell = mkOpt (enum ["nushell" "fish"]) "nushell" "What shell to use";
#   };

  # config = 
  {
    # Enable all if nushell
    programs.nushell = {
    # mkIf (cfg.shell == "nushell") 
      enable = true;
      shellAliases = config.home.shellAliases // {ls = "ls";};
      envFile.text = "";
      # initExtra = ''
      # lib.mkOrder 200 ''
        # eval "$(zellij setup --generate-auto-start nu)"
                # [ "$(tty)" = "/dev/tty1" ] ; exec Hyprland &
      # '';

      extraConfig = ''
        $env.config = {
        	  show_banner: false,
        	  edit_mode: vi,
        	  }
        	# }
        # 	PROMPT_INDICATOR_VI_INSERT = ": ",
        #   PROMPT_INDICATOR_VI_NORMAL = "〉", 
        # }


      ${import ./functions.nix { inherit pkgs config lib; }}
      '';
      # ++ lib.mkOrder 200 ''
      #    eval "$(zellij setup --generate-auto-start nu)"
      #  '';
    };
    # environment.systemPackages = with pkgs; [
    #   eza
    #   bat
    #   nitch
    #   zoxide
    #   starship
    # ];

    # users.defaultUserShell = pkgs.${cfg.shell};

    # home.programs.starship = {
    #   enable = true;
    #   # enableFishIntegration = true;
    #   enableNushellIntegration = true;
    # };
    # home.configFile."starship.toml".source = ./starship.toml;

    # environment.shellAliases = {
    #   ".." = "cd ..";
    #   neofetch = "nitch";
    # };

    # home.programs.zoxide = {
    #   enable = true;
    #   enableNushellIntegration = true;
    # };

    # Actual Shell Configurations
    # home.programs.fish = mkIf (cfg.shell == "fish") {
    #   enable = true;
    #   shellAliases = {
    #     ls = "eza -la --icons --no-user --no-time --git -s type";
    #     cat = "bat";
    #   };
    #   shellInit = ''
    #     ${mkIf apps.tools.direnv.enable ''
    #       direnv hook fish | source
    #     ''}
    #
    #     zoxide init fish | source
    #
    #     function , --description 'add software to shell session'
    #           nix shell nixpkgs#$argv[1..-1]
    #     end
    #   '';
    # };

  }
# }
