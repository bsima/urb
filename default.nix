{ pkgs ? import ./nixpkgs.nix }:

let

  pyenv  = pkgs.python2.withPackages (py: [ py.requests ]);

in

pkgs.stdenv.mkDerivation rec {
  name         = "urb";
  python       = "${pyenv}/bin/python";
  buildInputs  = [ pyenv ];
  unpackPhase  = "true";
  installPhase = ''
    mkdir -p $out/bin
    cp ${./urb} $out/bin/urb
    chmod +x $out/bin/urb
  '';
}
