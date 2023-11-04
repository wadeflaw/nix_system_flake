{...}:''
{
  "layer": "top",
  "height": 30,
  "modules-left": ["hyprland/workspaces"],

  "modules-center": ["clock"],

  "modules-right": [
    "battery",
    "wireplumber",
    "cpu",
    "memory",
    "hyprland/language",
    "custom/separator"
  ],

  "hyprland/window": {
    "max-length": 50
  },
  "hyprland/language": {
    "format": "{}",
    "format-en": "us",
    "format-ru": "ru",
    "format-uk": "ua",
    "on-click": "hyprctl switchxkblayout at-translated-set-2-keyboard next"
  },
  "hyprland/workspaces": {
    // "on-click": "activate",
    "sort-by-number": true
    /* "persistent_workspaces": { */
    /*   "1": [], */
    /*   "2": [], */
    /*   "3": [], */
    /*   "4": [], */
    /*   "5": [], */
    /*   "6": [], */
    /* }, */
  },
  "cpu": {
    "format": "cpu: {}%",
    "interval": 1,
    "on-click": "footclient -e btop"
  },
  "memory": {
    "format": "mem: {}%",
    "interval": 1,
    "on-click": "footclient -e btop"
  },
  "wireplumber": {
    "format": "vol {volume}%",
    "format-muted": "muted"
  },
  "clock": {
    "interval": 1,
    "format": "{:%I:%M %p}",
    "format-alt": "{:%Y.%m.%d %I:%M %p}"
  },
  "custom/separator": {
    "format": "       ",
    "interval": "once",
    "tooltip": false
  }
}
''
