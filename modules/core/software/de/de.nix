{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "gnome";
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    desktopManager = {
      gnome.enable = true;
    };
  };
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gedit # text editor
      epiphany # web browser
      geary # email reader
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      yelp # Help view
      gnome-contacts
      gnome-initial-setup
    ]);
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
  ];

  #   gnome.excludePackages = with pkgs; [
  #     # gnome-control-center
  #     epiphany
  #     gnome.gnome-boxes
  #     gnome.gnome-calculator
  #     gnome.gnome-calendar
  #     gnome.gnome-contacts
  #     gnome.gnome-maps
  #     gnome.gnome-music
  #     gnome.gnome-weather
  #     gnome.gnome-clocks
  #     gnome-photos
  #     gnome.gnome-software
  #     gnome-user-docs
  #     gnome.totem
  #     yelp
  #     gnome.gnome-user-share
  #     gnome.gnome-characters
  #     simple-scan
  #     gnome.eog
  #     gnome.rygel
  #     evolution-data-server
  #     gnome.gnome-font-viewer
  #     gnome.gnome-remote-desktop
  #     gnome.gnome-logs
  #     orca
  #     malcontent
  #   ];
}
