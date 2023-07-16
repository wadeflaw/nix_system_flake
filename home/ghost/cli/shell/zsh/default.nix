{
  pkgs,
  lib,
  ...
}: let
  hyprstart = pkgs.writeShellScriptBin "hyprstart" (builtins.readFile ./hyprstart);
in {
  xdg.configFile."zsh-plugins".source = ./zsh-plugins;
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      sessionVariables = {LC_ALL = "en_US.UTF-8";};
      profileExtra = ''
        [ "$(tty)" = "/dev/tty1" ] && exec ${lib.getExe hyprstart} &
        # Hyprland &
      '';
      shellAliases = {};
      plugins = with pkgs; [
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
        {
          name = "zsh-notify"; # i forgit :skull:
          file = "auto-notify.plugin.zsh";
          src = fetchFromGitHub {
            owner = "MichaelAquilina";
            repo = "zsh-auto-notify";
            rev = "22b2c61ed18514b4002acc626d7f19aa7cb2e34c";
            sha256 = "x+6UPghRB64nxuhJcBaPQ1kPhsDx3HJv0TLJT5rjZpA=";
          };
        }
        {
          name = "zsh-fzf-history-search"; # i forgit :skull:
          file = "zsh-fzf-history-search.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "joshskidmore";
            repo = "zsh-fzf-history-search";
            rev = "d1aae98ccd6ce153c97a5401d79fd36418cd2958";
            sha256 = "4Dp2ehZLO83NhdBOKV0BhYFIvieaZPqiZZZtxsXWRaQ=";
          };
        }
      ];
      dirHashes = {
        docs = "$HOME/Documents";
        notes = "$HOME/Cloud/Notes";
        dev = "$HOME/Dev";
        dotfiles = "$HOME/.config/nyx";
        dl = "$HOME/Downloads";
        vids = "$HOME/Media/Videos";
        music = "$HOME/Media/Music";
        screenshots = "$HOME/Pictures/Screenshots";
        media = "$HOME/Media";
      };
      initExtra = ''
        # if [ "$TMUX" = "" ]; then tmux; fi
        export AUTO_NOTIFY_THRESHOLD=20
        export AUTO_NOTIFY_TITLE="%command finished"

        export PATH=$HOME/.cargo/bin/:$PATH
        export PATH=$HOME/.local/bin/:$PATH

        source $HOME/.config/zsh-plugins/lplugins.zsh
        cat $HOME/Documents/learn/notes/daily.norg
      '';
    };
  };
}
