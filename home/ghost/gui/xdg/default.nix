{
  pkgs,
  conf,
  config,
  ...
}: let
  browser = ["${config.defaultApplications.browser.desktop}.desktop"];
  pdfreader = ["org.pwmt.zathura.desktop.desktop"];
  telegram = ["kotatogram-desktop.desktop"];
  filemanager = ["nemo.desktop"];
  torrent = ["transmission.desktop"];
  video = ["mpv.desktop"];
  image = ["imv.desktop"];
  editor = ["${config.defaultApplications.editor.desktop}.desktop"];

  associations = {
    "text/html*" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/unknown" = browser;
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/xhtml+xml" = browser;
    "application/x-extension-xhtml" = browser;
    "application/x-extension-xht" = browser;
    "application/json" = browser;

    "audio/*" = video;
    "video/*" = video;
    "image/*" = image;
    "inode/directory" = filemanager;
    "application/pdf" = pdfreader;
    "x-scheme-handler/tg" = telegram;
    "x-scheme-handler/spotify" = ["spotify.desktop"];
    "x-scheme-handler/discord" = ["WebCord.desktop"];
    "x-scheme-handler/magnet" = torrent;
    "x-scheme-handler/application/x-bittorrent" = torrent;

    # "text/rust*" = editor;
    # "text/x-python*" = editor;
    # "text"
  };
  home = config.home.homeDirectory;
in {
  defaultApplications = {
    terminal = {
      cmd = "${pkgs.foot}/bin/footclient";
      desktop = "footclient";
    };
    browser = {
      cmd = "${pkgs.firefox}/bin/firefox";
      desktop = "firefox";
    };
    editor = {
      cmd = "${pkgs.neovim}/bin/nvim";
      desktop = "nvim";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = false;
      documents = "${home}/docs";
      download = "${home}/dl";
      desktop = "${home}/desk";
      music = "${home}/music";
      pictures = "${home}/pics";
      videos = "${home}/vids";

      extraConfig = {
        # XDG_DEVELOPMENT_DIR = "${config.xdg.userDirs.documents}/Dev";
      };
    };

    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };
  # home.activation."mimeapps-remove" = {
  #   before = ["checkLinkTargets"];
  #   after = [];
  #   data = "rm -f /home/${conf.user}/.config/mimeapps.list";
  # };
}
