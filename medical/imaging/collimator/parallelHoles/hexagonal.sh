#!/bin/sh
output=${0%.sh}.tg

echo "Generate $output file..."
cat > $output <<EOF
:volu hall BOX 150 150 150 G4_AIR
:vis hall OFF

:volu collimator BOX 100 100 50 G4_Pb
:color collimator 0.57 0.63 0.63

:rotm r000 0 0 0
:place collimator 1 hall r000 0 0 0

:volu hole POLYHEDRA 0 360 6 2 -50 0 2 50 0 2 G4_AIR
:color hole 0.57 0.63 0.63

EOF

i=0
for (( x=-90; x<100; x+=10 )); do
  for (( y=-90; y<100; y+=10 )); do
    echo ":place hole $i collimator r000 $x $y 0" >> $output
    let i++
  done
done

echo "Generate HepRepFile..."
G4VIS_DEFAULT_DRIVER=HepRepFile gears hexagonal.mac

