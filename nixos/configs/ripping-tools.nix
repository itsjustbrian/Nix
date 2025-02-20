{ custom-modules, pkgs, ... }:

{
  imports = with custom-modules.nixos; [
    hardware.scsi-generic # for optical drives
  ];

  environment.systemPackages = with pkgs; [
    makemkv
    nur-joseph-digiovanni.mkvextract-gtk
    mkvtoolnix
    subtitleedit
  ];
}
