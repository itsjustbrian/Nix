{ pkgs, ... }:

{
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [ "quiet" ];
    loader.timeout = 0;
    plymouth = {
      enable = true;
      theme = "neat";
      themePackages = with pkgs; [ nur-joseph-digiovanni.plymouth-theme-neat ];
    };
  };
}
