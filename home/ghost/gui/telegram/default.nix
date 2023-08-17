{pkgs, ...}: {
  imports = [./config.nix];
  home = {
    packages = with pkgs; let
      kotatogram-desktop-unwrapped = symlinkJoin {
        name = "kotatogram-desktop-unwrapped";
        paths = [kotatogram-desktop];
        buildInputs = [makeWrapper];
        postBuild = ''
          wrapProgram $out/bin/kotatogram-desktop \
            --set QT_QPA_PLATFORMTHEME "xdgdesktopportal"
        '';
      };
      telegram-desktop-unwrapped = symlinkJoin {
        name = "telegram-desktop-unwrapped";
        paths = [telegram-desktop];
        buildInputs = [makeWrapper];
        postBuild = ''
          wrapProgram $out/bin/telegram-desktop \
            --set QT_QPA_PLATFORMTHEME "xdgdesktopportal"
        '';
      };
    in [
      kotatogram-desktop-unwrapped
      telegram-desktop-unwrapped
    ];
  };
}
