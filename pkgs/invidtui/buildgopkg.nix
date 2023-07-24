{
  lib,
  buildGoModule,
  fetchFromGitHub,
  ...
}:
buildGoModule rec {
  pname = "invidtui";
  version = "0.3.2";

  ldflags = [
    "-s -w -X github.com/darkhz/invidtui/cmd.Version={{.Version}}@{{.ShortCommit}}"
  ];
  tags = [
    "production"
    "sqlite"
  ];

  vendorHash = "sha256-20vHaZzp8YUbQ1lUhJRHmuW7rZJhg8pm9G3eie5hHmM=";

  src =
    fetchFromGitHub
    {
      owner = "darkhz";
      repo = "invidtui";
      rev = "v${version}";
      sha256 = "sha256-20vHaZzp8YUbQ1lUhJRHmuW7rZJhg8pm9G3eie5hHmM=";
    };

  meta = with lib; {
    description = "A TUI based Invidious client";
    homepage = "github.com/darkhz/invidtui";
    license = licenses.mit;
    # maintainers = with maintainers; [];
  };
}
