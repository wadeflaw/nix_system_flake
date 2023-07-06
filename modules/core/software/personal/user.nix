{
  pkgs,
  conf,
  ...
}: {
  users.users = {
    "${conf.user}" = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "input"
        "power"
        "storage"
        "optical"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        zsh
      ];
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
