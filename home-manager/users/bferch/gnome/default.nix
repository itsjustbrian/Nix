{ lib, ... }:

{
  imports = [
    ./extensions.nix
    ./keyboard-shortcuts.nix
  ];

  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      old-files-age = lib.hm.gvariant.mkUint32 30;
      remember-recent-files = false;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/shell".favorite-apps = lib.mkForce [
      "librewolf.desktop"
      "youtube-music.desktop"
      "steam.desktop"
      "discord.desktop"
      "org.gnome.Nautilus.desktop"
      "org.gnome.Console.desktop"
    ];

    "org/gnome/TextEditor".restore-session = false;
  };
}
