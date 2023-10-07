{ pkgs
, conf
, config
, lib
, ...
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
          "docker"
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

  environment.systemPackages = with pkgs; [
    home-manager
    wireguard-tools
  ];
}
