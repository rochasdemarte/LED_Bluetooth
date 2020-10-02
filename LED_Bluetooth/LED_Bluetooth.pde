import java.awt.*;
import processing.serial.*;

Serial port;

String PORT, data = "", serialData = "";
int rValue, gValue, bValue, gMouseX = 0, gMouseY = 0, xLoc, ctrlSize, corTexto = 0, corFundo = 255;
float screenPosX, screenPosY, factorX, factorY;
boolean isOver;
color corLED;

void settings() {
  fullScreen();
}

void setup() {
  surface.setSize(320,550);
  xLoc = width/6;
  ctrlSize = width/5;
  
  if(Serial.list().length > 0){
    PORT = Serial.list()[0];
    port = new Serial(this, PORT, 38400);
    port.bufferUntil('\n');  
  }
}

void draw() {
  corLED = color(rValue,gValue,bValue);
  background(corFundo); 
  stroke(corLED);
  strokeWeight(1);
  fill(corFundo);
  rectMode(CENTER);
  rect(width/2,height/2,width*0.9,height*0.95,10);
  ellipseMode(CENTER);
  ellipse(xLoc*3, height*0.5, ctrlSize*2.9, ctrlSize*2.9);
  ellipse(xLoc*3, height*0.15, ctrlSize, ctrlSize);
  ellipse(xLoc*3, height*0.85, ctrlSize, ctrlSize);
  noStroke();
  colorMode(HSB, 360);
  for (int i = 0; i < 360; i++) {
    fill(i, 360, 360);
    //point(i, j);
    arc(xLoc*3, height*0.5, ctrlSize*(2.8), ctrlSize*(2.8), radians(float(i)), radians(float(i+1)), PIE);
  }
  colorMode(RGB, 255);
  fill(corTexto);
  textSize(42);
  text(serialData,20,20);
  data = "r"+rValue+"g"+gValue+"b"+bValue+"f";
  //port.write(data);

  globally ();
}

void globally () {
  surface.setLocation((int) screenPosX, (int) screenPosY);
  
  Point location = MouseInfo.getPointerInfo().getLocation();
  gMouseX = (int) location.getX();  // global mouse position along X
  gMouseY = (int) location.getY();  // global mouse position along Y
}

void mousePressed() {
  factorX = mouseX;
  factorY = mouseY;
}

void mouseDragged() {
  screenPosX = MouseInfo.getPointerInfo().getLocation().x - factorX;
  screenPosY = MouseInfo.getPointerInfo().getLocation().y - factorY;
}

void keyPressed() {
}

void serialEvent(Serial port) {
  serialData = port.readStringUntil('\n');
}
