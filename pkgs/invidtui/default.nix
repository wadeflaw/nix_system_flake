{
  lib,
  yt-dlp,
  mpv,
  ffmpeg,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "invidtui";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "darkhz";
    repo = "invidtui";
    rev = "v${version}";
    hash = "sha256-IhyL3WlLSouV8+1Q1mF4ZMn2FXqbjelb+S48D2BNV0E=";
  };
  buildInputs = [
    yt-dlp
    mpv
    ffmpeg
  ];

  vendorHash = "sha256-65hl/xWdLAGsLmR6Lm1nFOXEbBIr2LxwFmBV8usVQxc=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/darkhz/invidtui/cmd.Version=${version}@${src.rev}"
  ];

  meta = with lib; {
    description = "A TUI based Invidious client";
    homepage = "https://github.com/darkhz/invidtui/";
    license = licenses.mit;
    maintainers = with maintainers; [];
  };
}
