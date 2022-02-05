{ config, ... }:

{
  ####Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Or use BIOS
  ##boot.loader.grub.device = "/dev/disk/by-id/wwn-0x50026b727a016885";
  #### In case of only-bios computer
  #
  ##boot.loader.grub.useOSProber = true;
  #
  ##boot.loader.grub.timeout = 1;
  ##boot.loader.timeout = 1;
  #### boot.loader.grub.timeout --- it has been renamed just to boot.lader.timeout
  
  


  ##boot.kernelModules = [ "kvm-intel" ];
  #### kvm-intel --- it's for accelirating `nixos-rebuild build-vm`
  ####   ****for some reason it doesn't be loaded
}
