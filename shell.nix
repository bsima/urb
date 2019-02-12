{ pkgs ? import <nixpkgs> {} }:

let

  urb = import ./default.nix { inherit pkgs; };

in

pkgs.stdenv.mkDerivation rec {
  name        = "urb-env";
  env         = pkgs.buildEnv { name = "urb-env"; paths = [ urb ]; };
}
