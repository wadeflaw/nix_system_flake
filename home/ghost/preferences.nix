{pkgs, ...}: {
  defaultApplications = {
    terminal = {
      cmd = "${pkgs.foot}/bin/footclient";
      desktop = "footclient";
    };
    browser = {
      cmd = "${pkgs.firefox}/bin/firefox";
      desktop = "firefox";
    };
  };
}
