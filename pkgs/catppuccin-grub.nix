{ lib
, stdenv
, fetchzip
, ...
}:
stdenv.mkDerivation rec {
  pname = "catppuccin-grub";
  version = "1";
  src = fetchzip {
    url = "https://github.com/catppuccin/grub/archive/refs/heads/main.zip";
    sha256 = "sha256-/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
  };
  installPhase = ''
    mkdir -p $out
    cp -r src/catppuccin-mocha-grub-theme/* $out/  
  '';
  meta = {
    description = "catppuccin-grub";
  };
}


