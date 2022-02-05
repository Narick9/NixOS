{ config, pkgs, ... }:

{
	services.printing.enable = true;
	services.printing.drivers = [ pkgs.gutenprint pkgs.gutenprintBin ];
	#### ...gutenprint... --- it's drivers for many different printers
	#### ...gutenprintBin... --- it's binary-only drivers for additional printers


	hardware.sane =
	####sane --- SANE library provides scanner support
	####    
	####    User should be placed to `scanner` and `lp` group to be able to scan
	####    
	{
		enable = true;
		extraBackends = [ pkgs.hplipWithPlugin ];
	};
}
