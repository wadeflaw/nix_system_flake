{config, ...}: {
  programs.schizofox = {
    enable = true;

    theme = let
      inherit (config.colorscheme) colors;
    in {
      background-darker = "${colors.base01}";
      background = "${colors.base00}";
      foreground = "${colors.base05}";
      font = "Jost*";
      # extraCss = ''
      #   :root {
      #
      #     --tab-font-size: 15px;
      #     --tab-font-family: Jost*;
      #     --max-tab-width: none;
      #     --tab-height: 20px;
      #   }
      #
      #   .titlebar-buttonbox-container {
      #     display: var(--show-titlebar-buttons);
      #   }
      #
      #   :root:not([customizing]) #TabsToolbar {
      #     margin-left: 1px !important;
      #     margin-right: 1px !important;
      #     border-radius: 0 !important;
      #     padding: 0 !important;
      #   }
      #   .tabbrowser-tab * {
      #     margin: 0 !important;
      #     border-radius: 0 !important;
      #     font-family: var(--tab-font-family) !important;
      #   }
      #   .tabbrowser-tab {
      #     height: var(--tab-height);
      #     font-size: var(--tab-font-size) !important;
      #     min-height: 0 !important;
      #   }
      #   .tabbrowser-tab[fadein]:not([pinned]) {
      #     max-width: var(--max-tab-width) !important;
      #   }
      #   .tab-close-button,
      #   .new-tab-button,
      #   #firefox-view-button,
      #   #scrollbutton-up,
      #   .tab-secondary-label {
      #     display: none !important;
      #   }
      #
      #   #tabs-newtab-button,
      #   #titlebar spacer {
      #     display: none !important;
      #   }
      #
      #   :root:not([customizing]) #nav-bar {
      #     min-height: 2.5em !important;
      #     height: 2.5em !important;
      #     margin: 0 0 -2.5em !important;
      #     z-index: -1000 !important;
      #     opacity: 0 !important;
      #   }
      #
      #   :root:not([customizing]) #nav-bar:focus-within {
      #     z-index: 1000 !important;
      #     opacity: 1 !important;
      #   }
      #
      #   #nav-bar {
      #     border-inline: var(--uc-window-drag-space-width) solid var(--toolbar-bgcolor);
      #   }
      #   #new-tab-button,
      #   #alltabs-button,
      #   #scrollbutton-down,
      #   .tab-loading-burst {
      #     display: none;
      #   }
      #   #titlebar {
      #     overflow: none !important;
      #   }
      #
      #   :root[sizemode="normal"] #nav-bar {
      #     --uc-window-drag-space-width: 20px;
      #   }
      #
      #   #titlebar {
      #     -moz-appearance: none !important;
      #   }
      #   #TabsToolbar {
      #     min-height: 0px !important;
      #   }
      #
      #   #tabbrowser-tabs,
      #   #tabbrowser-tabs > .tabbrowser-arrowscrollbox,
      #   #tabbrowser-arrowscrollbox {
      #     min-height: 0 !important;
      #   }
      #
      #   :root:not([customizing]) #tabbrowser-tabs .tabs-newtab-button,
      #   :root:not([customizing]) #tabs-newtab-button,
      #   :root:not([customizing]) #TabsToolbar-customization-target > .toolbarbutton-1,
      #   :root:not([customizing]) #TabsToolbar .titlebar-button {
      #     -moz-appearance: none !important;
      #     height: 0px;
      #     padding-top: 0px !important;
      #     padding-bottom: 0px !important;
      #     -moz-box-align: stretch;
      #     margin: 0 !important;
      #   }
      #
      #   .accessibility-indicator,
      #   .private-browsing-indicator {
      #     height: unset !important;
      #   }
      #   .accessibility-indicator > hbox {
      #     padding-block: 0 !important;
      #   }
      #
      #   #tabbrowser-tabs
      #     .tabbrowser-tab[first-visible-tab="true"][last-visible-tab="true"] {
      #     visibility: collapse !important;
      #   }
      #
      #   /* Button re-styling */
      #   #tabs-newtab-button:hover,
      #   #tabbrowser-tabs .tabs-newtab-button:hover {
      #     background-color: var(--toolbarbutton-hover-background);
      #   }
      #
      #   #tabs-newtab-button > .toolbarbutton-icon,
      #   #tabbrowser-tabs .tabs-newtab-button > .toolbarbutton-icon {
      #     padding: 0 !important;
      #     transform: scale(0.6);
      #     background-color: transparent !important;
      #   }
      #
      #   @media (-moz-os-version: windows-win10) {
      #     :root[sizemode="maximized"] #navigator-toolbox {
      #       padding-top: 7px !important;
      #     }
      #   }
      #
      #   :root[tabsintitlebar] #toolbar-menubar[autohide="true"][inactive] {
      #     transition: height 0ms steps(1) 80ms;
      #   }
      #   #nav-bar {
      #     border-inline: var(--uc-window-drag-space-width) solid var(--toolbar-bgcolor);
      #   }
      #
      #   #back-button {
      #     display: none;
      #   }
      #   #forward-button {
      #     display: none;
      #   }
      #   #reload-button {
      #     display: none;
      #   }
      #   #stop-button {
      #     display: none;
      #   }
      #   #home-button {
      #     display: none;
      #   }
      #   #library-button {
      #     display: none;
      #   }
      #   #identity-box {
      #     display: none;
      #   }
      #   #pageActionButton {
      #     display: none;
      #   }
      #   #pocket-button {
      #     display: none;
      #   }
      #   #tracking-protection-icon-container {
      #     display: none !important;
      #   }
      #   #urlbar-go-button {
      #     display: none;
      #   }
      #   #userContext-label,
      #   #userContext-indicator {
      #     display: none !important;
      #   }
      #   #fxa-toolbar-menu-button {
      #     display: none;
      #   }
      #   #nav-bar-overflow-button {
      #     display: none !important;
      #   }
      # '';
    };

    search = {
      defaultSearchEngine = "Searx";
      removeEngines = [
        /*
        "Google"
        */
        "Bing"
        "Amazon.com"
        "eBay"
        "Twitter"
        /*
        "Wikipedia"
        */
      ];
      # searxUrl = "https://searx.be"; searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
      addEngines = [
        {
          Name = "Etherscan";
          Description = "Checking balances";
          Alias = "!eth";
          Method = "GET";
          URLTemplate = "https://etherscan.io/search?f=0&q={searchTerms}";
        }
        {
          Name = "Searx";
          Description = "Decentralized search engine";
          Alias = "sx";
          Method = "GET";
          URLTemplate = "https://searx.be/?preferences=eJxtV8uO6zYM_ZpmY9yg7V0UXWRVoNsW6N0btMTYHEuirh5JPF9fKrZjOZ7FeEaHMs3nIUdBwp4DYbz06DCAORlwfYYeL2DkwAoMXtCdICdWbL3BhJeeuTd4Iiv3Wh_4MV1-hIwni2lgffn3n_9-nCJcMSIENVx-PaUBLV4ilfdPAWM2KbbsWof3NkF3-RtMxJNmakXI5obhwiDHM4f-xFFB-BbTJJYY7kmxxts3DWE8zRrbWfZEFLqEoQVDvZU_F82gb-AU6naxaEZ_ZgxTS65NlOT9pwvkruQoiU4V2JgZ1BShM_I6up6cBOvPHvq2jawITGNRE_zy-1_gx8ZSCBza9koG4xMT-xp5NjFxwEogZtANG4ptu4T-iSZSbfsMbLnVketreTk3s_TtVnMjjSzo_PuJpi6rEZPcTHJWSn1Lt-oCe3QS6YiVKnE6xoBXcU4RSsgEm9DXNqgcDGGNaMRPiXlrcyT1PN8IXBJnKs1a943GZ3CJ3c5rDHwn3bYsZRLkfKeRNCTYfUNcKT89f40eo1LJ7ghF9faFOS0WvLwgz2KD5Q_yJZPbrd8elbqrDlyMXBN4NaTGUF8IiE3ka7pDwEZTQCUpn5boXwO5kaBObk-9VBXEVHvUSylCt6ZMKr3D0C_Hue2OmV5wb2AqpRY3I2uJ5Rvh7jXPWtd5G6ALUB7L98jqbosGOahe_qA48CYcJRgQqy8bEl1haopnkb4Q8LVR7Hrp9zpphruY8BziYgJ8mimQipuRwjGgPLjlgkO87QrFebuKJoDtu6XaA3quTPEgRvcU1w7xuTtL7S6nn3ep4VrzEzjW2QwfkhLRE8x0s0MLUPLalMerOMBCCcwKRLSilFQT1cAGQt2OsTSWL8xb2ZZ4nDix5GQsoVk9THdKhQ7fqSq7KDURh8qNCQbe9dbEOeUOK-NfyKvRgcxkuTR0de1GFrk636mbasUWgrCo-LvLm8yZBzgd9mihgo55jO-gTA7BynMBfmZO-H4rcg7qgBbSozQdYJ7eoqpJpU92O-y379__eGwR1lmj2_og4qcDu_OWPxDHXYXCraRkA0Luph7tWvMeMbxF_pk3-cQoLXy_Y1eJQrYymupw84NGdlLJTZwcu8liZd-HP_u723OtFVLeTZkgFtaAl54zay1_CR_bohbukiV1vvX3nKAhp43iXl84odtP3acuQy4_mmL2ShHhQbe6QTopIwXWb3Vabi_c_jZLd5Z1SVPfb7mVSRdE565QNMtIDc2QV45OYtq0ixYm6QkndlZxFynlisXknIqrs9OUNn0zZe9Gwkzihwgv-M6FBfuCNoZF78zsTsqFONeEVWGrleJDv2dXSw9lOOuKj0HmGq4jo7AsyOgr4zuiLHmVBatMaFZmJyxrwF4ek0zRJCN5nctel0bYLvlBaM69pBRkg-1gqkg9d9Itu1cmTzWn7yMmtmpKB4aUwpQq2rsqzKtGlua9Gr6v1RfH3GWX8lrQ2WPI8RUQ2WZJyx4ghZSq0fNk2-adxEpIoKwMr-5kM88GP1R7iZWWtrJaNCmAi0YiUC9PHLSjsQJSCmdaW37bZb3J0lbxUnr0cV5O57Lna9nxVVp25Xb9h2CZXttVhnbe2O9BFuaDOKK5ynJ95YNEwtGqAdV4kMjoaCXBI07x1f1f2zmU6TUfDloGjklYGMU0mXLqK9OenkkdqfkfoEmcNeLz0dQApd9b2XlFmy3JP8mslUK9_A8SUQFD&q={searchTerms}";
        }
        {
          Name = "Sourcegraph/Nix";
          Description = "Sourcegraph nix search";
          Alias = "!snix";
          Method = "GET";
          URLTemplate = "https://sourcegraph.com/search?q=context:global+file:.nix%24+{searchTerms}&patternType=literal";
        }
        {
          Name = "Torrent search";
          Description = "Searching for legal linux isos ";
          # feds go away
          Alias = "!torrent";
          Method = "GET";
          URLTemplate = "https://librex.beparanoid.de/search.php?q={searchTerms}&t=3&p=0";
        }
        {
          Name = "Etherscan";
          Description = "Checking balances";
          Alias = "!eth";
          Method = "GET";
          URLTemplate = "https://etherscan.io/search?f=0&q={searchTerms}";
        }
        {
          Name = "Stackoverflow";
          Description = "Stealing code";
          Alias = "!so";
          Method = "GET";
          URLTemplate = "https://stackoverflow.com/search?q={searchTerms}";
        }
        {
          Name = "Wikipedia";
          Description = "Wikiless";
          Alias = "!wiki";
          Method = "GET";
          URLTemplate = "https://wikiless.org/w/index.php?search={searchTerms}title=Special%3ASearch&profile=default&fulltext=1";
        }
        {
          Name = "Crates.io";
          Description = "Rust crates";
          Alias = "!rs";
          Method = "GET";
          URLTemplate = "https://crates.io/search?q={searchTerms}";
        }
        {
          Name = "Brave search";
          Description = "Brave search engine";
          Alias = "!br";
          Method = "GET";
          URLTemplate = "https://search.brave.com/search?q={searchTerms}";
        }
        {
          Name = "you ai engine";
          Description = "ai search engine";
          Alias = "!yai";
          Method = "GET";
          URLTemplate = "https://you.com/search?q={searchTerms}";
        }
        {
          Name = "nixpkgs";
          Description = "Nixpkgs query";
          Alias = "!nix";
          Method = "GET";
          URLTemplate = "https://search.nixos.org/packages?&query={searchTerms}";
        }
        {
          Name = "youtube";
          Description = "not really";
          Alias = "!yt";
          Method = "GET";
          URLTemplate = "https://www.youtube.com/search?q={searchTerms}";
        }
        {
          Name = "Librex";
          Description = "A privacy respecting free as in freedom meta search engine for Google and popular torrent sites ";
          Alias = "!librex";
          Method = "GET";
          URLTemplate = "https://librex.beparanoid.de/search.php?q={searchTerms}&p=0&t=0";
        }
        {
          Name = "DeepL";
          Description = "Translator";
          Alias = "!t";
          Method = "GET";
          URLTemplate = "https://www.deepl.com/en/translator#en/ru/{searchTerms}%0A";
        }
      ];
    };

    security = {
      sanitizeOnShutdown = false;
      userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
    };

    misc = {
      drmFix = true;
      disableWebgl = false;
    };

    extensions.extraExtensions = {
      "webextension@metamask.io".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ether-metamask/latest.xpi";
      "addon@darkreader.org".install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
      "uBlock0@raymondhill.net".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      "{36bdf805-c6f2-4f41-94d2-9b646342c1dc}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/export-cookies-txt/latest.xpi";
      "{74145f27-f039-47ce-a470-a662b129930a}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
      "{b86e4813-687a-43e6-ab65-0bde4ab75758}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/localcdn-fork-of-decentraleyes/latest.xpi";
      "DontFuckWithPaste@raim.ist".install_url = "https://addons.mozilla.org/firefox/downloads/latest/don-t-fuck-with-paste/latest.xpi";
      "{531906d3-e22f-4a6c-a102-8057b88a1a63}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/single-file/latest.xpi";
      "{c607c8df-14a7-4f28-894f-29e8722976af}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/temporary-containers/latest.xpi";
      "skipredirect@sblask".install_url = "https://addons.mozilla.org/firefox/downloads/latest/skip-redirect/latest.xpi";
      "{0a2d1098-69a9-4e98-a62c-a861766ac24d}".install_url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_mocha_pink.xpi";
      "smart-referer@meh.paranoid.pk".install_url = "https://github.com/catppuccin/firefox/releases/download/old/smart-referer.xpi";
      "7esoorv3@alefvanoon.anonaddy.me".install_url = "https://addons.mozilla.org/firefox/downloads/latest/libredirect/latest.xpi";
      "{1018e4d6-728f-4b20-ad56-37578a4de76}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/flagfox/latest.xpi";
      "sponsorBlocker@ajay.app".install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
      "firefox@tampermonkey.net".install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
    };

    # TODO bookmarks from file
    # bookmarks = [
    #   {
    #     Title = "Example";
    #     URL = "https://example.com";
    #     Favicon = "https://example.com/favicon.ico";
    #     Placement = "toolbar";
    #     Folder = "FolderName";
    #   }
    # ];
  };
}
