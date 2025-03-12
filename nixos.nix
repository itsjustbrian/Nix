{ custom-modules, inputs, nixpkgs, ... }:

with nixpkgs.lib;

let
  mkCommonConfig = builtins.mapAttrs (hostName: extraConfig:
    nixosSystem
      rec {
        modules = [
          custom-modules.nixos.configs.default.default
          custom-modules.nixos.hosts."${hostName}".default
          inputs.disko.nixosModules.disko
          inputs.home-manager.nixosModules.home-manager
          inputs.impermanence.nixosModules.impermanence
          inputs.lanzaboote.nixosModules.lanzaboote
          inputs.nix-index-database.nixosModules.nix-index
          inputs.sops-nix.nixosModules.sops
          {
            networking.hostName = mkForce hostName;
            nixpkgs = import ./custom-pkgs.nix { inherit inputs system; };
          }
        ];

        system = "x86_64-linux";

        specialArgs = {
          inherit custom-modules inputs;
        };
      } // extraConfig
  );

  getHosts = builtins.mapAttrs (name: value: { value = { }; }) custom-modules.nixos.hosts;
in

mkCommonConfig getHosts
