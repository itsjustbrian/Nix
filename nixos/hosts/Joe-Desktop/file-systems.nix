{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./disko/data.nix
    ./disko/root.nix
    configs.impermanence
    configs.luks
    configs.snapper
  ];
}
