{
  config,
  pkgs,
  # lib,
  ...
}: {
  imports = [
    ./zshrc.nix
    # ./zshenv.nix
    ./aliases.nix
  ];
  xdg.configFile."zsh-plugins".source = ./zsh-plugins;
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      sessionVariables = {LC_ALL = "en_US.UTF-8";};
      enableCompletion = false;
      # defaultKeymap = "vicmd";
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      profileExtra = ''
        [ "$(tty)" = "/dev/tty1" ] && exec Hyprland &
      '';
      plugins = with pkgs;
        [
          {
            name = "zsh-autosuggestions";
            src = zsh-autosuggestions;
            file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
          }
          {
            name = "zsh-history-substring-search";
            src = zsh-history-substring-search;
            file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
          }
          {
            name = "zsh-autopair";
            src = zsh-autopair;
            file = "share/zsh-autopair/zsh-autopair.zsh";
          }
          {
            name = "fzf-tab";
            src = zsh-fzf-tab;
            file = "share/fzf-tab/fzf-tab.plugin.zsh";
          }
          {
            name = "zsh-syntax-highlighting";
            src = zsh-syntax-highlighting;
            file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
          }
          {
            name = "zsh-autopair";
            src = zsh-autopair;
            file = "share/zsh/zsh-autopair/autopair.zsh";
          }
          {
            name = "zsh-nix-shell";
            src = zsh-nix-shell;
            file = "share/zsh/zsh-nix-shell/nix-shell.plugin.zsh";
          }
          {
            name = "zsh-vi-mode";
            src = zsh-vi-mode;
            file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
          }
        ]
        ++ [
          {
            name = "zsh-fzf-history-search";
            file = "zsh-fzf-history-search.plugin.zsh";
            src = fetchFromGitHub {
              owner = "joshskidmore";
              repo = "zsh-fzf-history-search";
              rev = "d1aae98ccd6ce153c97a5401d79fd36418cd2958";
              hash = "sha256-4Dp2ehZLO83NhdBOKV0BhYFIvieaZPqiZZZtxsXWRaQ=";
            };
          }
          {
            name = "zsh-auto-notify";
            file = "auto-notify.plugin.zsh";
            src = fetchFromGitHub {
              owner = "MichaelAquilina";
              repo = "zsh-auto-notify";
              rev = "22b2c61ed18514b4002acc626d7f19aa7cb2e34c";
              hash = "sha256-x+6UPghRB64nxuhJcBaPQ1kPhsDx3HJv0TLJT5rjZpA=";
            };
          }
          {
            name = "fzf-zsh-completions";
            file = "fzf-zsh-completions.plugin.zsh";
            src = fetchFromGitHub {
              owner = "chitoku-k";
              repo = "fzf-zsh-completions";
              rev = "5895f6f4ca62428b1c8ba7e2619ee7d63dcb4bbe";
              hash = "sha256-FG7vdFYKPIKdML77ZVP61UFfaTYAq776akYCG9if+Tc=";
            };
          }
        ];
      history = {
        path = "${config.xdg.configHome}/zsh/zsh_history";
        share = true;
        save = 10000;
        size = 10000;
        expireDuplicatesFirst = true;
        ignoreDups = true;
        ignoreSpace = true;
      };
      dirHashes = rec {
        docs = "${config.xdg.userDirs.documents}";
        notes = "${docs}";
        dev = "${docs}/dev";
        flake = "$FLAKE_PATH";
        dl = "${config.xdg.userDirs.download}";
        vids = "${config.xdg.userDirs.videos}";
        music = "${config.xdg.userDirs.music}";
        pics = "${config.xdg.userDirs.pictures}";
        screenshots = "${pics}/screenshots";
        # media = "$HOME/Media";
      };
    };
  };
}
