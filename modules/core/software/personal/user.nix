{
  pkgs,
  conf,
  ...
}: {
  users.users = {
    "${conf.user}" = {
      hashedPassword = "${conf.passhash}";
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
