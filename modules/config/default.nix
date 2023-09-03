{
  host = "nixos";
  user = "ghost";
  passhash = "$y$j9T$lcqsG7EZPy7dSeXRr5lYk.$zLi5zYkjtBzy5nd9KLYQddxy88wD97EHKOCuJgzG1A6";
  fl_path = "/etc/nixos/stable";
  system = "x86_64-linux";
}
#
# { lib, ... }:
# with lib; {
#   options.conf = {
#     user = mkOption {
#       type = types.toString;
#       description = "Username";
#     };
#     host = mkOption {
#       type = types.toString;
#       description = "System hostname.";
#     };
#     system = mkOption {
#       type = types.toString;
#       description = "System architecture.";
#     };
#     fl_path = mkOption {
#       type = types.toString;
#       description = "Path to root of system flake.";
#       default = null;
#     };
#   };
# }
