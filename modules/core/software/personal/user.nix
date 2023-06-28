{ pkgs
, inputs
, ...
}:
let
  username = "ghost";
  initialPassword = "azd34u67";
in
{
  users.users = {
    ${username} = {
      isNormalUser = true;
      initialPassword = "${initialPassword}";
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
    root.initialPassword = "${initialPassword}";
  };
  security.doas.extraRules = [
    {
      users = [ "${username}" ];
    }
  ];
}
