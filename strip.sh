#warn if missing input param ($1)

BASE=./orig-pic/test-ben.jpg
LASER=./snaps/$1
echo "background is= "$BASE"    foreground is "$LASER

#convert $laser -colorspace HSL -modulate 100,100,166.6 Hue -separate ./stripped/output_pictst2.jpg
convert $LASER -channel G -separate ./stripped/chn-grn-$1
NAME=`echo $1 | tr ".jpg" .png`
echo "NAME var is "$NAME
convert $LASER $BASE -fuzz 15% -compose ChangeMask  -composite ./stripped/bkg-rm-$NAME.png
#convert $LASER $BASE -fuzz 20% -compose ChangeMask  -composite ./stripped/back-removed.png
# how to read a particlau line in a file # head -n 1 file.txt
