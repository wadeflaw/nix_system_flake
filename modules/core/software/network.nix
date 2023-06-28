{ ... }: {
  systemd.network.wait-online.enable = false;
  networking = {

    hostName = "nixos";

    networkmanager.enable = true;

    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];

    firewall = {
      enable = true;
      allowedUDPPorts = [ 993 ];
    };

    wg-quick = {
      interfaces = {
        #       "Russian".configFile = "/etc/wireguard/wg0.conf";
        #       "US".configFile = "/etc/wireguard/wg1.conf";
        #       "Germany".configFile = "/etc/wireguard/wg2.conf";
        #       "Sweden".configFile = "/etc/wireguard/wg3.conf";
      };
    };
    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "::1" = [ "localhost" "nixos" ];
      "127.0.0.2" = [ "nixos" ];
      "0.0.0.0" = [ "pornhub.com" "xvideos.com" "youtube.com" ];
    };
  };
}
