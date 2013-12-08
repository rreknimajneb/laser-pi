VIDEO=/dev/video1
LIST=`ls ./snaps | grep -c 'test..'`
echo "input was "$1
echo $LIST
let LIST++
echo "next num in sequence is" $LIST
fswebcam -r 640x480 -d $VIDEO ./snaps/test$LIST.jpg


#getting pictures from a camera
#fswebcam -r 356x292 -d /dev/video0 test.jpg

