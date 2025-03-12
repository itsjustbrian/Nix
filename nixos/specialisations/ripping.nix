{ custom-modules, ... }:

{
  imports = with custom-modules.nixos; [
    hardware.scsi-generic # for optical drives
  ];

  home-manager.sharedModules = [ custom-modules.home.specialisations.ripping ];
}
