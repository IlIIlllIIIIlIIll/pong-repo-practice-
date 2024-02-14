//Global Variables and Objects
Ball myBall; // Both 1/2's of Constructor
/*Ball yourBall;
Ball tBall;
Ball aBall;
*/
Ball[] fireworks = new Firework[69];
//
color pongTableColour = 0; //ERROR: move to Table CLASS, 255 is full BLUE
//
void setup() {
  fullScreen(); //fullScreen(); displayWidth, displayHeight
  /*ScreenSizeChecker() for Lnadscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  myBall = new Ball(); // Both 1/2's of Constructor
  fireworks[69] = new Firework();
  /*yourBall = new Ball();
  tBall = new Ball();
  aBall = new Ball();
  */
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  myBall.draw();
  /*yourBall.draw();
  tBall.draw();
  aBall.draw();
  */
} //End draw
//
void keyPressed() {
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End DRIVER
