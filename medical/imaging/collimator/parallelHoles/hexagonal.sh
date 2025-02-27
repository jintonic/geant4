#!/bin/sh

cat > hexagonalHoles.tg <<EOF
:volu hall BOX 1*m 1*m 1*m G4_AIR

:rotm r000 0 0 0

:solid base BOX 100 100 100
:solid hole POLYHEDRA 0 360 6 2 -101 0 2 101 0 2
EOF

for (( x=0; x<30; x+=3 ))
do
  echo ":solid geom SUBTRACTION base hole r000 $x 0 0" >> hexagonalHoles.tg
done

cat >> hexagonalHoles.tg <<EOF

:volu collimator geom G4_Pb
:color collimator 0.9 0.3 0.2
:place collimator 1 hall r000 0 0 0

EOF
