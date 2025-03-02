{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    bottles
    darktable
    discord
    element-desktop
    foliate
    gimp
    github-desktop
    localsend
    mission-center
    obs-studio
    onlyoffice-bin
    openmw
    openspades
    youtube-music
    via
  ];
}
