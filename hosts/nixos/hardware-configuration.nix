{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/rootnix";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
        "noatime"
        "ssd,space_cache=v2"
      ];
    };

  fileSystems."/home/ghost/Disc" =
    {
      device = "/dev/disk/by-label/artix_root";
      fsType = "btrfs";
      options = [
        "subvol=Disc"
        "compress=zstd"
        "noatime"
        "ssd,space_cache=v2"
      ];
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-label/BOOTNIX";
      fsType = "vfat";
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.system = "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "perfomance";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
