{ config, ... }:

{
	# Configure keymap in X11
	services.xserver =
	{
		exportConfiguration = true;
		#### link /usr/share/X11/ properly (maybe you don't need it)

		enable = true;
		#### Enable the X11 windowing system.
		layout = "us,ru";

		#xkpOptions = "eurosign:e, compose:menu, grp"alt_space_toggle";
		#### I don't know what do these options do
		xkbOptions = "grp:alt_shift_toggle, ctrl:nocaps, terminate:ctrl_alt_bksp";
		#### "..." --- with new lines here Xorg doesn't start. Only commas are
		####	legitimate (****apparently)
		#### grp:alt_shift_toggle --- sets layout toggle to Alt+Shift
		#### ctrl:swapcaps --- swaps Ctrl and Casp lock
		#### ctrl:nocaps --- sets Caps lock to Ctrl
		#### terminate: --- terminates Xorg
	};


	#services.xserver.videoDrivers = [ "mesa" ];
	# ..videoDriver - you can set desired video driver

	
	#services.xserver.displayManager.startx.enable = true;
	#### startx --- you need manually to write ~/.xinitrc
	#
	#services.xserver.displayManager.sddm.enable = true;
	#services.xserver.displayManager.sddm.autoLogin.user = "art";
	#services.xserver.displayManager.sddm.autoLogin.enable = true;
	#### sddm --- it on papa's computer doesn't work (single underscore
	####	 at left up corner)
	#
	#services.xserver.displayManager.autoLogin.enable = true;
	#services.xserver.displayManager.autoLogin.user = "art";
	services.xserver.displayManager.defaultSession = "gnome";
	#### autoLogin --- it doesn't work on papa's pc (nothing happens)
	#
	#services.xserver.displayManager.lightdm.enable = false;
	#### ... = false --- if lightdm isn't false, so it's true
	#services.xserver.displayManager.lightdm.autoLogin.timeout = 5;
	#### ...autoLogin.timeout... - on old versions of LightDM there was a bug,
	####	if this option is set to 0, so autologin doesn't work
	####
	####			At 2022_01jan_19 on NixOS 21.11 with 0 setted autologin didn't
	####				worked
	####
	#
	#services.xserver.displayManager.gdm.enable = true;
	#### gdm --- it doesn't work on papa's computer (computer starts with tty)
	####			 ****maybe it would work without ...autoLogin enabled
	####					 (on papa's notebook it worked without autoLogin)
	#
	#
	services.xserver.desktopManager.gnome.enable = true;
	#services.xserver.desktopManager.gnome3.enable = true;
	#
	#services.xserver.desktopManager.mate.enable = true;
	#				 # gnome3 - doesn't work
	#services.xserver.displayManager.gdm.enable = true;
	#services.xserver.displayManager.gdm.wayland = false;
	#				 # ..gdm.enable - by default enabled LigthDM. If you
	#				 #	 want to use GDM, you should use GNOME, because
	#				 #	 without GNOME some features (as screen lock) might
	#				 #	 not work
	#
	#services.xserver.desktopManager.xfce.enable = true;
	#services.xserver.displayManager.defaultSession = "xfce";
	#
	#services.xserver.desktopManager.lxde.enable = true;
	#	# ...lxde... --- somehow it doesn't exist in nixos (still)
	#
	#services.xserver.desktopManager.lumina.enable = true;
	#	# ...lumina... --- it doesn't have its own wifi manager
	#
	services.xserver.desktopManager.lxqt.enable = true;
	#	# ...lxqt... --- it doesn't have its own wifi manager
	


	hardware.opengl.driSupport32Bit = true;
	#				 # ..dirSupport32Bit = true; - enabling OpenGL for 32 programs
	#				 #	 (for fine, for example Wine)


	services.xserver.libinput.enable = true;
	#	# Enable touchpad support (enabled default in most desktopManagers).
	services.xserver.libinput.mouse =
		{
			buttonMapping = "1 2 3 4 5 6 7 2 0";
			#	# ..."1 2 3... --- it's for trackball
			#	#
			#	#		 if you press 1st button (1st
			#	#			 hardware button), you
			#	#			 will press 1st software
			#	#			 button. If you press
			#	#			 8th hardware button
			#	#			 (it's left little button
			#	#			 ), you will press
			#	#			 2nd software one (it's
			#	#			 middle click)
			#	#
			#	#			It work only with Xorg server. If
			#	#				you are on wayland, you sh should
			#	#				use dconf-editor (https://connectiv.wordpress.com/2020/04/28/logitech-marble-mouse-scroll-on-fedora/)
			scrollMethod = "button";
			scrollButton = 9;
			#	# "button" --- it's for trackball
			#	# ****doesn't work with GNOME 4 for some reason,
			#	#		 so just use gnome.dconf-editor
			accelSpeed = "1";
			#	# "1" --- it should be in range [-1; 1] or you
			#	#	 won't get affect
			#	#	 ****is it scroll speed?

		};

	#services.xserver.libinput.mouse.touchpad =
	#	{
	#		scrollMethod = "edge";
	#		##	"edge" --- it's for touchpad
	#	}


	services.xserver.xrandrHeads =
		[
			####"NotebookDisplay"
			{
				output = "LVDS-1";
				primary = false;
				monitorConfig =
					''
						Option "Enable" "false"
						#### Option "Enable" --- for some reason it doesn't work
					'';
			}
			####"ExternalMonitor"
			{
				output = "DP-1";
				primary = true;
				####monitorConfig =
				####	''
				####		D
				####	'';
			}
		];
}
