{ config, ... }:

{
  fileSystems."/run/media/art/BACKUPS_1VO" =
    #### .../toshiba - it can't be `.../BACKUPS_1VO/` for some reason
    {
      device = "/dev/disk/by-label/BACKUPS_1VO";
      fsType = "exfat";
      options = [ "defaults" "user" ];
      #### "user" - even with this option you (as usual user) can't mount
      ####   something without sudo
    };
}
