/* known ERRORs
 - To be implemented
*/
 class Paddle {
  //Global Variables
  float playAreaWidth, playAreaHeight, playAreaX, playAreaY;
  float knotX, knotY, knotWidth, knotHeight;
  float paddleX, paddleY, paddleWidth, paddleHeight, paddleStartHeight;
  float paddleTravel;
  boolean paddleUp = false, paddleDown = false;//keyPressed in draw
  color paddleColor;
  //
  Paddle(float startPositionParameter, float ballDiameterParameter) {
    knotWidth = (ballDiameterParameter*3);
    paddleWidth = (ballDiameterParameter/2); //Ball Radius
    playAreaY = height/10;//smallest Y value for paddle movement
    playAreaHeight = (height*4)/5;
    if ( startPositionParameter == 0 ) knotX = startPositionParameter; //Adding to the knotX
    if ( startPositionParameter == width ) knotX = startPositionParameter - (knotWidth*2) - paddleWidth; //Subtracting the knotX
    this.paddleX = knotX + knotWidth; //netX has two values, fix ERROR
    if ( startPositionParameter == width ) knotX = startPositionParameter - knotWidth;
    this.paddleStartHeight = ( 0.25 );//has to be decimal
    this.paddleHeight = (playAreaHeight * paddleStartHeight);
    this.paddleY = playAreaY + (playAreaHeight/2) - (paddleHeight/2);
    this.paddleTravel = (playAreaHeight/50);//paddle speed
    this.paddleColor = color (int(random(0,255)), int(random(0,255)), int(random(0,255)));
  }//end paddle(float, float)
  //
  void drawPaddle() {
    fill(paddleColor);
    noStroke();
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    fill(0);
  }//end drawPaddle
  void paddleMove() {
    if (paddleUp) paddleUp();
    if (paddleDown) paddleDown();
  }
  void paddleUp() {
    paddleY -= (paddleTravel);//moving up
    if (paddleY < playAreaY) paddleY = playAreaY;//error catch: will not go off screen
  }//paddleUp
  void paddleDown() {
    paddleY += (paddleTravel);//moving down
    if (paddleY > playAreaY+playAreaHeight-paddleHeight) paddleY = playAreaY+playAreaHeight-paddleHeight;//error catch: will not go off screen
  }//end paddleDown
  void paddleKeyPressedWASD() {
    if (key == 'w' || key == 'W') firstPaddle.paddleUp = true;
    if (key == 's' || key == 'S') firstPaddle.paddleDown = true; 
  }
  void paddleKeyPressedARROWKEYS() {
    if (key == CODED & keyCode == UP) secondPaddle.paddleUp = true;
    if (key == CODED & keyCode == DOWN) secondPaddle.paddleDown = true;
  }
  void paddleKeyReleasedWSAD() {
    if (key == 'w' || key == 'W') firstPaddle.paddleUp = false;
    if (key == 's' || key == 'S') firstPaddle.paddleDown = false; 
  }
  void paddleKeyReleasedARROWKEYS() {
    if (key == CODED & keyCode == UP) secondPaddle.paddleUp = false;
    if (key == CODED & keyCode == DOWN) secondPaddle.paddleDown = false;
  }
}//end Paddle
//end pongPaddle
