{ pkgs ? import <nixpkgs> {} }:


let
  python-with-my-packages = pkgs.python3.withPackages (p: with p; [
    ipython
    tkinter
    line_profiler
    memory_profiler
    ##jupyter  # defined at packages.nix
    seaborn

    numpy
    pandas
    tensorflow
    # other python packages you want
  ]);
in


pkgs.mkShell
{
  buildInputs =
    [
      python-with-my-packages
      # other dependencies
    ];
  shellHook =
    ''
      echo "Hello, Artur's default shell!"
      PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
      # maybe set more env-vars
    '';
}
