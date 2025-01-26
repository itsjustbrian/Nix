{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./disko/root.nix
    configs.impermanence
    configs.luks
    configs.snapper
  ];
}
