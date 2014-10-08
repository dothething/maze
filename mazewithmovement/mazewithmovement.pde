/* A lot of props goes to Sharang Biswas' voodoo doll sketch.

Here's a version with a red ball, whose location is xPos, yPos, which can be set 
by variable resistors (potentiometers?) on the Arduino.
*/

PGraphics canvas;
PImage maze;
PImage scaryOne;
color c=color(255,255,255); //background color as white for comparison
float xPos=0; //always start the ball at center, or start, of circle maze
float yPos=0;


int screenX=561; 
int screenY=563; //size of background and images

//setup
void setup()
{
  size(screenX, screenY);
  maze = loadImage("maze3.png");
  canvas = createGraphics(screenX,screenY);
  
}

//draw stuff!!
void draw() 
{
  canvas.beginDraw(); 
  canvas.background(maze);
  canvas.endDraw();
  
  background(maze); // set the background as maze
  
  fill(255,0,0);  
  noStroke();
  ellipse(xPos, yPos, 10,10); //red ball at center. With serial communication, can change xPos and yPos with potentiometers
  
  
if (canvas.get(mouseX,mouseY)!=c) //if mouse falls within the shape, scary image appears
  {
    scaryOne = loadImage("scary2.png");
    image(scaryOne, 0, 0, screenX, screenY); //resize scary image to fill the window
    

  }
}
