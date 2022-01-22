# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./bootloader.nix
      ./xserver.nix
      ./packages.nix
      ./users.nix
      ./filesystems.nix
      ./services.nix
      ./printing.nix
    ];


  networking.hostName = "nixos-artur";
  #  # ...hostName --- Define your hostname.
  #networking.wireless.enable = true;
  #  # ...wireless... - Enables wireless support via wpa_supplicant.
  #  #   ****wpa_cli still doesn't work. Just use GNOME that cover it
  #
  time.timeZone = "Europe/Moscow";
  #  # ...timeZone --- Set your time zone.
  #
  i18n.defaultLocale = "ru_RU.UTF-8";
  #
  networking.useDHCP = false;
  #  # ...useDHCP --- The global useDHCP flag is deprecated, therefore explicitly set to
  #  #   false here.
  #  #   Per-interface useDHCP will be mandatory in the future, so this generated config
  #  #   replicates the default behaviour.
  #networking.interfaces.enp3s25.useDHCP = true;
  #  # ...enp3s0... - you don't have it on your notebook


  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;


  # List services that you want to enable:


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11";
  # # Did you read the comment?


  environment.variables.EDITOR = "vim";
  environment.variables.SUDO_EDITOR = "vim";
  #### $SUDO_EDITOR - man of sudo says that it uses SUDO_EDITOR, VISUAL, EDITOR
  ####   variables (in that order). EDITOR is defined, but for some reason,
  ####   `sudo nixos-rebuild` still opens nano
  ####       ****it still opens with nano
  environment.variables.CURRENT_PROJECT="/media/terrobyte/dev_2021-11nov-21/python/Python_для_сложных_задач_(Дж._Вандер_Плас) (1)/";
  environment.variables.ENCYCLOPEDIA="/media/terrobyte/dev_2021-08aug-10/c#-2021_08aug_10/Troelsen_yasik-programmirovaniya-csharp-7/MySummary-2021_08aug_10/dotnetCoreVersion-you_created_changelog-work_here/";
  environment.variables.NIXPKGS_ALLOW_UNFREE = "1";
}
