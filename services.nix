{ config, pkgs, ... }:


{
  #systemd."network-addresses-enp3s0.service".enable = false;
  # doesn't exist
  services.blueman.enable = true;
  ##	blueman - it's for cases, when your GUI isn't heavy enough to have
  ##		it's own GUI bluetooth tool
}
