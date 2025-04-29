#!/bin/sh

for file in `ls -1 *.tg`; do
  shape=${file%.tg}
  mkdir -p $shape
  for angle in {1..89}; do
    sed "s/89.9/$angle/" $shape.tg > detector.tg
    G4RUN_MANAGER_TYPE=Serial G4VIS_DEFAULT_DRIVER=TSG_FILE mingle mingle.mac
    cp *.png $shape/$angle.png
    mv *.png $shape/$((179-angle)).png
  done
  ffmpeg -i $shape/%d.png -y $shape.gif
done
rm -f detector.tg