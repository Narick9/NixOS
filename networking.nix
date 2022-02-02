{ config, pkgs, ... }:
		####


{
	networking =
	{
		hostName = "nixos-papa";
		#### ...hostName --- Define your hostname.
		networkmanager =
		####...networkmanager... --- Some DEs (e.g. GNOME) requires and uses
		####	this wifi handler
		####
		####		All users must be in `networkmanager` group to change
		####			wifi settings
		####
		####		NetworkManager is controlled by either `nmcli` or `nmtui`
		####			packages. Some DEs (GNOME, KDE) have their own
		####			tool for NetworkManager
		####
			{
				enable = true;
			};
		#
		#
		#wireless =
		####...wireless... --- Enables wireless support via wpa_supplicant.
		####	****you should follow nixos manual instructions. With nixos wiki
		####	instructions you were in troubles
		####
		####		You either use networkmanager or wpa_supplicant
		####
		#	{
		#		enable = true;
		#		#interfaces =
		#		#  [
		#		#    "wlo1"
		#		#  ];
		#		#### intefaces = ... --- it causes not working wifi for some reason 
		#		networks =
		#		{
		#			"mercusys_muslimov".psk = "power_123";
		#		};
		#	};
		#
		#
		useDHCP = false;
		#### ...useDHCP --- The global useDHCP flag is deprecated, therefore
		####   explicitly set to false here. Per-interface useDHCP will be mandatory
		####   in the future, so this generated config
		####   replicates the default behaviour.
		#interfaces.enp3s25.useDHCP = true;
		#### ...enp3s0... --- you don't have it on your notebook
	};
}
