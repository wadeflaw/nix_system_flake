{
  pkgs,
  lib,
  ...
}: {
  wrappers.kotatogram-desktop = {
    basePackage = pkgs.kotatogram-desktop;
    env.QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
  };
}
