{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./disko.nix
    configs.impermanence
    configs.luks
    configs.snapper
  ];
}
