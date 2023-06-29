{
  lib,
  stdenv,
  ...
}:
stdenv.mkDerivation {
  pname = "lyraq-cursors";
  version = "1";
  src = ./lyraq-cursors;

  installPhase = ''
    mkdir -p $out/share/icons/LyraQ-cursors
    cp -r $src/* $out/share/icons/LyraQ-cursors
  '';
    runHook preInstall
    runHook postInstall

  meta = {
    description = "LyraQ-Cursors";
    homepage = "https://github.com/yeyushengfan258/Lyra-Cursors";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.yeyushengfan258];
  };
}
