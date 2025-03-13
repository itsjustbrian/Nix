{
  description = "Brian's NixOS configuration";

  inputs = {
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko/latest";
    };

    impermanence.url = "github:nix-community/impermanence";

    firefox-gnome-theme = {
      flake = false;
      url = "github:rafaelmardojai/firefox-gnome-theme/v136";
    };

    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager/release-24.11";
    };

    lanzaboote = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/lanzaboote/v0.4.2";
    };

    nix-index-database = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-index-database";
    };

    nix-vscode-extensions = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nix-vscode-extensions";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur-joseph-digiovanni = {
      url = "github:Joseph-DiGiovanni/nur-packages";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Mic92/sops-nix";
    };
  };

  outputs = inputs @ { haumea, nixpkgs, self, ... }:
    let
      loadDir = path: haumea.lib.load {
        loader = haumea.lib.loaders.path;
        src = path;
      };

      custom-modules = {
        home = loadDir ./home-manager;
        nixos = loadDir ./nixos;
      };
    in
    {
      nixosConfigurations = import ./nixos.nix { inherit custom-modules inputs nixpkgs; };
    };
}
