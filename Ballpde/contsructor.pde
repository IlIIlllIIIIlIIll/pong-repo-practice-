//Global Variables
//
void setup() {
  size(600, 400); //fullScreen(); displayWidth, displayHeight
  /*ScreenSizeChecker() for Lnadscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  Ball myBall = new Ball(); // Line = 1/2 of Constructor
  // local variables to create other variables
  int startX = width*1/2;
  int startY = height*1/2;
  int referentMeasure = ( width < height ) ? width : height ; //Review Ternary Operator
  //Population of Object's Variables = other 1/2 of Constructor
  myBall.x = startX; //spawn myBall in the middle of the display
  myBall.y = startY;
  myBall.diameter = referentMeasure * 1/20;
  myBall.colour = color ( random(0, 255), random(255), random(255) ) ; //random(), random()-shortcut, casting from float to intin color var
  //Code that uses Object Variables
  fill(myBall.colour); //CAUTION: must reset defaults
  ellipse(myBall.x, myBall.y, myBall.diameter, myBall.diameter); //ball
  fill(0); //Reset to GrayScale: 0 to 255 in shades of gray
  //What if?
  //Ball yourBall = new Ball();
  //yourBall.x =
  //
} //End setup
//
void draw() {
  //EMPTY Loop
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End DRIVER
