{ custom-modules, inputs, ... }:

{
  home-manager = {
    backupFileExtension = "hmbackup";
    extraSpecialArgs = { inherit inputs; custom-modules = custom-modules.home.modules; };
    sharedModules = [ custom-modules.home.users.common.default ];
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
