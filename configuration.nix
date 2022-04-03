# Edit this configuration file to define what should be installed on
# your system.	Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix

			./bootloader.nix
			./xserver.nix
			./xserver_xdg.nix
			./packages.nix
			./users.nix
			./filesystems.nix
			./services.nix
			./printing-scanning.nix
			./networking.nix

			<home-manager/nixos>
		];


	time.timeZone = "Europe/Moscow";
	#	# ...timeZone --- Set your time zone.
	#
	i18n.defaultLocale = "en_US.UTF-8";
	####...defaultLocale --- sets LANG variable.
	####	
	####		With lxqt it will be overwritten. Along with this file, also
	####			change ~/.config/lxqt/session.conf
	####	
	#


	sound =
		{
			enable = true;
			##	Enable sound.
			mediaKeys.enable = true;
		};
	hardware.pulseaudio =
		{
			enable = true;
			extraModules = [ pkgs.pulseaudio-modules-bt ];
			package = pkgs.pulseaudioFull;
			extraConfig =
				"
					load-module module-switch-on-connect
				";
				#### "..." --- it enables switching to bluetooth device immidiatly
				####	 after its connecting
			systemWide = false;
			#### systemWide --- one man (from https://www.reddit.com/r/NixOS/comments/73qbk8/help_with_bluetooth_headset/) says that turning off allows him to liste sound
		};
	#
	#
	hardware.bluetooth =
		{
			enable = true;
			##	Enable bluetooth
			settings.General =
				{
					Enable = "Source,Sink,Media,Socket";
				};
		};
	#
	#


	# List services that you want to enable:


	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "21.11";
	# # Did you read the comment?


	environment.variables.EDITOR = "vi";
	environment.variables.SUDO_EDITOR = "vi";
	#### $SUDO_EDITOR - man of sudo says that it uses SUDO_EDITOR, VISUAL, EDITOR
	####	 variables (in that order). EDITOR is defined, but for some reason,
	####	 `sudo nixos-rebuild` still opens nano
	####			 ****it still opens with nano
	environment.variables.CURRENT_PROJECT="/media/terrobyte/dev_2021-11nov-21/python/Python_для_сложных_задач_(Дж._Вандер_Плас) (1)/";
	environment.variables.ENCYCLOPEDIA="/media/terrobyte/dev_2021-08aug-10/c#-2021_08aug_10/Troelsen_yasik-programmirovaniya-csharp-7/MySummary-2021_08aug_10/dotnetCoreVersion-you_created_changelog-work_here/";
	environment.variables.NIXPKGS_ALLOW_UNFREE = "1";
	environment.variables.GIT_TOKEN = "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"
}
