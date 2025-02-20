let
  btrfOptions = [ "compress=zstd" ];
  ssdOptions = [ "discard=async" "noatime" ];
in
{
  disko.devices.disk.root = {
    device = "/dev/disk/by-id/nvme-Samsung_SSD_980_PRO_2TB_S6B0NU0W961732M";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        efi = {
          type = "EF00";
          size = "512M";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        root = {
          label = "NixOS";
          size = "100%";

          content = {
            type = "luks";
            name = "luksroot";
            settings.allowDiscards = true;

            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];

              subvolumes = {
                "/home" = {
                  mountpoint = "/home";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/home/.snapshots" = { };

                "/persist" = {
                  mountpoint = "/persist";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/root" = {
                  mountpoint = "/";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = btrfOptions ++ ssdOptions;
                };

                "/swap" = {
                  mountpoint = "/.swap";
                  swap.swapfile.size = "32G";
                };
              };
            };
          };
        };
      };
    };
  };
}
