{
  imports = [
    ./git.nix
    ./gnome
    ./librewolf.nix
    ./packages.nix
  ];

  home = {
    file."Pictures/Wallpapers" = {
      recursive = true;
      source = ./wallpapers;
    };

    stateVersion = "24.05"; # DO NOT CHANGE AFTER INSTALL
  };

  programs.home-manager.enable = true; # Let Home Manager install and manage itself.
}

