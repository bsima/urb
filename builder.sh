source $stdenv/setup

mkdir -p $out/bin

cp $srcFile $out/bin/urb

chmod +x $out/bin/urb

sed -i "s|/usr/bin/python|$python|" $out/bin/urb
