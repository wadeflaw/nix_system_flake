{
  lib,
  stdenv,
  fetchTarball,
}:
stdenv.mkDerivation rec {
  pname = "nvidtui";
  version = "0.3.2";

  src = fetchTarball {
    url = "https://github.com/darkhz/invidtui/releases/download/v${version}/invidtui_${version}_Linux_x86_64.tar.gz";
    sha256 = "";
  };

  installPhase = ''
    mkdir -p $out
    cp -r $out
  '';
}
