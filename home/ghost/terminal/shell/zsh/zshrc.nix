{config, ...}: let
  inherit (config.colorscheme) colors;
in {
  programs.zsh.initExtra = ''
    # fzf history search
    autoload fzf_history_search
    zle -N fzf_history_search
    bindkey '^r' fzf_history_search

    set -k

    export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$PATH
    export AUTO_NOTIFY_THRESHOLD=20 \
           AUTO_NOTIFY_TITLE="%command finished" \
           \
           ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS="0" \
           ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH="0"

           export FZF_DEFAULT_OPTS="
             --color gutter:-1
             --color bg+:-1
             --color bg:-1
             --color spinner:#${colors.base06}
             --color hl:#${colors.base08}
             --color fg:#${colors.base05}
             --color header:#${colors.base08}
             --color info:#${colors.base0E}
             --color pointer:#${colors.base06}
             --color marker:#${colors.base06}
             --color fg+:#${colors.base05}
             --color prompt:#${colors.base0E}
             --color hl+:#${colors.base08}
             --color preview-bg:-1
             --color preview-fg:#${colors.base08}
             --prompt ' '
             --pointer ''
             --layout=reverse
             -m --bind ctrl-space:toggle,pgup:preview-up,pgdn:preview-down
             "

    zstyle ':completion:*' use-cache on
    zstyle ':completion:*' cache-path '"$XDG_CACHE_HOME"/zsh/.zcompcache'
    zstyle ':completion:*' sort false
    zstyle ':completion:complete:*:options' sort false
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
    zstyle ':completion:*' special-dirs true
    zstyle ':completion:*' rehash true

    zstyle ':completion:*' menu yes select # search
    zstyle ':completion:*' list-grouped false
    zstyle ':completion:*' list-separator '''
    zstyle ':completion:*' group-name '''
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*:warnings' format '%F{red}%B-- No match for: %d --%b%f'
    zstyle ':completion:*:messages' format '%d'
    zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
    zstyle ':completion:*:descriptions' format '[%d]'

    # Fuzzy match mistyped completions.
    zstyle ':completion:*' completer _complete _match _approximate
    zstyle ':completion:*:match:*' original only
    zstyle ':completion:*:approximate:*' max-errors 1 numeric

    # Don't complete unavailable commands.
    zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

    # Array completion element sorting.
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

    # Colors
    zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}

    # Jobs id
    zstyle ':completion:*:jobs' numbers true
    zstyle ':completion:*:jobs' verbose true

    # fzf-tab
    zstyle ':fzf-tab:complete:_zlua:*' query-string input
    zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
    zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'
    zstyle ':fzf-tab:complete:kill:*' popup-pad 0 3
    zstyle ':fzf-tab:complete:ls:*' fzf-preview 'exa -1 --color=always $realpath'
    zstyle ':fzf-tab:complete:ls:*' popup-pad 30 0
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
    zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
    zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'exa -1 --color=always $realpath'
    zstyle ':fzf-tab:complete:nvim:*' popup-pad 30 0

    zstyle ':fzf-tab:*' switch-group ',' '.'
    zstyle ":completion:*:git-checkout:*" sort false
    zstyle ':completion:*' file-sort modification
    zstyle ':completion:*:exa' sort false
    zstyle ':completion:files' sort false

    # Autosuggest
    ZSH_AUTOSUGGEST_USE_ASYNC="true"


    bindkey    '^A' beginning-of-line
    bindkey    '^E' end-of-line
    bindkey -s '^L' 'clear^M'
    bindkey    '^C' kill-line
    bindkey    '^Z' undo
    bindkey    '^[[1;5C'  .forward-word
    bindkey    '^[[1;5D'  .backward-word
    bindkey    '^[[1;5A'  history-incremental-search-backward # C-up
    bindkey    '^[[1;5B'  history-incremental-search-forward  # C-down
    bindkey    '^K'       up-line-or-history
    bindkey    '^J'       down-line-or-history

    # Vi mode
    bindkey -v

    bindkey "^A" vi-beginning-of-line
    bindkey "^E" vi-end-of-line

    path+="$HOME/.config/zsh-plugins/*"
    fpath+="$HOME/.config/zsh-plugins/*"

    if [[ -f "$HOME/.config/zsh-plugins/aliases/aliases.plugin.zsh" ]]; then
      source "$HOME/.config/zsh-plugins/aliases/aliases.plugin.zsh"
    fi
    if [[ -f "$HOME/.config/zsh-plugins/functions/functions.plugin.zsh" ]]; then
      source "$HOME/.config/zsh-plugins/functions/functions.plugin.zsh"
    fi
    if [[ -f "$HOME/.config/zsh-plugins/tprompt/tprompt.plugin.zsh" ]]; then
      source "$HOME/.config/zsh-plugins/tprompt/tprompt.plugin.zsh"
    fi

  '';
}
