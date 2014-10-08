/* A lot of props goes to Sharang Biswas' voodoo doll sketch.
 
 Here's a version with a red ball, whose location is xPos, yPos, which can be set 
 by variable resistors (potentiometers?) on the Arduino.
*/

//PGraphics canvas;
PImage maze;
PImage scaryOne;
//color c = color(255, 255, 255); // background color as white for comparison
float xPos=0; // always start the ball at center, or start, of circle maze
float yPos=0;

color white = color(255);


//int screenX = displayWidth; 
//int screenY = displayHeight; //size of background and images

//setup
void setup()
{
  size(displayWidth, displayHeight);
  maze = loadImage("m0.png");
  scaryOne = loadImage("scary2.png");
  //canvas = createGraphics(displayWidth, displayHeight);
}

//draw stuff!!
void draw() 
{
  //canvas.beginDraw(); 
  //canvas.background(maze);
  //canvas.endDraw();

  //background(maze); // set the background as maze
  background(white);
  
  imageMode(CENTER);
  image(maze, displayWidth/2, displayHeight/2, displayHeight, displayHeight);
  

  fill(255, 0, 0);  
  noStroke();
  ellipse(xPos, yPos, 10, 10); //red ball at center. With serial communication, can change xPos and yPos with potentiometers


  if (get(mouseX, mouseY) != white) //if mouse falls within the shape, scary image appears
  {
    imageMode(CENTER);
    image(scaryOne, displayWidth/2, displayHeight/2, displayHeight, displayHeight); //resize scary image to fill the window
  }
}
