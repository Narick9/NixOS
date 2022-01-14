{ config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ];
  #     # "wheel" - enables ‘sudo’ for the user
  # };
  users.users.art =
    {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      home = "/home/art";
      #### { home = ".."; } - actually it's unnecessary
      uid = 999;
      #### uid = ... --- ****I've changed it to 999 once, but I was still 999.
      ####   Maybe it works only while creating new user
    };
  #users.mutableUsers = true;
  #### users.mutableUsers - allow to change users' options outside this config
  ####   file. By default it's `true`. Wihtout true you can't even use
  ####   `useradd` utilite
}
