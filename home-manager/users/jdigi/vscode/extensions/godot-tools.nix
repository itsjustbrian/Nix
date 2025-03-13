{ pkgs, ... }:

{
  programs.vscode.extensions = with pkgs.vscode-marketplace; [ geequlim.godot-tools ];

  programs.vscode.userSettings = {
    "godotTools.editorPath.godot3" = "${pkgs.godot3}/bin/godot3";
    "godotTools.editorPath.godot4" = "${pkgs.godot_4}/bin/godot4";
  };
}
