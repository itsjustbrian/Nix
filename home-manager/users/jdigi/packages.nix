{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    bottles
    darktable
    discord
    element-desktop
    gimp
    github-desktop
    localsend
    obs-studio
    onlyoffice-bin
    openmw
    openspades
    youtube-music
    via
  ];
}
