{ lib, ... }:

{
  imports = [
    ./extensions.nix
    ./keyboard-shortcuts.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/peripherals/mouse".natural-scroll = true;

    "org/gnome/desktop/privacy" = {
      old-files-age = lib.hm.gvariant.mkUint32 30;
      remember-recent-files = false;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/nautilus/preferences".click-policy = "single";

    "org/gnome/shell".favorite-apps = lib.mkForce [
      "librewolf.desktop"
      "youtube-music.desktop"
      "steam.desktop"
      "element-desktop.desktop"
      "discord.desktop"
      "org.gnome.Nautilus.desktop"
      "org.gnome.Console.desktop"
    ];

    "org/gnome/TextEditor".restore-session = false;
  };
}
