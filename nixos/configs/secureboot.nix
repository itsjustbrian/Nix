{ lib, ... }:

{
  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    loader.systemd-boot.enable = lib.mkForce false; # Lanzaboote replaces the systemd-boot module.
  };
}
