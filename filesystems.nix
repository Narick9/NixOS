{ config, ... }:

{
  fileSystems."/run/media/papa/BACKUPS_1VO" =
    #### .../toshiba - it can't be `.../BACKUPS_1VO/` for some reason
    {
      device = "/dev/disk/by-label/BACKUPS_1VO";
      fsType = "exfat";
      options = [ "defaults" "user" "nofail" "x-systemd.device-timeout=1ms" ];
      #### "user" --- even with this option you (as usual user) can't mount
      ####   something without sudo
      #### "x-systemd.device-timeout=..." --- without it you would wait for 90s
    };
  fileSystems."/run/media/papa/terrobyte" =
    {
      device = "/dev/disk/by-uuid/E2F8549EF85472B1";
      fsType = "ntfs-3g";
      options = [ "defaults" "user" "nofail" "x-systemd.device-timeout=1ms" ];
    };
}
