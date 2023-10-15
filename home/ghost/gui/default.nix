{ pkgs
, inputs
, ...
}: {
  imports = [
    ./apps
    ./wms
    ./xdg
  ];

  home.packages = with pkgs; [
    # TODO
    # ayuagram
    obsidian
    logseq
    # invidtui
    # mpvpaper
    # mousai
    # spotify
    # gajim
    # libreoffice-fresh
    # element-desktop-wayland
  ];
}
