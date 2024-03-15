//Global Variables and objects
Ball firstBall; //Both halfs of Constructor
Ball cheatBall;//appears when clicked
Ball[] firework = new Ball[10];//generates multiple balls that fall with gravity
Paddle firstPaddle, secondPaddle;
color backgroundColor;
color pongTableColor = 0;
//
void setup() {
  size( 700, 400 );//width and height of canvas //fullscreen(); = size(displayWidth, displayHeight);
  /*ScreenSizeChecker(); //for landscape, portrait or square veiw
   Automatically adjusts for screen rotaction or change*/
  firstBall = new Ball();
  cheatBall = new Ball(width*-1, height*-1, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);
  for (int i=0; i < firework.length; i++) firework[i] = new Ball(width*-1, height*-1, (1/2));//populating firework
  firstPaddle = new Paddle( 0, firstBall.ballDiameter );
  secondPaddle = new Paddle( width, firstBall.ballDiameter );
  firstBall.disappear = false;
  backgroundColor = color(int(random(0, 255)), int(random(0, 50)), int(random(0, 5)));
}//end setup
//
void draw() {
  background(backgroundColor);
  firstPaddle.drawPaddle();
  secondPaddle.drawPaddle();
  firstPaddle.paddleMove();
  secondPaddle.paddleMove();
  for (int i=0; i < firework.length; i++) firework[i].ballDraw(); //drawing multiple balls
  explosions();
  if (firstBall.disappear) {/*empty if*/
  } else firstBall.ballDraw();
  if (cheatBall.disappear) {/*empty if*/
  } else cheatBall.ballDraw();
  //float playAreaYLocal, float playAreaHeightLocal, float playAreaWidthLocal, float playAreaXLocal, float paddleXLocal, float paddleYLocal, float paddleWidthLocal, float paddleHeightLocal
  firstBall.collisionsUpdate(firstPaddle.playAreaY, firstPaddle.playAreaHeight, firstPaddle.playAreaWidth, firstPaddle.playAreaX, firstPaddle.paddleX, firstPaddle.paddleY, firstPaddle.paddleWidth, firstPaddle.paddleHeight, firstPaddle.paddleWidth, secondPaddle.paddleWidth, firstPaddle.paddleHeight, secondPaddle.paddleHeight);
}//end draw
//
void keyPressed() {
  if (key == '1') firstBall.disappear = true;
  if (key == '2') cheatBall.disappear = true;
  firstPaddle.paddleKeyPressedWASD();
  secondPaddle.paddleKeyPressedARROWKEYS();
}//end keyPressed
void keyReleased() {
  firstPaddle.paddleKeyReleasedWSAD();
  secondPaddle.paddleKeyReleasedARROWKEYS();
}
//
void mousePressed() {
  for (int i=0; i < firework.length; i++) firework[i] = new Ball(int(mouseX), int(mouseY), 0.5);//populating firework
  cheatBall = new Ball(mouseX, mouseY, firstBall.ballDiameter, firstBall.ballColor, firstBall.xVelocity, firstBall.yVelocity);//initiates after mousePressed
}//end mousepressed
//
void explosions() { //firework effect when goal region hit
  if (mousePressed) cheatBall.disappear  = false;
  if (firstBall.ballX <= (firstBall.ballDiameter/2) || firstBall.ballX >= (width)-(firstBall.ballDiameter/2)) {
    for (int i=0; i < firework.length; i++)
      firework[i] = new Ball(firstBall.ballX, firstBall.ballY, 0.5); //drawing multiple balls
  }
  if (!cheatBall.disappear) {
    if (cheatBall.ballX <= (cheatBall.ballDiameter/2) || cheatBall.ballX >= (width)-(cheatBall.ballDiameter/2)) {
      for (int i=0; i < firework.length; i++)
        firework[i] = new Ball(cheatBall.ballX, cheatBall.ballY, 0.5); //drawing multiple balls
    }
  }
}//end explosions
//
void ballCollisions() {
  /*
  if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
   if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) ballColor = color(int(random(0, 255)), int(random(0,255)), int(random(0,255)));
   if (ballX < (ballDiameter/2) || ballX > (width)-(ballDiameter/2)) (xVelocity) *= -1;
   if (ballY < (ballDiameter/2) || ballY > (height)-(ballDiameter/2)) (yVelocity) *= -1;
   */
}//end ballCollisions
//end ClassMetaphors
