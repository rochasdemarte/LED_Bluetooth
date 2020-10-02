import processing.serial.*;

Serial port;
String PORT;
String data;

int rValue;
int gValue;
int bValue;
boolean isOver;

int xLoc;
int ctrlSize;

void setup() {
  size(720,480);
  xLoc = width/6;
  ctrlSize = width/6;
  
  port = new Serial(this, PORT, 38400);
  port.bufferUntil('\n');
}

void draw() {
  background(250);
  printArray(data);
  
  textSize(42);
  fill(250);
  strokeWeight(3);
  ellipseMode(CENTER);
  stroke(rValue);
  ellipse(xLoc, height*0.7, ctrlSize, ctrlSize);
  stroke(gValue);
  ellipse(xLoc*3, height*0.7, ctrlSize, ctrlSize);
  stroke(bValue);
  ellipse(xLoc*5, height*0.7, ctrlSize, ctrlSize);
}

void keyPressed() {
  port.write(key);
}

void serialEvent(Serial port) {
  data = port.readStringUntil('\n');
}
