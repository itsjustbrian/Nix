{ custom-modules, inputs, lib, pkgs, ... }:

let
  getSpecialisations = builtins.mapAttrs (name: value: { value = { }; }) custom-modules.nixos.specialisations;
in
{
  specialisation = builtins.mapAttrs
    (name: value: { configuration = import custom-modules.nixos.specialisations.${name} { inherit custom-modules inputs pkgs; }; })
    getSpecialisations;
}
