import processing.serial.*;

Serial myPort;

PImage maze;
PImage scaryOne;
float[] values = {525.0, 502.0};
float xPos;
float yPos;
float xVel;
float yVel;

color white = color(255);

void setup()
{
  size(displayWidth, displayHeight);
  maze = loadImage("m0.png");
  scaryOne = loadImage("scary2.png");
  xPos = displayWidth/2;
  yPos = displayHeight/2;
  xVel = 0;
  yVel = 0;
  
  String portName = "/dev/tty.usbmodem1411";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  // values[0] = 525.0;
  // values[1] = 502.0;
}

//draw stuff!!
void draw() 
{
  if (values[0] > 525.0) {
    yVel = map(values[0], 525, 1023, 0, -5);
  } else if (values[0] < 525.0) {
    yVel = map(values[0], 0, 525, 5, 0);
  } else {
    yVel = 0;
  }
  if (values[1] > 502.0) {
    xVel = map(values[1], 502, 1023, 0, 5);
  } else if (values[1] < 502.0) {
    xVel = map(values[1], 0, 502, -5, 0);
  } else {
    xVel = 0;
  }
  
  background(white);
  
  xPos += xVel;
  yPos += yVel;

  fill(255, 0, 0);  
  noStroke();
  ellipse(xPos, yPos, 10, 10); //red ball at center. With serial communication, can change xPos and yPos with potentiometers
  
  
  imageMode(CENTER);
  image(maze, displayWidth/2, displayHeight/2, displayHeight, displayHeight);

  if (get(mouseX, mouseY) != white) //if mouse falls within the shape, scary image appears
  {
    imageMode(CENTER);
    image(scaryOne, displayWidth/2, displayHeight/2, displayHeight, displayHeight); //resize scary image to fill the window
  }
}

void serialEvent(Serial myPort) {
  String input = myPort.readStringUntil('\n');
  if (input != null) {
    String[] numbers = split(input, ',');
    values[0] = float(numbers[0]);
    values[1] = float(numbers[1]);
    println(values);
  }
}
