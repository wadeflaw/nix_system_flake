# {...}: {
# xdg.configFile."starship.toml".source = ./starship.toml;
{config, ...}: {
  home = {
    sessionVariables = {
      STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      battery.disabled = true;
      add_newline = false;
      scan_timeout = 3;
      right_format = "$git_status $git_branch $cmd_duration";

      character = {
        error_symbol = "[](bold red)";
        success_symbol = "[](bold green)";
        vicmd_symbol = "[](bold yellow)";
        format = "$symbol [|](bold bright-black) ";
      };

      git_commit = {commit_hash_length = 5;};
      git_status = {
        format = "$all_status";
        conflicted = "=";
        ahead = "⇡$count";
        behind = "⇣$count";
        diverged = "⇕⇡$ahead_count⇣$behind_count";
        up_to_date = "";
        untracked = "?$count";
        stashed = "";
        modified = "!$count";
        staged = "+$count";
        renamed = "»$count";
        deleted = "$count";
      };
      line_break.disabled = false;

      lua.symbol = "[](blue) ";
      python.symbol = "[](blue) ";
      nix_shell.symbol = "[](blue) ";
      rust.symbol = "[](red) ";
      package.symbol = "📦  ";

      cmd_duration = {
        min_time = 1;
      };

      hostname = {
        ssh_only = true;
        format = "@[$hostname](bold blue) ";
        disabled = false;
      };
    };
  };
}
# }
