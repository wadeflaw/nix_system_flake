{ pkgs, ... }: {
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        # drivers
        amdvlk
        mesa
        rocmPackages.clr.icd
        rocmPackages.clr
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
  environment.variables.AMD_VULKAN_ICD = "RADV";
}
