THe idea is that you have a raspberry pi with a camera and a projector.  You use a laster to paint on the wall.  The raspberry pi will watch you 'paint' on the wall and take pictures.  It will then extract only the portions of the image that have laser 'paint' on them, and then change the color and use the projector to re-project the laser back onto the wall in a different color (red).

the scripts require:  imagemagick & fswebcam

Here is how it works so far.

1) Aim the camera at the wall and run$  ./start.sh
    //this erases creates a calibration image in the ./orig-pic folder

2) shine the laser on the wall and run ./snaps.sh 
    //this creates pictures in the ./snaps folder with laser 'paint'

3) run the ./strip.sh test1.jpg
    //  !!!!you must append a filename of one of your test pics!
    //  it extracts only the laser data from the test snap images

4) another script will re-combine this paint into a paint-only image.
   the pain-only image will be set to a different color (red) and sent to projector
