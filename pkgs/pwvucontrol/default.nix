{
  lib,
  stdenv,
  fetchFromGitHub,
  cargo,
  meson,
  ninja,
  pkg-config,
  rustPlatform,
  rustc,
  wrapGAppsHook4,
  cairo,
  gdk-pixbuf,
  glib,
  gtk4,
  libadwaita,
  pango,
  pipewire,
}:
stdenv.mkDerivation rec {
  pname = "pwvucontrol";
  version = "0.2";

  src = fetchFromGitHub {
    owner = "saivert";
    repo = "pwvucontrol";
    rev = version;
    hash = "sha256-jBvMLewBZi4LyX//YUyJQjqPvxnKqlpuLZAm9zpDMrA=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "libspa-0.6.0" = "sha256-CVLQ9JXRMo78/kay1TpRgRuk5v/Z5puPVMzLA30JRk8=";
      "wireplumber-0.1.0" = "sha256-wkku9vqIMdV+HTkWCPXKH2KM1Xzf0xApC5zrVmgxhsA=";
    };
  };

  nativeBuildInputs = [
    cargo
    meson
    ninja
    pkg-config
    rustPlatform.bindgenHook
    rustPlatform.cargoSetupHook
    rustc
    wrapGAppsHook4
  ];

  buildInputs = [
    cairo
    gdk-pixbuf
    glib
    gtk4
    libadwaita
    pango
    pipewire
  ];

  meta = with lib; {
    description = "Pipewire Volume Control";
    homepage = "https://github.com/saivert/pwvucontrol";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [];
  };
}
