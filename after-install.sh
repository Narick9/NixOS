#/bin/sh

# These are some thing that nix expressions can't do (maybe can, afterall)
sudo chmod 777 -R /etc/nixos/
sudo chmod 777 -R /etc/ipython/
sudo chown -R art /etc/nixos/
