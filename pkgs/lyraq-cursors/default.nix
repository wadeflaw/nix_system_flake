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

  meta = with lib; {
    description = "LyraQ-Cursors";
    homepage = "https://github.com/yeyushengfan258/Lyra-Cursors";
    license = licenses.gpl3;
    platforms = platforms.unix;
    maintainers = [maintainers.yeyushengfan258];
  };
}
