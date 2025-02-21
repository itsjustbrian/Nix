{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (steam.override {
      extraPkgs = _: [
        pkgs.openmw # Morrowind engine replacement. Add '"openmw" %command%' to the game's properties in Steam.
      ];
    })
  ];
}
