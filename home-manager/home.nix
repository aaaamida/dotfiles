{ ... }:

{
  imports = [ ./homeModules/import.nix ];

  home = {
    username = "amida";
    homeDirectory = "/home/amida";
    stateVersion = "23.11";
    file = {};
    sessionVariables = {
      EDITOR = "lvim";
    };
  };

  programs.home-manager.enable = true;
}
