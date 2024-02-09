class Ball
{
  //Global Variables
  float x, y, diameter;
  color colour;
  //
  //Constructor
  //
  Ball () {
    //consructor is hard coded, single variable object
    //local variables, deleted at end of constructor
    int startX = width*1/2;
    int startY = height*1/2;
    int referentMeasure = ( width < height ) ? width : height ; //Review Ternary Operator
    x = startX; //spawn myBall in the middle of the display
    y = startY;
    diameter = referentMeasure * 1/20;
    colour = color ( random(0, 255), random(255), random(255) ) ; //random(), random()-shortcut, casting from float to intin color var
  } // EC
  //
  void draw() {
    fill(colour); //CAUTION: must reset defaults
    ellipse(x, y, diameter, diameter); //ball
    fill(0);
  }//ED
} //End Ball
