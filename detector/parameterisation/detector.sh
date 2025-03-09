#!/bin/sh
output=${0%.sh}.tg

echo "Generate $output file..."
cat > $output <<EOF
:volu World BOX 2940 2940 2940 G4_AIR
:volu Target TUBS 0 25 25 0 360 G4_Pb
:volu Tracker TUBS 0 2400 2400 0 360 G4_AIR

:rotm r000 0 0 0
:place Tracker 0 World r000 0 0 0
:place Target 0 World r000 0 0 -2425
EOF

for (( i=0; i<5; i+=1 )); do
  echo ":volu Chamber$i TUBS 0 240+540*$i 100 0 360 G4_Xe" >> $output
  echo ":place Chamber$i $i Tracker r000 0 0 -1600+800*$i" >> $output
done

echo "Generate animation..."
G4VIS_DEFAULT_DRIVER=TSG_FILE gears gears.mac

