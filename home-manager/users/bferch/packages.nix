{ pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    gimp
    localsend
    obs-studio
    onlyoffice-bin
  ];
}
