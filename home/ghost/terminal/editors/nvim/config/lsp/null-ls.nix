{...}: {
  config.plugins.null-ls = {
    enable = true;
    cmd = ["bash -c nvim"];
    debug = false;
    logLevel = "error";
    sources = {
      code_actions = {
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = false;
        deadnix.enable = false;
      };
      formatting = {
        alejandra.enable = true;
        stylua.enable = true;
        shfmt.enable = false;
        nixpkgs_fmt.enable = true;
        prettier.enable = true;
      };
    };
  };
}
