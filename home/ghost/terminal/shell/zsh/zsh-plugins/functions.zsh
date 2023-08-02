    # functions
        wgc() {
            doas wg-quick $2 $1
        }

        ytmpv() {
          mpv $(ytdlp -f best --get-url "$1")
        }

        lyall() {
          hyprctl keyword input:kb_layout us,ru,ua
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

