{ config, pkgs, ... }:

{
	####Define a user account. Don't forget to set a password with ‘passwd’.
	##users.users.jane = {
	##	isNormalUser = true;
	##	extraGroups = [ "wheel" ];
	##	#### "wheel" - enables ‘sudo’ for the user
	##};
	users.users.art =
		{
			isNormalUser = true;
			extraGroups = [ "wheel" "sound" "networkmanager" "pulse" "audio"
											"scanner" "lp"];
			####After editing groups settings you should proceed login/logout
			####
			####"audio" --- this group allows the user have access to pulseaudio
			####	server
			home = "/home/art";
			#### { home = ".."; } - actually it's unnecessary
			uid = 999;
			####uid = ... --- ****I've changed it to 999 once, but I was still 999.
			####	Maybe it works only while creating new user
			####
		};
	##users.users.papa =
	##	{
	##		isNormalUser = true;
	##		extraGroups = [ "wheel" "sound" "networkmanager" "pulse" "audio"
	##										"scanner" "lp"];
	##		home = "/home/papa";
	##		uid = 1998;
	##	};
	users.mutableUsers = true;
	####users.mutableUsers - allow to change users' options outside this config
	####	file. By default it's `true`. Wihtout true you can't even use
	####	`useradd` utilite


	home-manager.users.art = { pkgs, ... }: {
		nixpkgs.config.allowUnfree = true;
		nixpkgs.config.allowBroken = true;
		####...allowUnfree... --- it gives effect only to this certain block
		####	
		####	For some reason, even if these lines are placed on top of
		####		./configuration.nix, they don't give effect to this block
		####	

		home.packages = [ pkgs.snake4 ];
		programs =
		{
			vscode = {
				enable = true;
				extensions = with pkgs; [
					vscode-extensions.ms-dotnettools.csharp
					vscode-extensions.ms-python.python
					vscode-extensions.ms-toolsai.jupyter
					##unstable.vscode-extensions.vscodevim.vim
		 		];
		 	};
		};
	};
}
