{
  pkgs,
  conf,
  config,
  lib,
  ...
}: {
  users.users = {
    "${conf.user}" = {
      hashedPassword = "${conf.passhash}";
      isNormalUser = true;
      extraGroups =
        [
          "wheel"
          "systemd-journal"
          "storage"
          "optical"
          "audio"
          "video"
          "input"
          "plugdev"
          "lp"
          "tss"
          "power"
          "nix"
        ]
        ++ lib.ifTheyExist config [
          "network"
          "networkmanager"
          "wireshark"
          "mysql"
          "docker"
          "podman"
          "git"
          "libvirtd"
        ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        zsh
      ];
    };
    root = {
      shell = pkgs.zsh;
      hashedPassword = "${conf.passhash}";
    };
  };
  security.doas.extraRules = [
    {
      users = ["${conf.user}"];
    }
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    wl-clipboard
    wireguard-tools
    unzip
  ];
}
