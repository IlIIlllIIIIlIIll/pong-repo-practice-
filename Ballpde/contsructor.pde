//Global Variables and Objects
Ball myBall, movedBall;
Ball[] fireworks = new Ball[25];
Paddle myPaddle, yourPaddle;
//
color pongTableColour = 255; //ERROR: move to Table CLASS, 255 is full BLUE
float gravity=0.5;
//
void setup() {
  fullScreen();
  /*ScreenSizeChecker() for Landscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  myBall = new Ball(); // Both 1/2's of Constructor
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth*-1, displayHeight*-1, 0.5);
  }
  movedBall = new Ball(displayWidth*-1, displayHeight*-1, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  myPaddle = new Paddle( 0, myBall.diameter );
  yourPaddle = new Paddle( displayWidth, myBall.diameter );
  //
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  //
  //Paddles drawn before the ball
  myPaddle.draw();
  yourPaddle.draw();
  //
  //Update the Paddle Position for the Ball, before drawing the Ball
  //This update does not need to run in draw(), only at end of setup()
  //Note: pick a paddle that will always be instantiated here
  //Note: easier to iterate through an array here than somewhere else
  // float paddledisplayWidthParameter, float myPaddledisplayHeightParameter, float yourPaddledisplayHeightParameter
  myBall.tableYUpdate(myPaddle.tableX, myPaddle.tableY, myPaddle.tabledisplayWidth, myPaddle.tabledisplayHeight, myPaddle.paddleX, yourPaddle.paddleX, myPaddle.paddleY, yourPaddle.paddleY, myPaddle.paddledisplayWidth, myPaddle.paddledisplayHeight, yourPaddle.paddledisplayHeight);
  //movedBall.tableYUpdate(myPaddle.tableY, myPaddle.tabledisplayHeight, myPaddle.tabledisplayWidth, myPaddle.tableX, myPaddle.paddleX, yourPaddle.paddleX, myPaddle.paddleY, yourPaddle.paddleY, myPaddle.paddledisplayWidth, myPaddle.paddledisplayHeight, yourPaddle.paddledisplayHeight);
  //
  if ( myBall.disappear == true ) {
    //EMPTY IF
    //myBall.step(); //Keeps active the variables but not .draw
  } else {
    myBall.draw();
  }
  if ( movedBall.disappear == true ) {
    //EMPTY IF
    //myBall.step(); //Keeps active the variables but not .draw
  } else {
    movedBall.draw();
  }
  // Trigger: Left Goal, Right Goal
  // ERROR: Ball Instance still bounces
  if ( myBall.x<(2*myBall.diameter) || myBall.x>( displayWidth - (2*myBall.diameter) ) ) myBall.goalExplosion(myBall.x, myBall.y, gravity);
  //
  //Turned off for first ball to wrok
  //if ( movedBall.x<(2*movedBall.diameter) || movedBall.x>( displayWidth - (2*movedBall.diameter) ) ) movedBall.goalExplosion(movedBall.x, movedBall.y, gravity);
  //
  //Does "infront of ball" make a difference
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i].draw(); //
  }
} //End draw
//
void keyPressed() {
  myPaddle.keyPressedWS();
  yourPaddle.keyPressedWS();
} //End keyPressed
//
void keyReleased() {
  myPaddle.keyPressedWS();
  yourPaddle.keyReleasedOL();
}
void mousePressed() {
  //

  movedBall = new Ball(mouseX, mouseY, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //CAUTION: only brings forth myBall, not last known movedBall
  //Note: .draw is not being executed so
  //myBall.disappear = true;
} //End mousePressed
//
//End DRIVER
