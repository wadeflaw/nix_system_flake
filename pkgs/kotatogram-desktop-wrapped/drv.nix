{
  kotatogram-desktop,
  makeWrapper,
  symlinkJoin,
}:
symlinkJoin {
  name = "kotatogram-desktop-unwrapped";
  paths = [kotatogram-desktop];
  buildInputs = [makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/kotatogram-desktop \
      --set QT_QPA_PLATFORMTHEME "xdgdesktopportal"
  '';
}
# stdenv.mkDerivation {
#   name = "kotatogram-desktop-unwrapped";
#
#   src = ./.;
#
#   nativeBuildInputs = [makeWrapper];
#
#   installPhase = ''
#     mkdir -p $out/bin
#     ln -s ${kotatogram-desktop}/bin/kotatogram-desktop $out/bin
#     makeWrapper $out/bin/kotatogram-desktop
#       --set QT_QPA_PLATFORMTHEME "xdgdesktopportal"
#   '';
# }
