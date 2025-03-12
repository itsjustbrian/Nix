{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.configs.default; [
    home-manager
    sops.default
    specialisations
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
    };

    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "flakes" "nix-command" ];
    };
  };

  system.stateVersion = "24.05"; # DO NOT CHANGE. https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
}
