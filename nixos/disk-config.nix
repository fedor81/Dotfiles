{
  disko.devices = {
    disk = {
      my-disk = {
        device = "/dev/sda"; # УБЕДИТЕСЬ, ЧТО ЭТО ПРАВИЛЬНЫЙ ДИСК!
        type = "disk";
        content = {
          type = "gpt";
          partitions = {

            # Партиция для загрузчика GRUB (актуально для legacy/MBR-загрузки, можно удалить если чисто UEFI)
            # boot = {
            #   size = "1M";
            #   type = "EF02"; # Этот тип именно для GRUB и BIOS
            # };

            # ESP раздел для загрузчика
            ESP = {
              type = "EF00"; # EFI System Partition
              size = "256M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            # Раздел подкачки
            swap = {
              size = "8G";
              content = {
                type = "swap";
                resumeDevice = true; # Позволяет hibernation (спящий режим)
              };
            };

            # Корневой раздел
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                mountpoint = "/";
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
}
