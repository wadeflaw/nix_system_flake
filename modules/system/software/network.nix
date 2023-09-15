{ conf, ... }: {
  systemd.network = {
    enable = true;
    wait-online.enable = false;
  };
  networking = {
    hostName = "${conf.host}";

    networkmanager.enable = true;

    nameservers = [
      "9.9.9.9"
      "8.8.8.8"
      "1.1.1.1"
    ];

    firewall = {
      enable = false;
      allowedUDPPorts = [ 993 ];
    };

    wireguard = {
      enable = true;
    };
    wg-quick = {
      interfaces = {
        #       "RU".configFile = "/etc/wireguard/wg0.conf";
        #       "US".configFile = "/etc/wireguard/wg1.conf";
        #       "Germany".configFile = "/etc/wireguard/wg2.conf";
        #       "Sweden".configFile = "/etc/wireguard/wg3.conf";
      };
    };
    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "::1" = [ "localhost" "${conf.host}" ];
      "127.0.0.2" = [ "${conf.host}" ];
    };
  };
}
