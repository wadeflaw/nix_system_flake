# ## Colorize the grep command output for ease of use (good for log files)##
# alias grep='grep --color=auto'
# alias egrep='egrep --color=auto'
# alias fgrep='fgrep --color=auto'

# #readable output
# alias df='df -h'

# #free
# alias free="free -mt"

#continue download
alias -g wget="wget -c"

alias record="wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')"
#Recent Installed Packages
# alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
# alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# #Cleanup orphaned packages
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Apps alias

# Alias 
# Replacement Icons for ls 
alias -g ls="ls --color"
alias -g ll="ls --color -l"
alias -g la="ls --color -a"
alias -g lt="ls --color -lT"
alias -g lta="ls --color -lTa"
alias -g l="ls --color -l"
alias -g cl="clear"
alias -g nv="nvim"

alias -g znv="zellij r  -- nv"

# faster navigation
alias -g cd..='cd ..'
alias -g cd...='cd ../..'
alias -g cd....='cd ../../..'
alias -g cd.....='cd ../../../..'

# quality of life aliases
alias -g n="clear && neofetch"
alias -g v="nvim"
alias notes="cd ~/Documents/learn/notes/ && nvim"
alias pac='yay'
alias lsblk='lsblk -o NAME,FSTYPE,SIZE,TYPE,MOUNTPOINTS,STATE,FSSIZE,FSAVAIL'
alias doo='doas'
alias -g cl='clear'
alias -g ds='doas'
alias -g sudo='doas'
alias sudoedit='doas nvim'
alias -g myip='curl ifconfig.me'
alias zel='zellij'
# alias nvim='lvim'
alias ytdlp='yt-dlp --audio-quality 10'

alias ytmp3="yt-dlp -x --continue --add-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0 --metadata-from-title='%(artist)s - %(title)s' --prefer-ffmpeg -o '%(title)s.%(ext)s'"
alias cat="bat --style=plain"
alias grep="ripgrep"
alias du="du-dust"
alias ps="procs"
alias mp="mkdir -p"
alias fcd="cd $(find -type d | fzf)"
alias ls="exa -h --git --icons --color=auto --group-directories-first -s extension"
alias l="ls -lF --time-style=long-iso --icons"
# system aliases
alias sc="sudo systemctl"
alias jc="sudo journalctl"
alias scu="systemctl --user "
alias jcu="journalctl --user"
alias burn="pkill -9"
alias diff="diff --color=auto"
alias killall="pkill"

# nixos
FLAKE_PATH="/etc/nixos/stable/"

alias -g ncg="nix-collect-garbage && nix-collect-garbage -d && doas nix-collect-garbage && doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/*"
alias -g nrf="doas nixos-rebuild switch --flake $FLAKE_PATH"
alias -g hrf="home-manager switch --flake $FLAKE_PATH$1"
alias -g nsp="nix search nixpkgs"
alias -g fl="cd $FLAKE_PATH"
alias -g packages="ds nv $FLAKE_PATH/modules/home/package/default.nix"

alias rebuild="nix-store --verify; pushd ~dotfiles ; nixos-rebuild switch --flake .#$1 --use-remote-sudo && notify-send \"Done\" ; popd"

alias test="pushd ~dotfiles nixos-rebuild dry-activate"

alias cleanup="sudo nix-collect-garbage --delete-older-than 3d && nix-collect-garbage -d"

alias bloat="nix path-info -Sh /run/current-system"

alias curgen="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"

alias gc-check="nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\""

alias repair="nix-store --verify --check-contents --repair"

alias run="nix run $@"
alias search="nix search $@"
alias shell="nix shell $@"

