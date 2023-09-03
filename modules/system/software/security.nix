{
  config,
  lib,
  pkgs,
  ...
}: {
  security = {
    rtkit.enable = true;
    sudo.enable = false;
    pam = {
      services.gtklock = {};
      loginLimits = [
        {
          domain = "@wheel";
          item = "nofile";
          type = "soft";
          value = "524288";
        }
        {
          domain = "@wheel";
          item = "nofile";
          type = "hard";
          value = "1048576";
        }
      ];
    };
    doas = {
      enable = lib.mkDefault (!config.security.sudo.enable);
      extraConfig = ''
        permit persist keepenv :wheel
        permit nopass root
        permit nopass :wheel cmd poweroff
        permit nopass :wheel cmd brillo
        permit nopass :wheel cmd reboot
        permit nopass :wheel cmd rfkill
      '';

      # TODO extra rules won't keep env, fix that
      # extraRules = [
      #   {
      #     groups = ["wheel"];
      #     persist = true;
      #     keepEnv = true;
      #   }
      #   {
      #     groups = ["wheel"];
      #     noPass = true;
      #     cmd = "${pkgs.systemd}/bin/poweroff";
      #   }
      #   {
      #     groups = ["wheel"];
      #     noPass = true;
      #     cmd = "${pkgs.systemd}/bin/reboot";
      #   }
      #   {
      #     groups = ["wheel"];
      #     cmd = "${pkgs.brillo}/bin/brillo";
      #     noPass = true;
      #   }
      #   {
      #     groups = ["wheel"];
      #     cmd = "rfkill";
      #     noPass = true;
      #   }
      # ];
    };
    #   protectKernelImage = true;
  };
}
# boot = {
#   kernel.sysctl = {
#     "kernel.sysrq" = 0;
#     "kernel.ftrace_enabled" = false;
#   };
#   blacklistedKernelModules =
#   [
#     # Obscure network protocols
#     "ax25"
#     "netrom"
#     "rose"
#     # Old or rare or insufficiently audited filesystems
#     "adfs"
#     "affs"
#     "bfs"
#     "befs"
#     "cramfs"
#     "efs"
#     "erofs"
#     "exofs"
#     "freevxfs"
#     "f2fs"
#     "vivid"
#     "gfs2"
#     "ksmbd"
#     "nfsv4"
#     "nfsv3"
#     "cifs"
#     "nfs"
#     "cramfs"
#     "freevxfs"
#     "jffs2"
#     "hfs"
#     "hfsplus"
#     "squashfs"
#     "udf"
#     "btusb"
#     "hpfs"
#     "jfs"
#     "minix"
#     "nilfs2"
#     "omfs"
#     "qnx4"
#     "qnx6"
#     "sysv"
#   ];
# };
