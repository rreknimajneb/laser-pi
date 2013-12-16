echo " check for dependencies"

echo "fbi = " `which fbi`
#-z unary test for nul string#
#
echo "fbset = " ` which fbset`
echo "gpio = " `which gpio`
echo "convert = " `which convert`
echo "imagemagick = " `which imagemagick`
echo "raspistill = " `which raspistill`
echo "fswebcam = " `which fswebcam`

echo "find the screen"
SCRN=`ls /dev/fb*`
echo "frame buffer = ?? "$SCRN
DISP=`env | grep DISPLAY`
echo "display? = "$DISP
#start.sh

#snaps.sh

#strip.sh #$pic 

#fbi -d /dev/fb0 #$pic #if launched directly from pi
#else
sudo fbi -T 1 -v $1


# fbi OPTIONS
#       -d device
#             framebuffer device to use.  Default is the one your vc is mapped to.



