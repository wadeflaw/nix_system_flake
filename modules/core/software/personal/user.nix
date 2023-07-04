{
  pkgs,
  conf,
  ...
}: {
  users.users = {
    "${conf.user}" = {
      isNormalUser = true;
      initialPassword = "${conf.pass}";
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
    root.initialPassword = "${conf.pass}";
  };
  security.doas.extraRules = [
    {
      users = ["${conf.user}"];
    }
  ];

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    wl-clipboard
    wireguard-tools
    unzip
  ];
}
