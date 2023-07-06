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

record="wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')"
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

# nixos
FLAKE_PATH="/etc/nixos/stable/"

alias -g ncg="nix-collect-garbage && nix-collect-garbage -d && doas nix-collect-garbage && doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/*"
alias -g nrf="doas nixos-rebuild switch --flake $FLAKE_PATH"
alias -g hrf="home-manager switch --flake $FLAKE_PATH$1"
alias -g nsp="nix search nixpkgs"
alias -g fl="cd $FLAKE_PATH"
alias -g packages="ds nv $FLAKE_PATH/modules/home/package/default.nix"

