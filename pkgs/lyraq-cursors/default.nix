{
  lib,
  stdenv,
  fetchzip,
  ...
}:
stdenv.mkDerivation rec {
  pname = "lyraq-cursors";
  version = "1";
  src = fetchzip {
    url = "https://codeberg.org/ghosty/lyraq-cursors/archive/master.zip";
    sha256 = "sha256-2h9jHvXbzFNCTCFOvXbs3ODXdzcxnzz6KAw010Bu/QQ=";
  };
  installPhase = ''
    mkdir -p $out/share/icons/LyraQ-cursors
    cp -r * $out/share/icons/LyraQ-cursors
  '';
  meta = {
    description = "LyraQ-Cursors";
    homepage = "https://github.com/yeyushengfan258/Lyra-Cursors";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    maintainers = [lib.maintainers.yeyushengfan258];
  };
}


