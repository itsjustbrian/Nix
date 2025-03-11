{ config, pkgs, ... }:

let
  generateLatestSourceURL = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
in
{
  programs.librewolf = {
    enable = true;

    policies = {
      ExtensionSettings."uBlock0@raymondhill.net" = {
        default_area = "menupanel";
        install_url = generateLatestSourceURL "ublock-origin";
        installation_mode = "force_installed";
      };

      Homepage.StartPage = "previous-session";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
    };

    profiles.${config.home.username} = {
      id = 0;
      isDefault = true;

      search = {
        default = "PrivateSearch";

        engines = {
          "NixOS Options" = {
            urls = [{
              template = "https://search.nixos.org/options?query={searchTerms}";
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nixos" ];
          };

          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages?query={searchTerms}";
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@nixpkgs" ];
          };

          "OpenStreetMap" = {
            urls = [{
              template = "https://www.openstreetmap.org/search?query={searchTerms}";
            }];

            iconUpdateURL = "https://www.openstreetmap.org/favicon.ico";
            definedAliases = [ "@openstreetmap" "@osm" ];
          };

          "PrivateSearch" = {
            urls = [{
              template = "https://privatesearch.app/search?q={searchTerms}";
            }];

            iconUpdateURL = "https://privatesearch.app/static/themes/simple/img/favicon.svg";
            definedAliases = [ "@privatesearch" ];
          };
        };

        force = true; # Required to prevent search engine symlink being overwritten. See https://github.com/nix-community/home-manager/issues/3698
      };
    };

    settings = {
      "privacy.resistFingerprinting" = false;
    };
  };
}
