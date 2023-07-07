{
  pkgs,
  # , config
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "M-t";
    clock24 = true;
    shell = "${pkgs.zsh}/bin/zsh";
    historyLimit = 10000;
    keyMode = "vi";
    mouse = true;
    resizeAmount = 10;
    newSession = true;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;

    extraConfig = ''
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';

    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      sensible
      tmux-fzf
      vim-tmux-navigator
      yank
    ];
  };
}
