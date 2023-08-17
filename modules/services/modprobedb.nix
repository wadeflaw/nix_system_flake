{lib, ...}:
with lib; let
  cfg = config.services.modprobedb;
  pn = "modprobedb";
in {
  options = {
    services.modprobedb = mkOption {
      enable = mkEnableOption "modprobedb";

      package = mkOption {
        type = types.package;
        default = pkgs.${pn};
        defaultText = literalExpression "pkgs.${pn}";
        description = ''
          Package containing the {command}`${pn}` program.
        '';
      };

      description = "${pn}" service from arch;
    };
  };
}
