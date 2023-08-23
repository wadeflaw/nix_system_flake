{ lib
, inputs
, self
, pkgs
, ...
}:
let
  spicePkgs = inputs.spicetify.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify.homeManagerModule ];
  # config = lib.mkIf (config.programs) {
  programs.spicetify = {
    spotifyPackage = pkgs.spotify-wrapped;
    enable = true;
    injectCss = true;
    replaceColors = true;

    overwriteAssets = true;
    sidebarConfig = true;
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
      new-releases
    ];

    theme = spicePkgs.themes.catppuccin-mocha;
    colorScheme = "flamingo";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      playlistIcons
      lastfm
      genre
      historyShortcut
      bookmark
      fullAlbumDate
      groupSession
      popupLyrics
    ];
  };
  # };
}
