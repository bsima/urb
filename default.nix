{ pkgs ? import ./nixpkgs.nix }:

let

  pyenv = pkgs.python2.withPackages (py: [ py.requests ]);
  pyexe = "${pyenv}/bin/python";

in

pkgs.stdenv.mkDerivation rec {
  name         = "urb";
  buildInputs  = [ pyenv ];
  unpackPhase  = "true";
  installPhase = ''
    mkdir -p $out/bin
    cp ${./urb} $out/bin/urb.py
    cat > $out/bin/urb <<EOF
    #!/usr/bin/env bash
    ${pyexe} $out/bin/urb.py "\$@"
    EOF
    chmod +x $out/bin/urb
  '';
}
