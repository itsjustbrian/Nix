{ inputs, pkgs, ... }:

{
  imports = [ inputs.nix-index-database.nixosModules.nix-index ];

  programs = {
    bash.interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';

    command-not-found.enable = false;
  };
}
