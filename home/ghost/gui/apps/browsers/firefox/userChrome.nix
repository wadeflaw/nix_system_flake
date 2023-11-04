{config, ...}: let
  inherit (config.colorscheme) colors;
in ''
  :root {
    /* Special */
    --background: #${colors.base00};
    --foreground: #${colors.base05};

    /* Colors */
    --color0: #${colors.base02};
    --color1: #${colors.base06};
    --color2: #${colors.base00};

    --tab-font-size: 15px;
    --tab-font-family: Jost *;
    --max-tab-width: none;
    --show-titlebar-buttons: none;
    --tab-height: 20px;
  }

  .titlebar-buttonbox-container {
    display: var(--show-titlebar-buttons);
  }

  :root:not([customizing]) #TabsToolbar {
    margin-left: 1px !important;
    margin-right: 1px !important;
    border-radius: 0 !important;
    padding: 0 !important;
  }
  .tabbrowser-tab * {
    margin: 0 !important;
    border-radius: 0 !important;
    font-family: var(--tab-font-family) !important;
  }
  .tabbrowser-tab {
    height: var(--tab-height);
    font-size: var(--tab-font-size) !important;
    min-height: 0 !important;
  }
  .tabbrowser-tab[fadein]:not([pinned]) {
    max-width: var(--max-tab-width) !important;
  }
  .tab-close-button,
  .new-tab-button,
  #firefox-view-button,
  #scrollbutton-up,
  .tab-secondary-label {
    display: none !important;
  }
  .tab-icon-image {
    display: none !important;
    /* height: auto !important; */
    /* width: calc(var(--tab-height) / 1.5) !important; */
    /* margin-right: 4px !important; */
  }

  #tabs-newtab-button,
  #titlebar spacer {
    display: none !important;
  }

  .tab-background:not([selected="true"]) {
    background-color: var(--color0) !important;
  }

  .tab-background[selected="true"] {
    background-color: var(--color2) important;
    background-image: none important;
  }

  :root:not([customizing]) #nav-bar {
    min-height: 2.5em !important;
    height: 2.5em !important;
    margin: 0 0 -2.5em !important;
    z-index: -1000 !important;
    opacity: 0 !important;
  }

  :root:not([customizing]) #nav-bar:focus-within {
    z-index: 1000 !important;
    opacity: 1 !important;
  }

  #nav-bar {
    border-inline: var(--uc-window-drag-space-width) solid var(--toolbar-bgcolor);
  }
  #new-tab-button,
  #alltabs-button,
  #scrollbutton-down,
  .tab-loading-burst {
    display: none;
  }
  #titlebar {
    overflow: none !important;
  }

  :root[sizemode="normal"] #nav-bar {
    --uc-window-drag-space-width: 20px;
  }

  #titlebar {
    -moz-appearance: none !important;
  }
  #TabsToolbar {
    min-height: 0px !important;
  }

  #tabbrowser-tabs,
  #tabbrowser-tabs > .tabbrowser-arrowscrollbox,
  #tabbrowser-arrowscrollbox {
    min-height: 0 !important;
  }

  :root:not([customizing]) #tabbrowser-tabs .tabs-newtab-button,
  :root:not([customizing]) #tabs-newtab-button,
  :root:not([customizing]) #TabsToolbar-customization-target > .toolbarbutton-1,
  :root:not([customizing]) #TabsToolbar .titlebar-button {
    -moz-appearance: none !important;
    height: 0px;
    padding-top: 0px !important;
    padding-bottom: 0px !important;
    -moz-box-align: stretch;
    margin: 0 !important;
  }

  .accessibility-indicator,
  .private-browsing-indicator {
    height: unset !important;
  }
  .accessibility-indicator > hbox {
    padding-block: 0 !important;
  }

  #tabbrowser-tabs
    .tabbrowser-tab[first-visible-tab="true"][last-visible-tab="true"] {
    visibility: collapse !important;
  }

  /* Button re-styling */
  #tabs-newtab-button:hover,
  #tabbrowser-tabs .tabs-newtab-button:hover {
    background-color: var(--toolbarbutton-hover-background);
  }

  #tabs-newtab-button > .toolbarbutton-icon,
  #tabbrowser-tabs .tabs-newtab-button > .toolbarbutton-icon {
    padding: 0 !important;
    transform: scale(0.6);
    background-color: transparent !important;
  }

  @media (-moz-os-version: windows-win10) {
    :root[sizemode="maximized"] #navigator-toolbox {
      padding-top: 7px !important;
    }
  }

  :root[tabsintitlebar] #toolbar-menubar[autohide="true"][inactive] {
    transition: height 0ms steps(1) 80ms;
  }
  #nav-bar {
    border-inline: var(--uc-window-drag-space-width) solid var(--toolbar-bgcolor);
  }
  #navigator-toolbox {
    appearance: toolbar !important; /* Pretty much anything except none */
  }

  #back-button {
    display: none;
  }
  #forward-button {
    display: none;
  }
  #reload-button {
    display: none;
  }
  #stop-button {
    display: none;
  }
  #home-button {
    display: none;
  }
  /* #downloads-button { */
  /*   display: none; */
  /* } */
  /* #library-button { */
  /*   display: none; */
  /* } */
  /* #identity-box { */
  /*   display: none; */
  /* } */
  #pageActionButton {
    display: none;
  }
  #pocket-button {
    display: none;
  }
  #urlbar-zoom-button {
    display: none;
  }
  #tracking-protection-icon-container {
    display: none !important;
  }
  #reader-mode-button {
    display: none !important;
  }
  /* #star-button { */
  /*   display: none; */
  /* } */
  /* #star-button-box { */
  /*   display: none; */
  /* } */
  /* #urlbar-go-button { */
  /*   display: none; */
  /* } */
  #userContext-label,
  #userContext-indicator {
    display: none !important;
  }
  /* #fxa-toolbar-menu-button { */
  /*   display: none; */
  /* } */
  /* #nav-bar-overflow-button { */
  /*   display: none !important; */
  /* } */
  /* #PanelUI-button { */
  /*   display: none; */
  /* } */
  /* #customizableui-special-spring1, */
  /* #customizableui-special-spring2 { */
  /*   display: none; */
  /* } */
''
