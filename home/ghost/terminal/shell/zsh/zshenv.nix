_: {
  programs.zsh.envExtra = ''
    export PATH=$HOME/{.cargo/bin,.local/bin}:$PATH
    # vars
    export AUTO_NOTIFY_THRESHOLD=20 \
           AUTO_NOTIFY_TITLE="%command finished" \
           \
           ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS="0" \
           ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH="0"

           export FZF_DEFAULT_OPTS="
             --color gutter:-1
             --color bg+:-1
             --color bg:-1
             --color spinner:#f5e0dc
             --color hl:#f38ba8
             --color fg:#cdd6f4
             --color header:#f38ba8
             --color info:#cba6f7
             --color pointer:#f5e0dc
             --color marker:#f5e0dc
             --color fg+:#cdd6f4
             --color prompt:#cba6f7
             --color hl+:#f38ba8
             --color preview-bg:#1e1e2e
             --color preview-fg:#f38ba8
             --prompt ' '
             --pointer ''
             --layout=reverse
             -m --bind ctrl-space:toggle,pgup:preview-up,pgdn:preview-down
             "

  '';
}
