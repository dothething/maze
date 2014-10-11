import processing.serial.*;

Serial myPort;
boolean firstContact = false;
String input;

int score = 0;

PImage maze;
PImage scaryOne;
float[] values = {525.0, 502.0};
float xPos;
float yPos;
float xVel;
float yVel;

PVector circlePos;
PVector[] circleEdge;
PVector edge0, edge1, edge2, edge3, edge4, edge5, edge6, edge7;

color white = color(255);
color ballColor = color(255, 0, 0);
color dotColor = color(253, 253, 150);

boolean centerCheck() {
  boolean insideWall = false;
  color centerPtColor = get(int(xPos), int(yPos));
  if (centerPtColor != white) {
    insideWall = true;
  }
  return insideWall;
}

boolean wallCheck() {
  boolean wallTouch = false;
  color edgePointColor = color(255, 0, 0);
  circlePos = new PVector(xPos, yPos);
  circleEdge[0] = PVector.add(circlePos, edge0);
  circleEdge[1] = PVector.add(circlePos, edge1);
  circleEdge[2] = PVector.add(circlePos, edge2);
  circleEdge[3] = PVector.add(circlePos, edge3);
  circleEdge[4] = PVector.add(circlePos, edge4);
  circleEdge[5] = PVector.add(circlePos, edge5);
  circleEdge[6] = PVector.add(circlePos, edge6);
  circleEdge[7] = PVector.add(circlePos, edge7);
  //println(circleEdge[0].x);
  for (int i = 0; i < 8; i++) {
    edgePointColor = get(int(circleEdge[i].x), int(circleEdge[i].y));
    if (edgePointColor != white) {
      wallTouch = true;
    }
  }
  return wallTouch;
}

void setup() {
  String portName = "/dev/tty.usbmodem1421";
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  input = null;
  
  size(displayWidth, displayHeight);
  maze = loadImage("m0.png");
  scaryOne = loadImage("scary2.png");
  xPos = displayWidth/2;
  yPos = displayHeight-30;
  xVel = 0;
  yVel = 0;
  
  circleEdge = new PVector[8];
  edge0 = new PVector(0, -4.5);
  edge1 = new PVector(4.5, 0);
  edge2 = new PVector(0, 4.5);
  edge3 = new PVector(-4.5, 0);
  edge4 = new PVector(4.5/sqrt(2), -4.5/sqrt(2));
  edge5 = new PVector(4.5/sqrt(2), 4.5/sqrt(2));
  edge6 = new PVector(-4.5/sqrt(2), 4.5/sqrt(2));
  edge7 = new PVector(-4.5/sqrt(2), -4.5/sqrt(2));
  
  for (int i = 0; i < 174; i++) {
    dots[i] = new Dot(dotLocations[i].x, dotLocations[i].y);
  }
}


void draw() {
  background(white);
  
  imageMode(CENTER);
  image(maze, displayWidth/2, displayHeight/2, displayHeight, displayHeight);
  
  boolean danger = wallCheck();
  //println(danger);
  
  boolean inWall = centerCheck();
  
  float reverser = 1;
  if (danger) {
    reverser = -3;
  }
  
  float rereverser = 1;
  if (inWall) {
    rereverser = -3;
  }
  
  xVel *= reverser*rereverser;
  yVel *= reverser*rereverser;
  
  xPos += xVel;
  yPos += yVel;
  
  for (int i = 0; i < 174; i++) {
    dots[i].display();
  }

  fill(ballColor);  
  noStroke();
  ellipse(xPos, yPos, 10, 10); //red ball at center. With serial communication, can change xPos and yPos with potentiometers

  // if (get(mouseX, mouseY) != white) {
  //   imageMode(CENTER);
  //   image(scaryOne, displayWidth/2, displayHeight/2, displayHeight, displayHeight);
  // } 
}

void serialEvent(Serial myPort) {
  input = myPort.readStringUntil('\n');
  if (input != null) {
    input = trim(input);
    if (firstContact == false) {
      if (input.equals("hello")) {
        myPort.clear();
        firstContact = true;
        myPort.write('A');
      }
    }
    else {
      int[] sensors = int(split(input, ',')); // maybe put brackets in front of "int"?
      if (sensors.length > 1) {
        values[0] = float(sensors[0]);
        values[1] = float(sensors[1]);
      }
    }
    myPort.write('A');
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
  }
}
