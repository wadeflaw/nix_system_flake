{ pkgs
, config
, ...
}: {
  imports = [
    ./tools
    ./shell
    ./emulators
    ./editors
  ];

  programs.gpg.homedir = "${config.xdg.configHome}/gnupg";
}
