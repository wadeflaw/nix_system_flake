_: {
  xdg.configFile."zellij".source = ./config;
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
  };
}
