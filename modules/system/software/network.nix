{ conf
, config
, lib
, ...
}: {
  systemd.network = {
    enable = true;
    wait-online.enable = false;
  };
  
  services.resolved.extraConfig = "
    ${lib.concatStringsSep "\n" (map (s: "nameserver " + s) config.networking.nameservers)}
  ";

  networking = {
    hostName = "${conf.host}";

    networkmanager = {
      enable = true;
      # dns = "";
    };
    resolvconf.useLocalResolver = false;
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
      enable = false;
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
