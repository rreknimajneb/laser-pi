#### variables ####
WIDTH=320
HEIGHT=240
MASKOUT=green-mask.jpg


#### function definitions ####
function depend_chk {

	echo "fbi = " `command -v fbi`
	#-z unary test for nul string#
	echo "fbset = " ` which fbset`
	echo "gpio = " `which gpio`
	echo "convert = " `which convert`
	echo "imagemagick = " `which imagemagick`
	echo "raspistill = " `which raspistill`
	echo "fswebcam = " `which fswebcam`
}

function display_chk {
	echo "find the screen"
	SCRN=`ls /dev/fb*`
	echo "frame buffer = ?? "$SCRN
	DISP=`env | grep DISPLAY`
	echo "display? = "$DISP
}

function show_pic {
	local PIC=$1
	WIDTH=`identify -format '%w\n' $PIC #image width` #sets global WIDTH
	HEIGHT=`identify -format '%h\n' $PIC #image heigth`
	echo "local image "$PIC "width="$WIDTH "and tall="$HEIGHT
	sudo fbi -T 1 -v $PIC
	#fbi -d /dev/fb0 #$pic #if launched directly from pi
	# fbi OPTIONS
	#   -d device
	#   framebuffer device to use.  Default is the one your vc is mapped to.
}

function mask_green {
	local FUZZ=19%
	local PIC=$1
	echo "local green mask function using pic="$PIC
	convert $PIC -colorspace RGB -channel G -separate $MASKOUT
	convert $MASKOUT -negate -fill white -fuzz $FUZZ +opaque black -fill black +opaque white $MASKOUT
}

##### main program #####

echo " check for dependencies"
depend_chk
echo "check for displays"
display_chk
echo "actually show pics"
show_pic $1
echo "create green mask in 5 seconds"
sleep 5
mask_green $1
echo "now show mask"
show_pic $MASKOUT






#start.sh
#snaps.sh
#strip.sh #$pic 




# http://unix.stackexchange.com/questions/17255/is-there-a-command-to-list-all-open-displays-on-a-machine
# local displays correspond to a socket in /tmp/.X11-unix.
# ls /tmp/.X11-unix
# cd /tmp/.X11-unix && for x in X*; do echo ":${x#X}"; done
# (results for above 2 lines were X0 and :0 respectively)
# /opt/vc/bin/tvservice



