{ config, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #boot.loader.grub.useOSProber = true;


  boot.kernelModules = [ "kvm-intel" ];
  #  # kvm-intel --- it's for accelirating `nixos-rebuild build-vm`
  #  #   ****for some reason it doesn't be loaded
}
