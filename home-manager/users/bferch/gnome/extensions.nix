{ custom-modules, ... }:

{
  imports = with custom-modules.gnome.extensions; [
    gsconnect
    quick-settings-audio-devices-hider
    quick-settings-audio-devices-renamer
  ];
}
