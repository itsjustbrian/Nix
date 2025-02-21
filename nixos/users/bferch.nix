{ config, custom-modules, ... }:

let
  username = "bferch";
  fullname = "Brian Ferch";
in
{
  sops.secrets."users/${username}".neededForUsers = true;

  home-manager.users.${username} = custom-modules.home.users.${username}.default;

  users.users.${username} = {
    description = fullname;
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.sops.secrets."users/${username}".path;
    isNormalUser = true;
  };
}
