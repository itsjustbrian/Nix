{ inputs, nixpkgs, system, ... }:

let

  unstableOverlay = final: prev: {
    alvr = final.unstable.alvr;
    proton-ge-bin = final.unstable.proton-ge-bin;
    sidequest = final.unstable.sidequest;
    unstable = import inputs.nixpkgs-unstable { inherit (final) config system; };
    vscode = final.unstable.vscode;
    youtube-music = final.unstable.youtube-music;
  };

  waylandOverlay = final: prev: {
    github-desktop = mkWaylandElectronWrapper { pkg = prev.github-desktop; };
    vscode = mkWaylandElectronWrapper { pkg = prev.vscode; exeName = "code"; };
  };

  mkWaylandElectronWrapper = { pkg, exeName ? pkg.pname, extraFlags ? "" }: pkg.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      wrapProgram $out/bin/${exeName} \
        --add-flags "--ozone-platform-hint=auto ${extraFlags}"
    '';
  });
in
import nixpkgs {
  inherit system;
  config.allowUnfree = true;

  overlays = [
    inputs.nix-vscode-extensions.overlays.default
    inputs.nur.overlays.default
    inputs.nur-joseph-digiovanni.overlays.default
    unstableOverlay
    waylandOverlay
  ];
}
