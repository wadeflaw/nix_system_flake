{
  config,
  lib,
  conf,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/rootnix";
      fsType = "btrfs";
      options = [
        "subvol=root"
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-label/rootnix";
      fsType = "btrfs";
      options = [
        "subvol=home"
        "compress=zstd"
        "noatime"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/home/${conf.user}/Disc" = {
      device = "/dev/disk/by-label/artix_root";
      fsType = "btrfs";
      options = [
        "subvol=Disc"
        "compress=zstd"
        "noatime"
        "ssd,space_cache=v2"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-label/rootnix";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "compress=zstd"
        "noatime"
        "nodatacow"
        "ssd"
        "space_cache=v2"
      ];
    };

    "/var/log" = {
      device = "/dev/disk/by-label/rootnix";
      fsType = "btrfs";
      options = [
        "subvol=log"
        "compress=zstd"
        "noatime"
        "nodatacow"
        "ssd"
        "space_cache=v2"
      ];
    };
    ${config.boot.loader.efi.efiSysMountPoint} = {
      device = "/dev/disk/by-label/BOOTNIX";
      fsType = "vfat";
    };
  };
  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.system = "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "perfomance";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
