ORIG=test-ben.jpg
VIDEO=/dev/video1
echo "initialize and check for file "$ORIG
if [ -e ./orig-pic/$ORIG ]
then
	echo "file exists"
	#erase original file and create a new one
	mv ./orig-pic/$ORIG ./orig-pic/old.$ORIG
	fswebcam -r 640x480 -d $VIDEO ./orig-pic/$ORIG
	else
	echo "no such file as "$ORIG " exists"
	fswebcam -r 640x480 -d $VIDEO ./orig-pic/$ORIG
	#create original image
fi
echo "erase anything in the origin and output folder"
rm ./snaps/*.jpg
rm ./stripped/*.jpg
rm ./stripped/*.png
	#take an origin picture
