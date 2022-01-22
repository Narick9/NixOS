{ config, pkgs, ... }:

{
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
  #### ...gutenprint... --- it's drivers for many different printers
  #### ...gutenprintBin... --- it's binary-only drivers for additional printers
}
