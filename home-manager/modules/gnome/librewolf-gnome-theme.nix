{ config, inputs, ... }:

{
  home.file."firefox-gnome-theme" = {
    source = inputs.firefox-gnome-theme;
    target = ".librewolf/${config.home.username}/chrome/firefox-gnome-theme";
  };

  programs.librewolf = {
    profiles.${config.home.username} = {
      settings = {
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.tabs.drawInTitlebar" = true;
        "browser.theme.dark-private-windows" = false;
        "svg.context-properties.content.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
      '';

      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';
    };
  };
}
