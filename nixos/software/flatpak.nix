{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = lib.mkIf config.services.xserver.desktopManager.gnome.enable [
      pkgs.gnome-software
    ];

    services.flatpak.enable = true;

    systemd.services."flathub-remote-add" = {
      after = [ "network-online.target" ];
      description = "Add flathub remote";
      path = [ pkgs.flatpak ];
      requires = [ "network-online.target" ];
      script = ''
        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
      wantedBy = [ "multi-user.target" ];
    };
  };
}
