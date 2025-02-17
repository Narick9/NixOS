{ config, pkgs, ... }:


let
	##oldpkgs = import <nixos-old> {};
	##newpkgs = import <nixos-unstable> {};
in
{
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.allowBroken = true;
	####...allowUnfree... --- it gives effect only to this certain .nix file


	services.flatpak.enable = true;


	environment.systemPackages = with pkgs;
		[
			vim
			####vim --- Do not forget to add an editor to edit
			####	configuration.nix! The Nano editor is also installed by
			####	default.
			neofetch
			tmux
			zip
			unzip
			lm_sensors
			exfat
			ntfs3g
			pciutils
			usbutils
			##bootiso
			####bootiso --- by some reason, nixos-rebuild makes a mistake on it
			acpi
			unrar
			binutils
			####binutils --- it's some binaries manipulating utils (linker, ar,
			####	assembler, etc.)
			##emacs-nox
			xdotool
			####xdotool --- util to manipulate of X windows
			##newpkgs.mesa
			
	
			dotnet-sdk
			git
			##git-lfs
			wine
			gcc
			python39
			jupyter
			####jupyter --- it's also appeared below (with other python
			####	packages)
			##python39Packages.ipykernel
			##etcher
			##vscode
			#### code - it has different name actually
			#### vscode - yeah, exactly this name
			vscode-with-extensions
	
			##opera
			vlc
			##steam
			##dconf-editor
			hardinfo
			discord
			libreoffice
			qbittorrent
			##teamviewer
			calibre
			zoom-us
			anydesk
			##gnome.gnome-notes
			brave
			whatsapp-for-linux
			playerctl
			####playerctl --- with this great utility you can control
			####	media with your wished buttons under any DE!
			nomacs
	
			unciv
	
			liberation_ttf_v1
			#### liveration_... --- it provides three sets:
			####	 > Sans - it's like Arial, Albany, Helvetica, ...
			####	 > Serif - it's like Times New Roman, Thorndale, Nimbus
			####	   Roman, ...
			####	 > Mono - it's like Courier New, Cumberland, Courier, ...
	
			##if config.services.xserver.enable then
			##	# if .. - it doesn't work here
	
			##gnome.dconf-editor
			##gnome.gnome-tweaks
			#### gnome-tweaks - dconf can do everything that tweaks can.
			####	 But, for some reason, only gnome-tweaks can list your
			####	 available gnome themes

			xorg.libxcb
		];
	#	#List packages installed in system profile. To search, run:
	#	#
	#	#		$ nix search wget
	#	#


	#if config.services.xserver.enable then
	#	 environment.systemPackages = with pkgs; [
	#		 opera
	#	 ];


	#programs.steam.enable = true;
	#nixpkgs.config.packageOverrides = pkgs: {
	#	steam = pkgs.steam.override {
	#		nativeOnly = true;
	#		extraPkgs = pkgs: [
	#			ia32-libs
	#		];
	#	};
	#};
	#hardware.steam-hardware.enable = true;
	#
	# Didn't work. Steam can't start purely


	nixpkgs.config.firefox.enableGoogleTalkPlugin = false;
	# nixpkgs - hmm.. it doesn't exist


	environment.etc."bashrc.local".text =
		''
			#!/bin/bash
			#set -o vi
			
			export GIT_EDITOR="vim"

			#echo $ENCYCLOPEDIA
			#	# ENCYCLOPEDIA --- all environment variables are defined 
			#	#	 in configuration.nix
			
			nix-shell --run "ipython --ipython-dir=/etc/ipython/" \
				--packages python39Packages.line_profiler \
				--packages python39Packages.memory_profiler \
				--packages python39Packages.tensorflow \
				--packages python39Packages.numpy \
				--packages python39Packages.pandas \
				--packages python39Packages.tkinter \
				--packages python39Packages.seaborn \
				--packages python39Packages.ipykernel \
				--packages python39Packages.scikit-learn \
				##--packages python39Packages.scikit-learn-extra \
				####...scikit-learn-extra... --- with it ipython gives an
				####	error
				--packages vscode-extensions.ms-toolsai.jupyter \
				--packages vscode-extensions.ms-python.python \
				##--packages vscode-extensions.ms-dotnettools.csharp \
				##--packages vscode-extensions.vscodevim.vim
				##--packages python39Packages.scikit-help-testdata
				##--packages python39Packages.
				##--packages vscode-extensions.vscodevim.vim
				##--packages python39Packages.jupyter \
				####...jupyter --- if you want to use jupyter
				####	under common bash (in other words, without ipython),
				####    install it like average linux package, not like
				####	ipython module
				####Python packages first appeared in shell.nix
				####	****false
		'';


	environment.etc."ipython/profile_default/ipython_config.py".text =
		''
c.TerminalInteractiveShell.editing_mode = 'vi'
		'';
	environment.etc."ipython/profile_default/startup/00-variables.py".text =
		''
			##import os
			##import numpy as np
			##import pandas as pd
			#### numpy, pandas --- importing them is too long
			####	 (****updated: it seems that no. ipython is by himself
			####	 		heavy enough to take 2-3 seconds)

			#CURRENT_PROJECT = os.getenv("CURRENT_PROJECT")
			#ENCYCLOPEDIA = os.getenv("ENCYCLOPEDIA")
		'';
		environment.etc."jupyter/jupyter_notebook_config.py".text =
		''
			##c.NotebookApp.notebook_dir = '/media/terrobyte/dev_2021-11nov-21/python/Python_для_сложных_задач_(Дж._Вандер_Плас) (1)/'
		'';


	programs.chromium =
	#### ...chromium... --- doesn't work with Brave browser
		{
			extensions =
				[
					"aapbdbdomjkkjkaonfhkkikfgjllcleb"
					#### google translate
				];
		};
			
			
			
			
}
