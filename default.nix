{ pkgs ? import <nixpkgs> {} }:

let

  pyenv  = pkgs.python2.withPackages (py: [ py.requests ]);

in

pkgs.stdenv.mkDerivation rec {
  name    = "urb";
  srcFile = ./urb;
  builder = ./builder.sh;
  python  = "${pyenv}/bin/python";
}
