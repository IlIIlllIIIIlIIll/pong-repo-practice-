/* Known ERRORs
 - TBA
 */
class Paddle {
  //
  //Global Variables
  float tableX, tableY, tabledisplayWidth, tabledisplayHeight;
  float netX, netY, netdisplayWidth, netdisplayHeight;
  float paddleX, paddleY, paddledisplayWidth, paddledisplayHeight, paddleStartdisplayHeight, paddleTravelDistance;
  color paddleColour;
  Boolean up=false, down=false;
  //
  //Overloaded Constructor
  //Purpose: left and right paddles
  Paddle ( float paddleStartParameter, float ballDiameterParameter ) {
    netdisplayWidth = ballDiameterParameter * 3;
    paddledisplayWidth = ballDiameterParameter * 1/2; //Ball Radius
    tableY = displayHeight * 1/10;
    tabledisplayHeight = displayHeight * 8/10;
    //CAUTION: netX will have the same value
    if ( paddleStartParameter == 0 ) netX = paddleStartParameter; //Adding to the netX
    if ( paddleStartParameter == displayWidth ) {
      netX = paddleStartParameter - netdisplayWidth *2 - paddledisplayWidth; //Subtracting the netX
    }
    this.paddleX = netX + netdisplayWidth; //CAUTION: netX has two values, ERROR
    if ( paddleStartParameter == displayWidth ) netX = paddleStartParameter - netdisplayWidth;
    this.paddleStartdisplayHeight = 0.25; //if Easter Egg number must be tracked
    this.paddledisplayHeight = tabledisplayHeight * paddleStartdisplayHeight;
    this.paddleY = tableY + ( tabledisplayHeight * 1/2 ) - ( paddledisplayHeight *1/2 );
    paddleColour = 0; //Grey Scale, not RGB, color ( int(random()), int(random()), int(random()) )
    this.paddleTravelDistance = 1; //Easter Egg: paddle speed is 1 pixel
  } //End Paddle Constructor
  //
  void draw() {
    fill(paddleColour);
    paddles();
    fill(0); //Reset Defaults
    //
    //Arithmetic for Paddles
    if ( up == true ) movePaddleUp();
    if ( down == true ) movePaddleDown();
  } //End draw
  //
  //VOIDS and Returns
  //Draw Paddles
  void paddles() {
    rect(paddleX, paddleY, paddledisplayWidth, paddledisplayHeight);
  } //End Paddles
  void movePaddleDown() {
    paddleY += paddleTravelDistance;
    if ( paddleY > tableY+tabledisplayHeight-paddledisplayHeight ) paddleY = tableY+tabledisplayHeight-paddledisplayHeight; //ERROR Catch
    //down = false; //ERROR: boolean reset means one paddle at a time, no gamie
  } //End Move Paddles
  void movePaddleUp() {
    paddleY -= paddleTravelDistance;
    if ( paddleY < tableY ) paddleY = tableY; //ERROR Catch
    //up = false; //ERROR: boolean reset means one paddle at a time, no gamie
  } //End Move Paddles
  //
  void keyPressedWS() {
    if ( key=='W' | key=='w' ) up=true ;
    if ( key=='S' | key=='s' ) down=true;
  }
  void keyPressedOL() {
    if ( key==CODED & keyCode==UP ) up=true;
    if ( key==CODED & keyCode==DOWN ) down=true;
  }
  void keyReleasedWS() {
    if ( key=='W' | key=='w' ) up=false ;
    if ( key=='S' | key=='s' ) down=false;
  }
  void keyReleasedOL() {
    if ( key==CODED & keyCode==UP ) up=false;
    if ( key==CODED & keyCode==DOWN ) down=false;
  }
} //End Paddle
