{lib, ...}: {
  options = with lib;
  with types; {
    defaultApplications = mkOption {
      type = attrsOf (submodule ({name, ...}: {
        options = {
          cmd = mkOption {type = path;};
          desktop = mkOption {type = str;};
        };
      }));
      description = "Preferred applications";
    };
  };
}
