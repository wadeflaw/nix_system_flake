{pkgs, ...}: {
  plugins.neorg = {
    enable = true;
    package = pkgs.vimPlugins.neorg;
    lazyLoading = true;
    modules = {
      "core.defaults" = {};
      "core.keybinds" = {
        config.default_keybinds = true;
      };
      "core.dirman" = {};
      "core.completion" = {
        config.engine = "nvim-cmp";
      };
      "core.concealer" = {
        config.icon_preset = "varied";
      };
      "core.highlights" = {};
      "core.highlightscore.keybinds" = {};
      "core.integrations.treesitter" = {};
      "core.mode" = {};
      "core.neorgcmd" = {};
      "core.pivot" = {};
      "core.promo" = {};
    };
  };
}
