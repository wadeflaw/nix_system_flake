{lib, ...}: {
  xdg.configFile."starship.toml".source = ./starship.toml;
  programs.starship = {
    enable = true;
    # settings = {
    #   format = "$directory$rust$git_branch\n$character";
    #   right_format = "$cmd_duration";
    #   add_newline = false;
    #   palette = "catppuccin_mocha";
    #   character = {
    #     success_symbol = "[](green bold)";
    #     error_symbol = "[](red)";
    #     vicmd_symbol = "[](#f9e2af)";
    #   };
    #   directory = {
    #     format = "[](surface0)[ ](bg:surface0 fg:text)[$path](bg:surface0 fg:text bold)[ ](surface0)";
    #     style = "bg:base fg:base";
    #     truncation_length = 3;
    #     truncate_to_repo = false;
    #   };
    #   git_branch = {
    #     format = " []($style)[[ ](bg:#24263a fg:#A2DD9D bold)$branch](bg:#24263a fg:#86AAEC)[ ]($style)";
    #     style = "bg:none fg:#24263a";
    #   };
    #   cmd_duration = {
    #     min_time = 1;
    #     format = "[]($style)[[神](bg:#24263a fg:#eba0ac bold)$duration](bg:#24263a fg:#BBC3DF)[ ]($style)";
    #     disabled = false;
    #     style = "bg:none fg:#24263a";
    #   };
    #   palettes.catppuccin_mocha = {
    #     rosewater = "#f5e0dc";
    #     flamingo = "#f2cdcd";
    #     pink = "#f5c2e7";
    #     mauve = "#cba6f7";
    #     red = "#f38ba8";
    #     maroon = "#eba0ac";
    #     peach = "#fab387";
    #     yellow = "#f9e2af";
    #     green = "#a6e3a1";
    #     teal = "#94e2d5";
    #     sky = "#89dceb";
    #     sapphire = "#74c7ec";
    #     blue = "#89b4fa";
    #     lavender = "#b4befe";
    #     text = "#cdd6f4";
    #     subtext1 = "#bac2de";
    #     subtext0 = "#a6adc8";
    #     overlay2 = "#9399b2";
    #     overlay1 = "#7f849c";
    #     overlay0 = "#6c7086";
    #     surface2 = "#585b70";
    #     surface1 = "#45475a";
    #     surface0 = "#313244";
    #     base = "#1e1e2e";
    #     mantle = "#181825";
    #     crust = "#11111b";
    #   };
    #   haskell.disabled = true;
    #   python.disabled = true;
    #   ruby.disabled = true;
    #   perl.disabled = true;
    #   package.disabled = true;
    #   lua.disabled = true;
    #   nodejs.disabled = true;
    #   java.disabled = true;
    #   golang.disabled = true;
    #   conda.disabled = true;
    #
    #   rust = {
    #     format = "[$symbol $version](dimmed green)"; 
    #     symbol = "🦀";
    #   };
    # };
  };
}
