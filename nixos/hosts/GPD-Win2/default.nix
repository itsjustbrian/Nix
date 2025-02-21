{ custom-modules, lib, ... }:

{
  imports = with custom-modules.nixos; [
    ./file-systems.nix
    ./gdm/monitors
    configs.desktop
    configs.gaming
    configs.secureboot # Must be commented on first install
    hardware.gpd-win-2
    users.bferch
  ];

  boot.plymouth.theme = lib.mkForce "bgrt"; # Screen is too small for larger themes

  services = {
    displayManager.autoLogin.user = "bferch";
    logind.lidSwitchExternalPower = "ignore";
  };
}
