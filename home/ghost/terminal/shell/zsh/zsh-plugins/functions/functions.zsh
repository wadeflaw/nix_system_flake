# functions
  myip() {
    IP=$(curl -s ifconfig.me)
    echo "Your public IP address is: $IP"
    echo -n $IP | wl-copy
  }

  dr() {
    mkdir $1 && cd $_
  }

  sharetext() {
    echo "$@" | curl -F 'f:1=<-' ix.io
  }

  sharefile() {
    curl -F file=@<file> https://0x0.st
  }

  hackernews() {
    if [[ -z "$1" ]]; then
            curl hkkr.in
      else
          curl hkkr.in/n$1
      fi
  }

  crypto() {
    if [[ -z "$1" ]]; then
          curl rate.sx
      else
          curl rate.sx/$1/$2
      fi
  }

  weather() {
    curl wttr.in/$(curl -s ifconfig.me)
  }

  cheat() {
      query=$(echo $1 | tr ' ' '+')
      curl cheat.sh/$query
  }

  declare -A pomo_options
  pomo_options["work"]="2700"
  pomo_options["break"]="900"

  pomodoro () {
    if [ -n "$1" -a -n "''${pomo_options["$1"]}" ]; then
      val=$1
    echo $val | lolcat
      timer ''${pomo_options["$val"]}
    fi
  }

    alias wo="pomodoro 'work'"
    alias br="pomodoro 'break'"

  cpfile() {
    cat $1 | wl-copy
    echo ${wl-paste}
  }

  wgc() {
      doas wg-quick $2 $1
  }

  ytmpv() {
    mpv $(ytdlp -f best --get-url "$1")
  }

  lyall() {
    hyprctl keyword input:kb_layout us,ru,ua
  }

