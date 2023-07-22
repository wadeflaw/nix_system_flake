zle -N autosuggest-orig-1-forward-word
zle -N autosuggest-orig-1-backward-word
bindkey    '^A' beginning-of-line
bindkey    '^E' end-of-line
bindkey -s '^L' 'clear^M'
bindkey    '^C' kill-line
bindkey    '^Z' undo
bindkey    '^[[1;5C'  .forward-word   
bindkey    '^[[1;5D'  .backward-word  
bindkey    '^[[1;5C'  autosuggest-orig-1-forward-word
bindkey    '^[[1;5D'  autosuggest-orig-1-backward-word
bindkey    '^[[1;5A'  history-incremental-search-backward # C-up
bindkey    '^[[1;5B'  history-incremental-search-forward  # C-down
bindkey    '^K'       up-line-or-history
bindkey    '^J'       down-line-or-history


