{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    ./file-systems.nix
    ./gdm/monitors
    ./home-manager
    configs.desktop
    configs.desktop-extras
    configs.gaming
    configs.monitor-control
    configs.secureboot # Must be commented on first install
    hardware.amd-graphics
    hardware.msi-pro-b650p-wifi
    users.bferch
  ];

  services.displayManager.autoLogin.user = "bferch";
}
