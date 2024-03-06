/* Known ERRORs
 - TBA
 */
class Paddle {
  //
  //Global Variables
  float tableX, tableY, tableWidth, tableHeight;
  float netX, netY, netWidth, netHeight;
  float paddleX, paddleY, paddleWidth, paddleHeight;
  color paddleColour;
  //
  //Overloaded Constructor
  //Purpose: left and right paddles
  Paddle (float paddleStartParameter, float ballDiameterParameter ) {
    netWidth = ballDiameterParameter * 3;
    paddleWidth = ;
    //CAUTION: netX will have the same value
    if ( paddleStartParameter == 0 ) netX = paddleStartParameter; //Adding to the netX
    if ( paddleStartParameter == width ) {
      netX = paddleStartParameter - netWidth; //Subtracting the netX
    }
    this.paddleX = netX + netWidth;
    paddleY = ;
    
    paddleHeight = ;
    paddleColour = ;
    
  } //End Paddle Constructor
  //
  void draw() {
  } //End draw
  //
  //VOIDS and Returns
  //
} //End Paddle
