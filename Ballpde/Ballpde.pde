/* Known ERRORs
- Night Mode: Ball Colour is Full BLUE
*/
class Ball
{
  //Global Variables
  float x, y, diameter;
  color colour;
  float xSpeed, ySpeed, xDirection, yDirection;
  //
  //Constructor
  Ball () {
    //Constructor Is ... hard coded, single variable object
    //Local Variables, deleted at end of Constructor
    int startX = width*1/2;
    int startY = height*1/2;
    int referentMeasure = ( width < height ) ? width : height ; //Review Ternary Operator
    //
    //Object Variables
    x = startX; //spawn myBall in the middle of the display
    y = startY;
    diameter = referentMeasure * 1/20;
    colour = color ( random(0, 255), random(255), random(255) ) ; //random(), random()-shortcut, casting from float to intin color var
    xSpeed = 1; //float, could be any number
    ySpeed = 1; //float, could be any number
    xDirection = -1; //float, could be any number
    yDirection = -1; //float, could be any number
  } //End Constructor
  //
  void draw() { //ball
    fill(colour);
    ellipse(x, y, diameter, diameter);
    fill(0);
    //
    step();
  }//End draw
  void step() {
    bounce();
    x += xSpeed;
    y += ySpeed;
  } //End step
  void bounce() {
    if ( x < 0+(diameter*1/2) || x > width-(diameter*1/2) ) xSpeed *= xDirection;
    if ( y < 0+(diameter*1/2) || y > height-(diameter*1/2) ) ySpeed *= yDirection;
  } //End bounce
  //
} //End Ball
