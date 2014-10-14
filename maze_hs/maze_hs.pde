import processing.serial.*;
import ddf.minim.*;

Serial myPort;
boolean firstContact = false;
String input;

Minim minim1;
Minim minim2;
Minim minim3;
Minim minim4;
Minim minim5;
Minim minim6;
Minim minim7;
Minim minim8;
Minim minim9;
Minim minim10;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;

int bpm = 0;
float mult = 1;

int score = 0;
int kittenCount = 0;

int dangerFrame = -10;

//PImage k9;
PImage doge;
PImage maze;
PImage ks;
PImage ws;
PImage[] scary = new PImage[21];
PImage[] kitten = new PImage[11];

int index = 0;

float[] values = {525.0, 502.0, 70.0};
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

void playScarySound(int i) {
  int newIndex = floor(map(float(i), 0, scary.length-1, 0, 6.99));
  if (newIndex == 0) {
    player2 = minim2.loadFile("m0.mp3");
    player2.play();
  } else if (newIndex == 1) {
    player3 = minim3.loadFile("m1.mp3");
    player3.play();
  } else if (newIndex == 2) {
    player4 = minim4.loadFile("m2.wav");
    player4.play();
  } else if (newIndex == 3) {
    player9 = minim9.loadFile("m7.wav");
    player9.play();
  } else if (newIndex == 4) {
    player6 = minim6.loadFile("m4.wav");
    player6.play();
  } else if (newIndex == 5) {
    player7 = minim7.loadFile("m5.wav");
    player7.play();
  } else if (newIndex == 6) {
    player8 = minim8.loadFile("m6.wav");
    player8.play();
  }
}

void setup() {
  String portName = "/dev/tty.usbmodem1421";
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  input = null;
  
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  minim3 = new Minim(this); 
  minim4 = new Minim(this);
  minim5 = new Minim(this);
  minim6 = new Minim(this);
  minim7 = new Minim(this);
  minim8 = new Minim(this);
  minim9 = new Minim(this);
  minim10 = new Minim(this);
  player1 = minim1.loadFile("chiptune.wav");
  player1.loop();
  
  size(displayWidth, displayHeight);
  
  //k9 = loadImage("k9.png");
  doge = loadImage("d.png");
  maze = loadImage("m0.png");
  ks = loadImage("ks.png");
  ws = loadImage("ws.png");
  for (int i=0; i<scary.length; i++) {
    scary[i] = loadImage("s" + i + ".jpg");
  }
  for (int i=0; i<kitten.length; i++) {
    kitten[i] = loadImage("k" + i + ".png");
  }
  
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
    score -= 10;
    dangerFrame = frameCount;
    index = int(random(scary.length));
    playScarySound(index);
  }
  
  float rereverser = 1;
  if (inWall) {
    rereverser = -3;
  }
  
  xVel *= reverser*rereverser;
  yVel *= reverser*rereverser;
  
  xPos += xVel;
  yPos += yVel;
  
  // Draw the dots
  for (int i = 0; i < 174; i++) {
    dots[i].display();
  }
  
  // Draw the player's ball
  // fill(ballColor);  
  // noStroke();
  // ellipse(xPos, yPos, 10, 10);
  imageMode(CENTER);
  image(doge, xPos, yPos);
  
  // If touching wall, show scary image
  if (danger || frameCount <= dangerFrame + 10) {
    imageMode(CENTER);
    image(scary[index], displayWidth/2, displayHeight/2, displayWidth, displayHeight);
  }
  //println(score);
  
  // Display score
  textAlign(LEFT);
  textSize(32);
  fill(0);
  text("SCORE: " + score, 50, 50);
  
  // Display bpm
  int sw = floor(map(bpm, 0, 200, 1, 20.99));
  fill(250,0,0);
  stroke(250,0,0);         
  strokeWeight(sw);         
  smooth();   
  bezier(width-100,50, width-20,-20, width,140, width-100,150);
  bezier(width-100,50, width-190,-20, width-200,140, width-100,150);         

  fill(0);
  textAlign(CENTER);
  text(bpm + " BPM", 1180, 100);    
  
  // Display Kitten Values
  imageMode(CENTER);
  textAlign(LEFT);
  textSize(16);
  for (int i=0; i<kitten.length; i++) {
    image(kitten[i], 100, 190+(50*i));
    text(25*(i+1) + " points", 125, 200+(50*i));
  }
    
  
  // Kill Screen
  if (score < 0) {
    imageMode(CORNER);
    image(ks, 0, 0);
  }
  
  if (kittenCount > 173) {
    imageMode(CORNER);
    image(ws, 0, 0);
  }
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
      int[] sensors = int(split(input, ","));
      if (sensors.length > 1) {
        values[0] = float(sensors[0]);
        values[1] = float(sensors[1]);
      }
      if (sensors.length == 3) {
        values[2] = float(sensors[2]);
        bpm = int(values[2]);
        mult = map(values[2], 40, 160, 0, 2);
      }
    }
    myPort.write('A');
   
    
    if (values[0] > 525.0) {
      yVel = map(values[0], 525, 1023, 0, -3*mult);
    } else if (values[0] < 525.0) {
      yVel = map(values[0], 0, 525, 3*mult, 0);
    } else {
      yVel = 0;
    }
    if (values[1] > 502.0) {
      xVel = map(values[1], 502, 1023, 0, 3*mult);
    } else if (values[1] < 502.0) {
      xVel = map(values[1], 0, 502, -3*mult, 0);
    } else {
      xVel = 0;
    }
  }
}
