{ ... }:

{
  sops.age.keyFile = "/nix/sops-nix.key";
  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";
}
