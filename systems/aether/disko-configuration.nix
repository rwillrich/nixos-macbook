{
  disko.devices = {
    disk.main = {
      device = "/dev/disk/by-id/ata-WD_Green_2.5_240GB_23451G806447";

      content = {
        type = "gpt";

        partitions = {
          esp = {
            type = "EF00";
            size = "1G";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          swap = {
            type = "8200";
            size = "16G";

            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };

          nixos = {
            type = "8300";
            size = "128G";

            content = {
              type = "btrfs";

              subvolumes = {
                "/rootfs" = {
                  mountpoint = "/";
                  mountOptions = [ "compress=zstd" ];
                };

                "/nix" = {
                  mountpoint = "/nix";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
