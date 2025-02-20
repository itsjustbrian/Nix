{ custom-modules, ... }:

{
  imports = with custom-modules.nixos.software; [
    gsconnect
    virtual-webcam
  ];
}
