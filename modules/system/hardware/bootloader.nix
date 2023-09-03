{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor pkgs.linuxKernel.kernels.linux_xanmod_latest);
    #linux_lqx);

    tmp.cleanOnBoot = true;
    plymouth = {
      enable = false;
    };
    loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        configurationLimit = 3;
        # extraEntries = ''
        #   menuentry "artix" {
        #     set root=(hd0,gpt1)
        #     chainloader /EFI/grub/grubx64.efi
        #   }
        # '';
        theme = pkgs.catppuccin-grub;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    initrd = {
      verbose = false;
      systemd = {
        strip = true;
        enable = true;
      };
      kernelModules = [
        "amdgpu"
        "radeon"
        "kvm-amd"
        "btrfs"

        # "acpi_call"
      ];
      availableKernelModules = [
        "nvme"
        "usbhid"
        "sd_mod"
        "dm_mod"
        "tpm"
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
    };
    modprobeConfig = {
      enable = true;
    };
    # extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    # consoleLogLevel = 0;
    kernelParams = [
      # speed up guys
      "loglevel=3"
      # "udev.log_level=3"
      "logo.nologo"
      "quiet"
      "splash"
      "mitigations=off"
      "i8042.noaux=1"
      "module_blacklist=nvidia,nvidia_uvm,nvidia_drm,nvidia_modeset"

      "acpi_call"
      "rootfstype=btrfs"
      "page_alloc.shuffle=1"

      "pci=pcie_bus_perf"

      # Disables scatter/gather which was introduced with kernel version 6.2
      "amdgpu.sg_display=0"

      # enable IOMMU for devices used in passthrough and provide better host performance
      "iommu=pt"

      # ignore access time (atime) updates on files, except when they coincide with updates to the ctime or mtime
      "rootflags=noatime"

      # tty catppuccin colorscheme
      "vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166"
      "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173"
      "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"

      # prevent random wifi disconnection's
      "pcie_aspm.policy=performance"
    ];
    # disable random wifi disconnections
    extraModprobeConfig = ''
      options rtw88_core disable_lps_deep=y
      options rtw88_pci disable_msi=y disable_aspm=y
    '';
  };
}
