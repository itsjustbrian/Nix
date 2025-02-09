{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = [ "hibernate-status@dromi" ];
    "org/gnome/shell/extensions/hibernate-status-button".show-hybrid-sleep = false;
    "org/gnome/shell/extensions/hibernate-status-button".show-suspend-then-hibernate = false;
  };
  home.packages = with pkgs; [ gnomeExtensions.hibernate-status-button ];
}
