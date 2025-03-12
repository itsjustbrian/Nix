{ pkgs, ... }:

{
  home.packages = with pkgs; [
    makemkv
    nur-joseph-digiovanni.mkvextract-gtk
    mkvtoolnix
    subtitleedit
  ];
}
