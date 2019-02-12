{ pkgs ? import <nixpkgs> {} }:

let

  urb = import ./default.nix { inherit pkgs; };

in

pkgs.stdenv.mkDerivation rec {
  name        = "urb-env";
  buildInputs = [ urb ];
  env         = pkgs.buildEnv { inherit name; paths = buildInputs; };
}
