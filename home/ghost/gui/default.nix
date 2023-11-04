{ 
# pkgs
# , inputs
# , ...
...
}: {
  imports = [
    ./apps
    ./wms
    ./xdg
    ./dev
  ];

  # home.packages = with pkgs; [
    # invidtui
    # mpvpaper
    # mousai
    # gajim
    # libreoffice-fresh
  # ];
}
