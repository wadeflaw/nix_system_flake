{
  pkgs,
  conf,
  config,
  ...
}: let
  browser = ["firefox.desktop"];
  zathura = ["org.pwmt.zathura.desktop.desktop"];
  filemanager = ["nemo.desktop"];

  associations = {
    "text/html" = browser;
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

    "audio/*" = ["mpv.desktop"];
    "video/*" = ["mpv.dekstop"];
    "image/*" = ["imv.desktop"];
    "application/json" = browser;
    "application/pdf" = zathura;
    "x-scheme-handler/tg" = ["telegramdesktop.desktop"];
    "x-scheme-handler/spotify" = ["spotify.desktop"];
    "x-scheme-handler/discord" = ["WebCord.desktop"];
    "inode/directory" = filemanager;
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
